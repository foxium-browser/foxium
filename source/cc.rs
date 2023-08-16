use std::env;
use std::process::Command;

fn main() {
    let mut child = Command::new("ccache")
        .env(
            "CCACHE_CONFIGPATH",
            "/storage/ur/storage_home/Docs/Programming/Repositories/default/foxium/source/ccache.conf",
        )
        .env("CCACHE_DIR", "/storage/ur/storage_other/ccache_brave")
        .env("CCACHE_SLOPPINESS", "sloppiness,include_file_mtime")
        .args(env::args().skip(1))
        .spawn()
        .expect("Failed to execute child");

    let ecode = child.wait().expect("Failed to wait on child");

    assert!(ecode.success());
}
