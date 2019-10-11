#!/bin/sh
cd /www/server/panel/class/ && rm -rf panelPlugin.py && rm -rf panelPlugin.pyc && wget https://github.com/zhhww58/myscript/raw/master/panelPlugin.py && /etc/init.d/bt restart
