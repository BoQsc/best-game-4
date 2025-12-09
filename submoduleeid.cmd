# Navigate to best-game-4 root
cd C:\Users\Windows10_new\Documents\best-game-4

# Step 1: Restore deleted main_menu files (undo git rm)
git restore --staged main_menu
git restore main_menu
git submodule update --init main_menu

# Step 2: Remove game_world submodule from parent repo
git submodule deinit -f game_world
git rm -f game_world
Remove-Item -Recurse -Force .git\modules\game_world -ErrorAction SilentlyContinue

# Step 3: Commit the removal
git commit -m "Remove game_world submodule from parent"

# Step 4: Add game_world as submodule inside main_menu
cd main_menu
git submodule add -b terrain-03-further-mid-stutter-vegetation-fix https://github.com/BoQsc/gpu-marching-cubes game_world

# Step 5: Commit the addition in main_menu
git add .
git commit -m "Add game_world as submodule inside main_menu"

# Done! Now main_menu has game_world inside it