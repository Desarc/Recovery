#################################################################################################
# Checkout main, pull from main, prune main to remove branches that are merged with main
################################################################################################

git stash
git checkout main
git pull
git remote prune origin
git branch --merged main --no-color | grep -v '^[ *]*main$' | xargs -rn 1 git branch -d
git stash pop