cd "$2"
cargo clean
cargo metadata --format-version=1 | redo-stamp
cargo install --force --path=.
cargo clean
