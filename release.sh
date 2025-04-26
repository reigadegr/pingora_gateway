#!/bin/sh
export RUSTFLAGS="-C default-linker-libraries \
-C target-feature=xeon \
-C llvm-args=-enable-ml-inliner=release \
-C llvm-args=-inliner-interactive-include-default \
-C llvm-args=-ml-inliner-model-selector=arm64-mixed \
-C llvm-args=-ml-inliner-skip-policy=if-caller-not-cold \
-C link-args=-fomit-frame-pointer \
-C link-args=-Wl,--icf=all,-z,relro,--pack-dyn-relocs=android+relr,-x,-s,--strip-all,-z,now
" 

# export RUSTFLAGS="-C default-linker-libraries"
# python3 ./make.py build --release --nightly -v
cargo b -r
