cd "$2"
cargo clean
cargo generate-lockfile
redo-ifchange Cargo.lock
cargo install --force --path=.
cargo clean
