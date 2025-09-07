Linux Administration Project
This repository contains a comprehensive project completed as part of the Linux Administration Course with the Edges Training Team. The project is divided into three parts, each focusing on a key area of system administration.

Part 1: Bash Scripting
This section demonstrates proficiency in automating system tasks using Bash scripting.

userdef.sh: A script for advanced user and group management. It handles command-line arguments, checks for sudo permissions, creates a new user and group with specific UIDs and GIDs, and assigns a password without requiring user input.

direc.sh: A script that automates file and directory operations. It checks for existing directories, creates new files and folders, loops through files to add content, and manages permissions and ownership using commands like chown and chmod.

Part 2: Build Systems (Make & CMake)
This part showcases skills in managing complex software projects using industry-standard build tools. The folder contains a multi-module C project (caesar_cipher and xor_cipher) built using two different systems.

Makefiles: A complete Makefile hierarchy (Makefile, caesar_cipher.mk, xor_cipher.mk) that automates the build process, manages dependencies, generates static and dynamic libraries, and produces a final executable.

CMake: The equivalent CMake project (CMakeLists.txt files) that handles the same build requirements, demonstrating cross-platform build configuration.

Part 3: Process Management
This section focuses on C programming in a Linux environment and the fundamentals of process management.

Task_Manager.c: A C application that demonstrates process creation and execution. It uses fork() to create two child processes. Each child process then uses execv() to execute a system command (mpstat for CPU monitoring and ps for process monitoring), showing real-time system metrics.

Screenshots of the execution and output for each part are included in their respective folders to provide visual validation of the project's functionality.
