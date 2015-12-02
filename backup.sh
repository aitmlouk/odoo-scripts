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
#select all databases
#archive all databases by this name (date_hour)
#
 DBNAME=`psql -Uopenerp -tq -dtemplate1 -c "select datname from pg_database"`
 hours=$(date +%H-%M)
 for DB in $DBNAME
 do
 BACKUPFILE=/opt/backup/$DB\_$hours\_`/bin/date +%D |sed 's;/;-;g'`
 if  [ "$DB" != "template0" ] && [ "$DB" != "template1" ]; then
 /usr/bin/vacuumdb --analyze -Uopenerp $DB
 /usr/bin/pg_dump -Uopenerp --column-inserts $DB | gzip -c > $BACKUPFILE.out.gz
 fi
 done

#End of script
