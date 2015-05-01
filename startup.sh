#!/bin/sh
### BEGIN  INFO
# Provides:           odoo-server
# Short-Description:  Enterprise Resource Management software
# modified : Ait-Mlouk addi (aitmlouk@gmail.com)
# site web : http://odoo-services.esy.es/
# blog     : http://aitmlouk-addi.blogspot.com/
# linkedin : http://ma.linkedin.com/pub/addi-ait-mlouk/56/850/32a
# viadeo   : http://ma.viadeo.com/en/profile/addi.mlk
# Google+  : https://plus.google.com/+AitMloukAddi
# Gmail    : aitmlouk@gmail.com
### END INFO

PATH=/bin:/sbin:/usr/bin
DAEMON=/opt/openerp/v7/openerp-server
NAME=openerp-server
DESC=openerp-server

# Specify the user name (Default: openerp).
USER=aitmlouk

# Specify an alternate config file (Default: /etc/openerp-server.conf).
CONFIGFILE="/etc/openerp-server.conf"

# pidfile
PIDFILE=/var/run/$NAME.pid

# Additional options that are passed to the Daemon.
DAEMON_OPTS="-c $CONFIGFILE"

[ -x $DAEMON ] || exit 0
[ -f $CONFIGFILE ] || exit 0

checkpid() {
    [ -f $PIDFILE ] || return 1
    pid=`cat $PIDFILE`
    [ -d /proc/$pid ] && return 0
    return 1
}

case "${1}" in
        start)
                echo -n "Starting ${DESC}: "

                start-stop-daemon --start --quiet --pidfile ${PIDFILE} \
                        --chuid ${USER} --background --make-pidfile \
                        --exec ${DAEMON} -- ${DAEMON_OPTS}

                echo "${NAME}."
                ;;

        stop)
                echo -n "Stopping ${DESC}: "

                start-stop-daemon --stop --quiet --pidfile ${PIDFILE} \
                        --oknodo

                echo "${NAME}."
                ;;

        restart|force-reload)
                echo -n "Restarting ${DESC}: "

                start-stop-daemon --stop --quiet --pidfile ${PIDFILE} \
                        --oknodo

                sleep 1

                start-stop-daemon --start --quiet --pidfile ${PIDFILE} \
                        --chuid ${USER} --background --make-pidfile \
                        --exec ${DAEMON} -- ${DAEMON_OPTS}

                echo "${NAME}."
                ;;

        *)
                N=/etc/init.d/${NAME}
                echo "Usage: ${NAME} {start|stop|restart|force-reload}" >&2
                exit 1
                ;;
esac

exit 
