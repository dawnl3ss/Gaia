import sys
import os

def main():
    hash = sys.argv[1]
    os.system("touch /tmp/.md5tojohn.temp")
    os.system(f"echo {hash} > /tmp/.md5tojohn.temp")
    os.system("john --format=raw-md5 /tmp/.md5tojohn.temp")

if __name__ == "__main__":
    main()