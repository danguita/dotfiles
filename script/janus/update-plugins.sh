#!/bin/sh

PLUGINS="$HOME/.janus"
UPDATE_ACTION="git pull origin master"

# Update each plugin
for i in $(ls -1 $PLUGINS); do
	if [ -d $PLUGINS/$i ]; then
		echo "\n--> Updating $i"

		cd $PLUGINS/$i && $UPDATE_ACTION
 	fi
done
