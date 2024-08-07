# Assembly System Calls and Interacting with OS

This repository contains exercises and examples focused on system calls and interacting with the operating system using
assembly language. These examples are built using NASM assembler on a Windows x64 environment, and they illustrate how
to interact with OS services at a low level.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Exercises](#exercises)
    - [Exercise 1: Simple System Call](#exercise-1-simple-system-call)
    - [Exercise 2: File Reading System Call](#exercise-2-file-reading-system-call)
    - [Exercise 3: Process Management](#exercise-3-process-management)
- [Running the Examples](#running-the-examples)
- [References](#references)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This repository explores advanced concepts in assembly language, focusing on making system calls and interacting with
the OS directly. It includes practical examples that demonstrate how to:

- Perform basic system calls.
- Read files using system calls.
- Manage processes in a Windows x64 environment.

## Prerequisites

Before running the examples in this repository, ensure you have the following tools installed:

- **NASM (Netwide Assembler):** A popular assembler for the x86 architecture.
- **MinGW-w64:** A toolchain to compile and link your assembly code in a Windows environment.
- **Windows x64 OS:** The examples in this repository are designed to run on a 64-bit version of Windows.

## Setup

1. Clone the repository:
    ```bash
   git clone https://github.com/kavicastelo/assembly_system_calls_and_interacting_with_os.git
   ccd assembly_system_calls_and_interacting_with_os
    ```
2. Install NASM and MinGW-w64:
   Follow the instructions from their official websites:
    - [NASM](https://nasm.us)
    - [MinGW-w64](https://sourceforge.net/projects/mingw-w64/)

3. Set up environment variables:
   Make sure NASM and MinGW-w64 are accessible from the command line by adding their installation paths to your
   system's `PATH` environment variable.

## Exercises

### Exercise 1: Simple System Call

This exercise demonstrates how to make a basic system call to print a message to the console.

- Source file: `ex1/EX1.asm`
- Output: "Hello, World!"

### Exercise 2: File Reading System Call

This exercise shows how to read a file using system calls and print its contents.

- Source file: `ex2/EX2.asm`
- Input: A text file to be read.
- Output: Contents of the text file.

### Exercise 3: Process Management

This exercise explores process management, including creating and managing processes via system calls.

- Source file: `ex3/EX3.asm`
- Output: Log messages indicating the success or failure of process creation.

## Running the Examples

To assemble and link the examples, follow these steps:

1. Assemble the code:
    ```bash
   nasm -f win64 <filename>.asm -o <filename>.o
    ```
2. Link the code:
    ```bash
   gcc -m64 -o <filename> <filename>.o -lkernel32 -lmsvcrt
    ```
3. Execute the code:
    ```bash
   .\<filename>.exe
    ```

Replace `<filename>` with the specific example you are running.

## References

- [NASM Documentation](https://nasm.us)
- [MinGW-w64 Documentation](https://sourceforge.net/projects/mingw-w64/)
- [Windows API Documentation](https://docs.microsoft.com/en-us/windows/win32/api/)

## Contributing

Contributions are welcome! If you have any suggestions, bug fixes, or improvements, feel free to open an issue or submit
a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
