#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import shutil
import argparse

def green(msg): return '\033[92m' + msg + '\033[0m'
def blue(msg): return '\033[94m' + msg + '\033[0m'

def home(sub_path): return os.path.join(os.path.expanduser("~"), sub_path)
def pwd(sub_path): return os.path.join(os.getcwd(), sub_path)

def ensure_replace(path):
    if os.path.exists(path):
        print green(path) + " already exists. Replace with new one?"
        yn = raw_input('y/[n] > ')
        if yn.lower() == 'y':
            os.remove(path)
        else:
            raise Exception("Abort!")

def create_symlinks(targets, dst=home):
    for sub_path in targets:
        try:
            ensure_replace(dst(sub_path))
        except:
            continue
        os.symlink(pwd(sub_path), dst(sub_path))

# Install Commands
def zsh():
    create_symlinks(['.zsh', '.zshenv'], dst=home)

if __name__ == '__main__':
    # parser = argparse.ArgumentParser(description='')
    # parser.add_argument('', help='')
    # args = parser.parse_args()

    targets = {'zsh': zsh}

    for key,command in targets.items():
        command()
