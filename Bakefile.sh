# shellcheck shell=bash

declare -r brave_core="$BAKE_ROOT/brave-browser/src/brave"

task.init() {
  cd './brave-browser/src'    
  ./brave/vendor/depot_tools/gn gen out/Release --args='cc_wrapper="CCACHE_SLOPPINESS=time_macros ccache"'

}

task.update() {
  # git submodule update
  git submodule foreach git pull
}

task.pull() {
  cd "$brave_core"
  git pull
}

task.patch() {

  # git -C "$brave_core" diff --patch --output "$BAKE_ROOT/patches/welcome.patch"

  # git -C "$brave_core" apply --reject --whitespace=fix "$PWD/patches/welcome.patch"

  git -C "$brave_core" patch
}
