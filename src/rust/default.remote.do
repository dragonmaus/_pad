redo-ifchange $( which -a cargo rustc ) "$2.remote-stamp"
cargo install --force "$2"
