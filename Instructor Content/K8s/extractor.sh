repo_url="https://github.com/lm-academy/kubernetes-course"
folder_path="containers/color-api"
repo_name="color-api-only"

# 1. Clone the repo without downloading files yet (blobless clone)
git clone --filter=blob:none --sparse $repo_url $repo_name

# 2. Enter the directory
cd $repo_name

# 3. Tell git to only pull the specific folder
git sparse-checkout set $folder_path

# 4. (Optional) Move files to root and remove git metadata to "detach" it
mv $folder_path/* .
rm -rf containers .git