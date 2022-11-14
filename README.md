# osxcross-rs

There is a branch per build environment.
The branch is then the tag for the docker image.

To get a rust environment for `x86_64-unknown-linux-gnu` you would specify `ghcr.io/timluq/osxcross-rs:x86_64-unknown-linux-gnu` as the docker image.

## Environment support

Currently the following environments are supported:

- `x86_64-unknown-linux-gnu`
- `x86_64-apple-darwin`
- `aarch64-apple-darwin`
- `i686-pc-windows-gnu`
