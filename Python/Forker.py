#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess
import zipfile
from pathlib import Path

REPO_URL  = "https://github.com/nivalos0/PrizzLife.git"
REPO_NAME = "PrizzLife"

# ── ANSI colors ───────────────────────────────────────────────────────────────
R   = "\033[91m"
G   = "\033[92m"
Y   = "\033[93m"
C   = "\033[96m"
B   = "\033[94m"
W   = "\033[97m"
DIM = "\033[2m"
RST = "\033[0m"

def banner():
    print(f"""
{B}╔══════════════════════════════════════════╗
║  {W}PrizzLife Repo Cloner{B}                     ║
║  {DIM}github.com/nivalos0/PrizzLife{B}            ║
╚══════════════════════════════════════════╝{RST}
""")

def ask(prompt: str) -> bool:
    while True:
        ans = input(f"{Y}{prompt} {DIM}[y/n]{RST} ").strip().lower()
        if ans in ("y", "yes"):
            return True
        if ans in ("n", "no"):
            return False
        print(f"{R}  Please enter y or n.{RST}")

def run(cmd: list[str], capture=False, cwd=None):
    result = subprocess.run(cmd, capture_output=capture, text=True, cwd=cwd)
    if result.returncode != 0:
        print(f"{R}[ERROR] Command failed: {' '.join(cmd)}{RST}")
        if capture and result.stderr:
            print(f"{DIM}{result.stderr.strip()}{RST}")
        sys.exit(1)
    return result


def clone_all_branches(output_dir: Path):
    """
    Bare-clone the repo, then use git worktree to extract every branch
    into its own named subfolder so all branch files exist on disk at once.

    Layout:
        PrizzLife/
            .git_bare/          ← bare clone (internal, hidden)
            main/               ← files from main branch
            other-branch/       ← files from every other branch
            …
    """
    if output_dir.exists():
        print(f"{Y}  ⚠  '{output_dir}' already exists — removing it.{RST}")
        shutil.rmtree(output_dir)

    output_dir.mkdir(parents=True)
    bare_dir = output_dir / ".git_bare"

    # 1. Bare clone — downloads all refs without checking anything out
    print(f"{C}  Cloning (bare) from {REPO_URL} …{RST}")
    run(["git", "clone", "--bare", REPO_URL, str(bare_dir)])

    # 2. Fix refspec so fetch sees all remote branches
    run(
        ["git", "config", "remote.origin.fetch",
         "+refs/heads/*:refs/remotes/origin/*"],
        cwd=bare_dir
    )
    run(["git", "fetch", "--all"], cwd=bare_dir)

    # 3. List every remote branch
    result = run(["git", "branch", "-r"], capture=True, cwd=bare_dir)
    remote_branches = []
    for line in result.stdout.splitlines():
        line = line.strip()
        if not line or "->" in line:
            continue
        local_name = line.split("/", 1)[-1]   # "origin/main" → "main"
        remote_branches.append(local_name)

    if not remote_branches:
        print(f"{R}  No remote branches found!{RST}")
        sys.exit(1)

    print(f"{G}  Found {len(remote_branches)} branch(es): {', '.join(remote_branches)}{RST}\n")

    # 4. Extract each branch into its own subfolder via worktree
    for branch in remote_branches:
        worktree_path = output_dir / branch
        print(f"  {C}↳ Extracting '{branch}' → {output_dir.name}/{branch}/{RST}")

        # Check if a local branch already exists (bare clones create them automatically)
        check = subprocess.run(
            ["git", "show-ref", "--verify", "--quiet", f"refs/heads/{branch}"],
            cwd=bare_dir
        )
        if check.returncode == 0:
            # Local branch already exists — just add the worktree pointing at it
            run(
                ["git", "worktree", "add", str(worktree_path), branch],
                cwd=bare_dir
            )
        else:
            # No local branch yet — create and track it from remote
            run(
                ["git", "worktree", "add",
                 "--track", "-b", branch,
                 str(worktree_path),
                 f"origin/{branch}"],
                cwd=bare_dir
            )

    # 5. Print final structure
    print(f"\n{G}  ✔ Done! Branch folders:{RST}")
    for p in sorted(output_dir.iterdir()):
        if not p.name.startswith(".") and p.is_dir():
            file_count = sum(1 for _ in p.rglob("*") if _.is_file())
            print(f"  {DIM}  {output_dir.name}/{p.name}/  ({file_count} files){RST}")


def zip_folder(src: Path) -> Path:
    zip_path = src.parent / f"{REPO_NAME}.zip"
    print(f"\n{C}  Zipping '{src.name}' → '{zip_path.name}' …{RST}")
    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zf:
        for file in src.rglob("*"):
            if file.is_file():
                zf.write(file, file.relative_to(src.parent))
    size_mb = zip_path.stat().st_size / (1024 * 1024)
    print(f"{G}  ✔ Created {zip_path.name} ({size_mb:.2f} MB){RST}")
    return zip_path


def move_item(item: Path):
    while True:
        raw = input(f"{Y}  Enter destination path: {RST}").strip()
        if not raw:
            print(f"{R}  Path cannot be empty.{RST}")
            continue

        dest_dir = Path(os.path.expanduser(raw)).resolve()

        if not dest_dir.exists():
            if ask(f"  '{dest_dir}' doesn't exist. Create it?"):
                dest_dir.mkdir(parents=True, exist_ok=True)
            else:
                print(f"{Y}  Skipping move.{RST}")
                return

        final = dest_dir / item.name
        if final.exists():
            if not ask(f"  '{final}' already exists. Overwrite?"):
                print(f"{Y}  Skipping move.{RST}")
                return
            shutil.rmtree(final) if final.is_dir() else final.unlink()

        shutil.move(str(item), str(dest_dir))
        print(f"{G}  ✔ Moved to {dest_dir / item.name}{RST}")
        return


def main():
    banner()

    script_dir = Path(__file__).parent.resolve()
    output_dir = script_dir / REPO_NAME

    # Step 1: Clone
    print(f"{C}[1/3] Cloning all branches …{RST}")
    clone_all_branches(output_dir)

    # Step 2: Zip?
    print()
    target = output_dir
    if ask("[2/3] Would you like to compile everything into a .zip?"):
        target = zip_folder(output_dir)
        if not ask("      Keep the unzipped folder too?"):
            shutil.rmtree(output_dir)
            print(f"{DIM}      Removed '{output_dir.name}'{RST}")

    # Step 3: Move?
    print()
    if ask(f"[3/3] Move '{target.name}' to a specific directory?"):
        move_item(target)

    print(f"\n{G}All done! ✔{RST}\n")


if __name__ == "__main__":
    main()