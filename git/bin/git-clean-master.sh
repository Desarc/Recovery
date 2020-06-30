#################################################################################################
# Checkout master, pull from master, prune master to remove branches that are merged with master
################################################################################################

git checkout master 
git pull 
git remote prune origin 
git branch --merged | grep -v "\*" | xargs -rn 1 git branch -d