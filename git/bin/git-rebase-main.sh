#################################################################################################
# Checkout main, pull from main, checkout current branch, rebase on main
################################################################################################

currentBranch=$(git rev-parse --abbrev-ref HEAD)

git stash
git checkout main
git pull origin main
git checkout $currentBranch
git rebase main
