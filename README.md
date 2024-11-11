# 2420_linux_assignment_2

## Table of Contents
- [Introduction](#introduction)
- [Project 1](#project_1)
- [Project 2](#project_2)

## Introduction
This repository contains scripts for Assignment 2 of the ACIT 2420 course.
The assignment is divided into two projects, each with scripts to automate the setup of a project environment or to streamline user creation.

### To get started:
1. Ensure `git` is installed on your system.
2. Clone the repository:
   ```bash
   git clone https://github.com/inspiritilda/2420_linux_assignment_2.git
   ```

## project_1
Scripts to automate the setup of a new Linux Distro installation by installing packages and setting up configuration files.

### Scripts and Files
1. `install-packages`: Installs packages defined in `package-list`.
  Creates a package list if not present.
  * Usage:
    ```bash
    chmod +x install-packages
    sudo ./install-packages
    ```

2. `package-list`: A plain text file listing packages to be installed.

3. `setup`: Runs the entire setup process, including installing packages and configuration files.
  * Usage:
    ```bash
    chmod +x setup
    sudo ./setup <option(s)>
    ```
  * Options:
    * `-p`: Runs the install-packages script.
    * `-l`: Runs the link-configs script.
    * `-h`: Displays information about available options.

4. `link-configs`: Creates symbolic links to configuration files from the repository to your system.
  * Usage:
    ```bash
    chmod +x link-configs
    sudo ./link-configs
    ```

## project_2
Script for creating a new user on the system with limited options for customization.

### Script
`create-user`: Automates user creation with customizable options for shell, groups, and home directory.
  * Usage:
    ```bash
      chmod +x create-user
      sudo ./create-user <option(s)> <username>
    ```