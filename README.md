# How to create a vivado github repo shared

Create the project, initialize the git repo in project root, add the gitignore file from this repo and commit changes, push to origin remote repo.

Then, other person creates vivado project with SAME EXACT NAME, and then initializes a git repository in the project root as well.

Add the remote repo as origin, and run `git fetch origin`. Then, in order to cover any merge conflicts and unrelated histories, sync with the remote main branch with `git reset --hard origin/main`.

Make sure all code written is not in main branch, main branch is for merging into.
