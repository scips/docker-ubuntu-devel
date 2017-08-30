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
