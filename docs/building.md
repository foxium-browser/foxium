# Building

## Brave

See the Brave [README](https://github.com/brave/brave-browser/blob/master/README.md) or their [Wiki](https://github.com/brave/brave-browser/wiki/Linux-Development-Environment) for more information.

See the [release information](https://github.com/brave/brave-browser/wiki/Brave-Release-Schedule) to see what branch to switch to.

First, clone and initialize _this_ project.

```sh
# Clone this project
git clone https://github.com/foxium-browser/foxium
cd foxium
git submodule update --init --recursive
```

Then, follow instructions to initialize Brave:

```sh
cd brave-browser
npm install
npm run init # This may take a while
./src/build/install-build-deps.sh
```

Then, build Brave. Because Brave forcibly sets their own `cc_wrapper` `gn` argument to a binary that directly `execve`'s the string (cannot set environment variables or flags), we point to our own binary that sets the proper environment variables to `ccache`.

```sh
cd brave-browser
CC_WRAPPER="$PWD/foxium/source/cc" npm run build -- -C out/Component
npm start Component
```
