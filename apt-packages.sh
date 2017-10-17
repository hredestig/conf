#!/bin/bash

PACKAGES=( emacs24 git python-pip )
for pkg in "${PACKAGES[@]}"; do
	sudo apt-get install ${pkg}
done
