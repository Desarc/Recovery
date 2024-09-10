#################################################################################################
# Checkout master, pull from master, checkout current branch, rebase on master
################################################################################################

currentBranch=$(git rev-parse --abbrev-ref HEAD)

git stash
git checkout master
git pull
git checkout $currentBranch
git rebase master
