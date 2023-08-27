#!/bin/bash

# Check if a project name is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

project_name="$1"
workspace_dir="$HOME/workspace"
project_dir="$workspace_dir/$project_name"

# Change directory to where the script is located
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$script_dir"

# Create workspace directory if it doesn't exist
mkdir -p "$workspace_dir"

# Create project directory
mkdir -p "$project_dir/bin"
mkdir -p "$project_dir/docs"
mkdir -p "$project_dir/$project_name"
mkdir -p "$project_dir/data"
mkdir -p "$project_dir/tests/hello"
mkdir -p "$project_dir/tests/world"
cd "$project_dir"

# Create project files and directories
touch .gitignore
touch LICENSE
touch README.md

# Create .gitignore file with contents
cat << EOF > .gitignore
__pycache__/
*.pyc
*.pyo
*.pyd
*.db
*.sqlite3
*.log
*.xlsx
*.csv
*.egg-info/
*.pyc
*.pyo
*.pyd
*.so
build/
dist/
*.egg-info/
htmlcov/
.coverage
.idea/
.vscode/
.DS_Store
*.bak
*.swp
*.swo
*.komodoproject
*.komodotools
*.bak
*.tar.gz
*.tar
*.zip
EOF

# Create project package and submodules
cd "$project_dir/$project_name"
mkdir -p "hello"
mkdir -p "world"
cd "$project_dir/$project_name"
touch __init__.py
touch main.py
cd "$project_dir/$project_name/hello"
touch __init__.py
touch hello.py
touch helpers.py
cd "$project_dir/$project_name/world"
touch __init__.py
touch helpers.py
touch world.py
cd "$project_dir/tests/hello"
touch __init__.py
touch helpers_tests.py
touch hello_tests.py
cd "$project_dir/tests/world"
touch __init__.py
touch helpers_tests.py
touch world_tests.py
cd "$project_dir/docs"
touch hello.md
touch world.md
cd "$project_dir/data"
touch input.csv
touch output.xlsx

# Add sample content to code files
cat << EOF > "$project_dir/README.md"
# $project_name

This is the README file for the $project_name project.

## Running Tests

To run the tests for this project, make sure you have Python installed. Then, navigate to the root directory of the project in your terminal and execute the following command:

\`\`\`bash
python -m unittest discover -s tests -p "*_tests.py"
\`\`\`

This will discover and run all the test cases in the \`tests\` directory. Make sure the terminal's working directory is the root of the project before running the command.
EOF

cat << EOF > "$project_dir/$project_name/hello/helpers.py"
def say_hello(name):
    return f"Hello, {name}!"
EOF

cat << EOF > "$project_dir/tests/hello/helpers_tests.py"
import unittest
from $project_name.hello.helpers import say_hello

class TestHello(unittest.TestCase):
    def test_say_hello(self):
        result = say_hello("Alice")
        self.assertEqual(result, "Hello, Alice!")

if __name__ == "__main__":
    unittest.main()
EOF

cat << EOF > "$project_dir/$project_name/runner.py"
from hello.helpers import say_hello

def main():
    name = input("Enter your name: ")
    greeting = say_hello(name)
    print(greeting)

if __name__ == "__main__":
    main()
EOF

cd "$project_dir"

# Run tests
if python -m unittest discover -s tests -p "*_tests.py"; then
    # Tests passed, initialize Git repository
    git init

    # Add files and make initial commit
    git add .
    git commit -m "Initial commit: Set up project structure"

    echo -e "\e[32mPython project template '$project_name' created in '$project_dir', tests passed, and initialized with Git.\e[0m"
else
    # Tests failed
    echo -e "\e[31mTests failed. Aborting commit.\e[0m"
fi


