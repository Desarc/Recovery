#################################################################################################
# Checkout main, pull from main, prune main to remove branches that are merged with main
################################################################################################

git checkout main
git pull
git remote prune origin
git branch --merged | grep -v "\*" | xargs -rn 1 git branch -d