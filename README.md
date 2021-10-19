# Foxium

Brave without the bullshit

## Summary

Brave is a great browser. However, there are quite a few aspects I strongly dislike about it. This repository addresses my concerns by providing a process to patch up things I disagree with

## Building

See the Brave [README](https://github.com/brave/brave-browser/blob/master/README.md) or their [Wiki](https://github.com/brave/brave-browser/wiki/Linux-Development-Environment) for more information

```sh
# Clone this project
git clone https://github.com/foxium-browser/foxium
cd foxium
git submodule update --init

# Clone brave-browser
cd brave-browser
npm install
npm run init # This may take a while
./src/build/install-build-deps.sh

# Apply patches
cd ..
./patches/apply.sh

# Build
cd brave-browser
CC_WRAPPER=ccache npm run build Component

# Start
npm start Component
```

## Roadmap

- Actually patch some things out (right now, the patches are only for testing purposes)
- CI/CD
- Autopull and autopatch
