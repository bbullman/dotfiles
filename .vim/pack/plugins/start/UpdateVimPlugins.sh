#
# Update all Vim Plugins
#
cd ~/.vim/pack/plugins/start
find . -maxdepth 1 -type d -exec sh -c '(cd {} && git pull)' ';'
