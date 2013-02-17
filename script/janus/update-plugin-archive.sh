#!/bin/sh

DOTFILES="$HOME/work/dotfiles"
PLUGIN_ARCHIVE="$DOTFILES/script/janus/plugin-archive"
PLUGINS="$HOME/.janus"
PLUGIN_ACTION="git config --get remote.origin.url"
ARCHIVE_FORMAT="%s,%s\n"

# Empty plugin archive
cat /dev/null > $PLUGIN_ARCHIVE

# Populate plugin archive
for i in $(ls -1 $PLUGINS); do
	if [ -d $PLUGINS/$i ]; then
		echo "--> Adding $i"

		plugin_info=$(cd $PLUGINS/$i && $PLUGIN_ACTION)

		printf $ARCHIVE_FORMAT $i $plugin_info >> $PLUGIN_ARCHIVE
 	fi
done
