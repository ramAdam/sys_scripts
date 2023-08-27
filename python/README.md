## Python Project Template Creator

### Description

The `create_python_project.sh` script simplifies the process of creating a Python project template. It sets up a standardized directory structure for your Python projects, including source code, tests, documentation, and more. The script also initializes a virtual environment, sets up a Git repository, and generates basic module and test files.

### How to Use

1. Run the script with the desired project name as an argument.
   Example: `./create_python_project.sh my_project`

2. This will create a directory named `my_project` (replace with your desired project name) with the standardized structure. It includes subdirectories for source code, tests, documentation, and more.

3. It also initialize the project with git command

4. See the generated README.md to test the generated template.

### Project Structure
```
project_name/
├── bin/
├── docs/
│   ├── hello.md
│   └── world.md
├── project_name/
│   ├── __init__.py
│   ├── runner.py
│   ├── hello/
│   │   ├── __init__.py
│   │   ├── hello.py
│   │   └── helpers.py
│   └── world/
│       ├── __init__.py
│       ├── helpers.py
│       └── world.py
├── data/
│   ├── input.csv
│   └── output.xlsx
├── tests/
│   ├── hello
│   │   ├── helpers_tests.py
│   │   └── hello_tests.py
│   └── world/
│       ├── helpers_tests.py
│       └── world_tests.py
├── .gitignore
├── LICENSE
└── README.md
```
