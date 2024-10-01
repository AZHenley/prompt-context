#!/bin/zsh

# Exit immediately if a command exits with a non-zero status
set -e

# Function to copy to clipboard using pbcopy (macOS only)
copy_to_clipboard() {
    pbcopy
}

# Ensure we are inside a Git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Error: This script must be run inside a Git repository." >&2
    exit 1
fi

# Get the top-level directory of the Git repository
REPO_ROOT=$(git rev-parse --show-toplevel)

# Navigate to the repository root to get relative paths
cd "$REPO_ROOT"

# Get list of unstaged modified files (only unstaged changes)
# Using git diff to list unstaged changes
MODIFIED_FILES=($(git diff --name-only))

# Check if there are modified files
if [[ ${#MODIFIED_FILES[@]} -eq 0 ]]; then
    echo "No unstaged modified files found."
    exit 0
fi

# Initialize an empty string to hold the concatenated content
CONCATENATED_CONTENT=""

# Iterate over each modified file
for FILE in "${MODIFIED_FILES[@]}"; do
    # Ensure the file exists (it might have been deleted)
    if [[ -f "$FILE" ]]; then
        # Get the relative path and filename
        RELATIVE_PATH="$FILE"
        FILENAME=$(basename "$FILE")

        # Append the prefix
        CONCATENATED_CONTENT+="// $RELATIVE_PATH\n"

        # Append the file contents
        # Using printf to preserve formatting and handle special characters
        FILE_CONTENT=$(printf "%s\n" "$(cat "$FILE")")
        CONCATENATED_CONTENT+="$FILE_CONTENT\n\n"  # Add extra newline for separation
    fi
done

# Remove the trailing newlines
CONCATENATED_CONTENT=$(echo "$CONCATENATED_CONTENT" | sed '/^\s*$/d')

# Copy the concatenated content to the clipboard
echo -e "$CONCATENATED_CONTENT" | copy_to_clipboard

echo "Unstaged modified files' content has been copied to the clipboard."


### Usage instructions.
# If needed, add to your path and make it executable: sudo cp git-clipper.zsh /usr/local/bin/git-clipper && sudo chmod +x /usr/local/bin/git-clipper
# Run: git-clipper