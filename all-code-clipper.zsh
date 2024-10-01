#!/bin/zsh

# Define an array of file extensions you want to include
extensions=("*.c" "*.cpp" "*.py" "*.js" "*.ts" "*.java" "*.go" "*.rb" "*.php" "*.swift")

# Build the find command
find_command="find . -type f \\("
for ext in "${extensions[@]}"; do
    find_command+=" -name \"$ext\" -o"
done
# Remove the last -o and close the parentheses
find_command="${find_command::-2} \\)"

# Execute the find command and concatenate files into the clipboard
eval "$find_command -exec cat {} + | pbcopy"

echo "Code files copied to clipboard!"
