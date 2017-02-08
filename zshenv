
export NVM_DIR="/home/cameron/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nv
nvm use --silent --lts

export PATH="$PATH:dirname $(nvm which `nvm current`)"
