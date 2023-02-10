#!/usr/bin/python3
import sys
import os


def very_simple_check(pattern, path):
    for root, dirs, file_names, in os.walk(path):
        for file_name in file_names:
            file_path = os.path.abspath(os.path.join(root, file_name))
            with open(file_path) as file_obj:
                for line in file_obj:
                    if pattern in line:
                        print(f"{file_path} - {line}")


def main():
    args = sys.argv[1:]
    very_simple_check(args[0], args[1])


if __name__ == "__main__":
    main()
