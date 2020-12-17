#! /bin/bash

cd ~/repositories/matoruru

ls -A | xargs -i sh -c 'cd {} && git remote set-url origin git@github.com:matoruru/{}.git'
