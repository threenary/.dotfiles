# Removes merged branches from remote
git fetch origin
git checkout main
git merge origin/main
for branch in $(git branch -r --merged | grep -v '\->' | grep origin | grep -v 'main' | sed 's/origin\///'); do
    echo "Deleting branch $branch"
    git push origin --delete $branch 2>/dev/null || echo "Skipping $branch as it does not exist or could not be deleted"
done