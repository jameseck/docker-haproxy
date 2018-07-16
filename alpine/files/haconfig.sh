#!/bin/bash

CURRENTCFG=/etc/haproxy/haproxy.cfg
NEWCFG=/tmp/haproxy.cfg.tmp
CONFIGDIR=/etc/haproxy/conf.d

[ -f $CURRENTCFG ] || touch $CURRENTCFG

echo "Compiling *.cfg files from $CONFIGDIR"
ls $CONFIGDIR/*.cfg
cat $CONFIGDIR/*.cfg > $NEWCFG
echo "Differences between current and new config"
diff -s -U 3 $CURRENTCFG $NEWCFG
if [ $? -eq 0 ]; then
  echo "You should make some changes first :)"
  exit 0 #Exit if old and new configuration are the same
fi
echo -e "Checking if new config is valid..."
haproxy -c -f $NEWCFG

if [ $? -eq 0 ]; then
  cat /etc/haproxy/conf.d/*.cfg > $CURRENTCFG
else
  echo "There are errors in new configuration, please fix them and try again."
  exit 1
fi

# /usr/sbin/haproxy -f $CURRENTCFG -db
#/bin/bash -c "/sbin/syslogd -O /dev/stdout && haproxy -f $CURRENTCFG -db"
