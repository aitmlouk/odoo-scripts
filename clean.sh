#!/bin/sh
### BEGIN INIT INFO
# Provides : Ait-Mlouk Addi (aitmlouk@gmail.com)     
# site web : http://www.aitmlouk-addi.info/
# blog     : http://aitmlouk-addi.blogspot.com/
# linkedin : http://ma.linkedin.com/pub/addi-ait-mlouk/56/850/32a
# viadeo   : http://ma.viadeo.com/en/profile/addi.mlk
# Google+  : https://plus.google.com/+AitMloukAddi
# Gmail    : aitmlouk@gmail.com
### END INIT INFO

#beginning of script
#Decoration of the full path to the backup directory
#find all the files which are modified more than 10 days back
#find $BACKUP_DIR -type f -mtime +10 -exec rm -f {} \;

BACKUP_DIR=/opt/backup
find $BACKUP_DIR -type f -mtime +10 -exec rm -f {} \;

#End script
