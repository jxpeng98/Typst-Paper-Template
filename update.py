import sys
import re
from datetime import datetime
from pathlib import Path

####################
# Modify TOML
####################

# Check if a new version number was provided as a command-line argument
if len(sys.argv) < 2:
    print("Usage: python script.py <new_version>")
    sys.exit(1)

new_version = sys.argv[1]  # Get the new version number from the command-line arguments

# Define a file path to save the updated TOML content
file_path = Path("typst.toml")

if not file_path.exists():
    print(f"Error: {file_path} does not exist.")
    sys.exit(1)

# Read existing TOML content
toml_content = file_path.read_text(encoding="utf-8")

# Update the version while preserving formatting
version_pattern = re.compile(r'^(version\s*=\s*)"([^"]+)"', re.MULTILINE)

def replace_version(match) -> str:
    prefix = match.group(1)
    return f'{prefix}"{new_version}"'

updated_toml, replacements = version_pattern.subn(replace_version, toml_content, count=1)

if replacements == 0:
    print("Error: Could not find a version entry in typst.toml.")
    sys.exit(1)

# Write the updated TOML content to a file
file_path.write_text(updated_toml, encoding="utf-8")

print(f"Updated TOML file saved to {file_path}")


####################
# Update .typ file
####################

new_year = datetime.now().year
new_date = datetime.now().strftime("%Y-%m-%d")
# Define the path to your .typ file
typ_file_path = Path('paper_template.typ')

# Define the content to prepend, ensure no leading newline before the first comment line
new_content_to_prepend = f"""///////////////////////////////
// A clean academic working-paper and preprint template.
// Copyright (c) {new_year}
// Author:  Academic Template Collective
// License: MIT
// Version: {new_version}
// Date:    {new_date}
// Email:   maintainers@example.invalid
///////////////////////////////

"""  # Ensuring only the intended newlines are included

try:
    original_content = typ_file_path.read_text(encoding='utf-8')
except FileNotFoundError:
    print(f"Error: File not found at {typ_file_path}")
    sys.exit(1)
except Exception as exc:
    print(f"An error occurred while reading the file: {exc}")
    sys.exit(1)

# Pattern to match the existing header, assuming it's always at the start of the file
header_pattern = re.compile(r'^\/\/+[\s\S]*?\/\/+\n\n', re.MULTILINE)

# Check if the existing header is present and replace it
if header_pattern.search(original_content):
    updated_content = header_pattern.sub(new_content_to_prepend, original_content, count=1)
else:
    # If no header is found, prepend new header without adding an extra newline at the beginning
    updated_content = new_content_to_prepend.rstrip('\n') + original_content

try:
    typ_file_path.write_text(updated_content, encoding='utf-8')
except Exception as exc:
    print(f"An error occurred while writing to the file: {exc}")
    sys.exit(1)

print("Template File has been updated with the new version and date.")

# update the main.typ file
def update_main(main_typ_file_path, new_version):
    """Update the preview import in the paper template entrypoint."""
    path = Path(main_typ_file_path)
    new_import = f'#import "@preview/ssrn-scribe:{new_version}": *\n\n'

    try:
        original_content = path.read_text(encoding='utf-8')
    except FileNotFoundError:
        print(f"Error: File not found at {path}")
        return
    except Exception as exc:
        print(f"An error occurred while reading the file: {exc}")
        return

    header_pattern = re.compile(
        r'^#import\s+"@preview/ssrn-scribe:([^"]+)"\s*:\s*\*\s*\n',
        re.MULTILINE
    )

    if header_pattern.search(original_content):
        updated_content = header_pattern.sub(new_import, original_content, count=1)
    else:
        updated_content = new_import.rstrip('\n') + original_content

    try:
        path.write_text(updated_content, encoding='utf-8')
    except Exception as exc:
        print(f"An error occurred while writing to the file: {exc}")
        return

    print(f"Main Typ File {path} has been updated with the new version.")


update_main('template/main.typ', new_version)
