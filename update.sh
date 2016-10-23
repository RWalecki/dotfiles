#!/usr/bin/env bash

# update all submodules (vim packages)
git submodule foreach git pull origin master
