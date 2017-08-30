#!/bin/bash
# rust-build.sh
source ~/.cargo/env
cargo install ripgrep
mkdir deb-package-ripgrep &&
cd deb-package-ripgrep
wget https://github.com/BurntSushi/ripgrep/archive/0.5.0.tar.gz &&
mv 0.5.0.tar.gz ripgrep_0.5.0.orig.tar.gz &&
bzr dh-make ripgrep 0.5 ripgrep_0.5.0.orig.tar.gz &&
cd ripgrep/debian && rm *ex *EX

## debian -> ubuntu

# in changelog replace: package (x.y-z) unstable -> package (x.y-zubuntu1) `lsb_release -c -s`
UBUNTU_RELEASE_CODE_NAME=`lsb_release -c -s`
sed -i -r "s/([(][[:digit:]]+.[[:digit:]]+-[[:digit:]]+)[)]\sunstable/\\1ubuntu1\) ${UBUNTU_RELEASE_CODE_NAME}/" deb-package-ripgrep/ripgrep/debian/changelog

VERSION=`grep -o -E '[[:digit:]]+.[[:digit:]]+-[[:digit:]]+ubuntu1' deb-package-ripgrep/ripgrep/debian/changelog`

# in Change
## Section: unknown-> section: utils
## https://github.com/BurntSushi/ripgrep
## Description:
## Architecture: ia64
## Version:
