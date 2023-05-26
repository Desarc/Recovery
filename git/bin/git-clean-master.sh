#################################################################################################
# Checkout master, pull from master, prune master to remove branches that are merged with master
################################################################################################

git stash
git checkout master
git pull
git remote prune origin
git branch --merged master --no-color | grep -v '^[ *]*master$' | xargs -rn 1 git branch -d
git stash pop