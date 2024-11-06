# 2420_linux_assignment_2

## `install-packages.sh`
Purpose of this file is to install required packages for the system setup.
- Loops through the list and installs each package using a package manager.
- Checks for the successful installation of each pakcage and reports errors if any package fails to install.

## `link-configs.sh`
Purpose of this file is to create symbolic links for configuration files.
- Checks if the required directories exists, creating them if necessary.
- Creates symbolic links for directories and files:
  - Links `~/bin` to the `bin/` directory from the repository.
  - Links `~/.config` to the `config/` directory from the repository.
  - Links `~/.bashrc` to the `home/bashrc` file from the repository.
- Ensures that the symbolic links preserve the structure and point to the right configuration files.

## `setup.sh`
Purpose of this file is to execute the previeous two scripts to automate the entire set up process.
- Provides a command-line interface for users to run either `install-packages.sh` or `link-configs.sh` or both depending on the provided options (using `getopts`).
- Includes error handling to ensure that each script runs successfully.
- Handles missing arguments or invalid options, providing user-friendly error messages and guidance.
- Allows customization of behaviour through command-line options.

## `create-user.sh`
Purpose of this file is to automate the creation of a new user with the required settings.
- Promptsfor the new user's username, shell and groups.
- Checks if the script is being run with root privileges and exits with an error message if not.
- Creates the new user and sets the user's primary group to match their username.
- Creates a home directory for the new user and copies the contents of `/etc/skel` into it.
- Sets a password for the new user using the `passwd` utility.