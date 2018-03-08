#!/usr/bin/env python3
import argparse
import shutil
import platform
import sys
import operator
import json

from functools import reduce
from subprocess import Popen, PIPE

# Get the os we are running on
running_os = platform.system().casefold()

# Ensure we are on a supported platform
if not running_os in ["linux", "darwin"]:
    print("Unsupported operating system. Must be Linux or OSX")
    sys.exit(1);

# Parse the arguments
parser = argparse.ArgumentParser(description="A script to ensure that a list of commands/shell builtins/functions exist on the system")
parser.add_argument("--shell", type=str, choices=["fish"], default="fish", help="The shell to test for functions/builtins")
parser.add_argument("--require", nargs="+", action="append", help="First arg is the platform (all, linux, darwin) following arguments are the required commands on that platform. Example: 'require_commands.py --platform all little_boxes --platform linux lsblk --platform darwin diskutil' would require the command 'little_boxes' on all platforms, the command 'lsblk' on linux and the command 'diskutil' on OSX.")
parser.add_argument("--porcelain", type=str, choices=["tab", "json"], nargs="?", const="tab", help="Print data in a machine readable format (tab seperated or json)")
parser.add_argument("--verbose", "-v", action="store_true", help="Always print results of all checked commands")
args = parser.parse_args()

# Resolve the full path of the shell
args.shell_path = shutil.which(args.shell)

# Check if a command/builtin/function exists
def check_if_exists(command):
    # The command to run based on the shell
    command_to_check = {
        "fish": "type"
    }

    # Actually run the command to check if the command exists
    process = Popen(f"{command_to_check[args.shell]} {command}", shell=True, executable=args.shell_path, stdout=PIPE, stderr=PIPE)
    process.wait()

    # Get the text from the commands stdout
    # print(str(process.stdout.read()))

    return not bool(process.returncode)

# Check if a list of commands exist and convert into a dict of command: exists boolean pairs
def check_commands(commands):
    return {command: check_if_exists(command) for command in commands}

# Get a list of commands to check by looking at each require command and checking if the os is the current os or "all"
commands_to_check = [required[1:] for required in args.require if required[0].casefold() == running_os or required[0].casefold() == "all"]

# Flatten the list (not sure the most pythonic way to do this)
commands_to_check = reduce(operator.add, commands_to_check)

# Check which commands exist
results = check_commands(commands_to_check)

# If in porcelain mode, print and exit with code 0
if args.porcelain:
    if args.porcelain == "tab":
        for command, exists in results.items():
            print(f"{command}\t{str(exists).lower()}")
    elif args.porcelain == "json":
        print(json.dumps(results, indent=2))

    sys.exit(0)

exit_with_error = False
for command, is_installed in results.items():
    if not is_installed:
        print(f"'{command}' is not installed")
        exit_with_error = True

    if is_installed and args.verbose:
        print(f"'{command}' is installed")

if exit_with_error:
    sys.exit(1)
else:
    sys.exit(0)
