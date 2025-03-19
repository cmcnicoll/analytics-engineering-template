#!/bin/bash

# Extension ID for samuelcolvin.jinjahtml
EXTENSION_ID="samuelcolvin.jinjahtml"

# Find the language-configuration.json file for the specific extension
CONFIG_FILE=$(find ~/.vscode-server/extensions/ -type f -path "*/$EXTENSION_ID*/language-configuration.json")

# Log the found configuration file
if [ -z "$CONFIG_FILE" ]; then
  echo "language-configuration.json for extension $EXTENSION_ID not found!"
  exit 1
else
  echo "Found language-configuration.json at: $CONFIG_FILE"
fi

# Output the original file to verify its contents before modification
echo "Original language-configuration.json:"
cat "$CONFIG_FILE"

# Log before modifying the file
echo "Removing comments and modifying language-configuration.json..."

# Strip comments from JSON and then use jq to modify the configuration
jq '{
  comments: {
    lineComment: "--",
    blockComment: ["/*", "*/"]
  },
  brackets: .brackets,
  autoClosingPairs: .autoClosingPairs,
  surroundingPairs: .surroundingPairs,
  folding: .folding
}' < <(sed '/^\s*\/\//d' "$CONFIG_FILE" | sed '/^\s*\/\*/,/^\s*\*\//d') > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"

# Log after modifying the file
echo "Modification complete."

# Output the modified file to verify the changes
echo "Modified language-configuration.json:"
cat "$CONFIG_FILE"

# Log script completion
echo "Script execution finished."
