# C++ Quick Compile & Run

A simple Bash script to compile and optionally run a single C++26 file using Clang++.

## Requirements

- clang++ (or g++) with C++26 support
- Bash

## Installation

Clone the repository and make the script executable:

```bash
git clone https://github.com/nikitu0008-collab/Compile-C-.git
cd cpp-compile-run
chmod +x compile.sh
Optionally, add the script to your PATH.
Usage
bash

./compile.sh myfile.cpp

The script will compile myfile.cpp to myfile (executable) and ask if you want to run it.
Options

    -o <output> – specify output executable name.

    -c <compiler> – choose compiler (clang++ or g++), default is clang++.

    -h, --help – show help.

Example:
bash

./compile.sh -c g++ -o myapp src/main.cpp
