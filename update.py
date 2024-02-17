import sys
import toml

# Check if a new version number was provided as a command-line argument
if len(sys.argv) < 2:
    print("Usage: python script.py <new_version>")
    sys.exit(1)

new_version = sys.argv[1]  # Get the new version number from the command-line arguments

# Define the TOML content
toml_content = """
[package]
name = "workingpaper"
version = "0.2.5"
entrypoint = "paper_template.typ"
authors = ["Jiaxin PENG"]
license = "Unlicense"
description = "Personal working paper template"
"""

# Parse the TOML content
parsed_toml = toml.loads(toml_content)

# Update the version
parsed_toml["package"]["version"] = new_version

# Define a file path to save the updated TOML content
file_path = "typst.toml"

# Write the updated TOML content to a file
with open(file_path, "w") as file:
    toml.dump(parsed_toml, file)

print(f"Updated TOML file saved to {file_path}")
