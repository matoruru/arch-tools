#! /bin/bash

cat <<EOF | xargs -i sh -c "type {} >/dev/null 2>&1 || echo {} is not installed."
purs
spago
stack
ghcup
haskell-language-server-wrapper
EOF
