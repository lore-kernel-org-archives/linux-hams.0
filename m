From: Kjell Jarl <K-Jarl@algonet.se>
Subject: ax25/netrom/crashes?
Date: Mon, 04 Aug 2003 22:09:57 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F2EBD95.1060803@algonet.se>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080000030504000809050806"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: Linux Hams <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080000030504000809050806
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi!
I am (still) struggling with crashes.

I now suspect, even more, netrom has to do with the crashes, latest hint 
is this:
 From /var/messages I can se one user logging in to dxspider who 
probably has come over so many 1200 bit/s nodes that it cannot pass the 
traffic fast enough, but a (netrom transport) queue is built up.
After 1,5 hour of connection, the node is crashing.

- Maybe due to filled up queue (not liekely)?
- Maybe due to a disconnect from the remote end with a large queue?

Below is the tail -f of the log file as seen over 1200 bit/s, including 
the disconnect after the crash:

Aug  4 19:18:24 router-sk7hw ax25d[2733]: NET/ROM SK6HD-0@SK7IJ-5 
(netrom) node
Aug  4 19:18:24 router-sk7hw node[2733]: SK6HD @ SK7IJ-5 logged in
Aug  4 19:19:08 router-sk7hw ax25d[2734]: NET/ROM SK6HD-0@SK7HW-5 
(netsp) client
Aug  4 19:19:08 router-sk7hw node[2733]: Connected to DXSVXO:SK7HW-7
*** Cleared
Mon Aug  4 20:59:17 CEST 2003
[sm7gvf@pc2 sm7gvf]$


kernel 2.4.22-pre10
HR6.1

Guessing here (the system is down):
libax25-devel-0.0.7
libax25-0.0.7
ax25-tools-0.0.6
ax25-apps-0.0.4

running dxnet, fbb, dxspider, node0.3.0

I am using the script below as startup, I don't have all the other files 
at hand here.

Could it be netrom causing this?

What more information could I supply?

73
Kjell, sm7gvf


--------------080000030504000809050806
Content-Type: text/plain;
 name="ax25init"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ax25init"

#!/bin/sh
#
# ax25init	This inits the adx25 interfaces and services
#
# chkconfig: - 94 03
# description: ax25 init script


# Source function library.
. /etc/rc.d/init.d/functions

# Source networking configuration.
. /etc/sysconfig/network

# Check that networking is up.
[ ${NETWORKING} = "no" ] && exit 0

#DAEMON=ax25d

# See how we were called.
case "$1" in
  start)
        # Start daemons.
        echo -n "Starting ax25 interfaces: "
	
	mkiss -s 9600 /dev/ttyS0 /dev/ptyq0
	kissattach /dev/ttyq0 emma 44.140.249.10
	ifconfig  ax0 netmask 255.255.255.255
	kissparms -p emma -t 200 -r 255 -s 10

	mkiss -c -p 2 -s 9600 /dev/ttyS1 /dev/ptyq1
	kissattach /dev/ttyq1 gno 44.140.249.10
	ifconfig ax1 netmask 255.255.255.255
	kissparms -p gno -f n -t 100 -r 255 -s 10

	sccinit
	
	ifconfig scc0 44.140.249.10 netmask 255.255.255.255 up
	axparms -setcall scc0 sk7hw-10
	ifconfig scc1 44.140.249.10 netmask 255.255.255.255 up
	axparms -setcall scc1 sk7hw-11
	ifconfig scc2 44.140.249.10 netmask 255.255.255.0 up
	axparms -setcall scc2 sk7hw-9
	ifconfig scc3 44.140.249.10 netmask 255.255.255.255 up
	axparms -setcall scc3 sk7hw-13
	
	sccparam scc0 wait 10
	ifconfig scc0 txqueuelen 20
	sccparam scc1 wait 10
	ifconfig scc1 txqueuelen 20
	sccparam scc2 wait 10
	ifconfig scc2 txqueuelen 20
	sccparam scc2 maxkeyup 8
	sccparam scc3 wait 10
	ifconfig scc3 txqueuelen 20
	
	nrattach -i 44.140.249.10 netrom
	ifconfig nr0 netmask 255.255.255.255
	nrattach -i 44.140.249.10 netfbb
	ifconfig nr1 netmask 255.255.255.255
	nrattach -i 44.140.249.10 netdx
	ifconfig nr2 netmask 255.255.255.255
	nrattach -i 44.140.249.10 netsp
	ifconfig nr3 netmask 255.255.255.255
	
	echo 24000	> /proc/sys/net/netrom/transport_timeout
	echo 2		> /proc/sys/net/netrom/transport_maximum_tries
	echo 2000	> /proc/sys/net/netrom/transport_acknowledge_delay

#emma
	echo 2     	> /proc/sys/net/ax25/ax0/standard_window_size
	echo 0		> /proc/sys/net/ax25/ax0/backoff_type
	echo 800	> /proc/sys/net/ax25/ax0/t1_timeout 
 	echo 300	> /proc/sys/net/ax25/ax0/t2_timeout
	echo 20	 	> /proc/sys/net/ax25/ax0/maximum_retry_count

#gnosjo
	echo 2     	> /proc/sys/net/ax25/ax1/standard_window_size
	echo 0		> /proc/sys/net/ax25/ax1/backoff_type
	echo 600	> /proc/sys/net/ax25/ax1/t1_timeout
	echo 200	> /proc/sys/net/ax25/ax1/t2_timeout
        echo 20         > /proc/sys/net/ax25/ax1/maximum_retry_count

#ryda
	echo 2    	> /proc/sys/net/ax25/scc0/standard_window_size
	echo 0		> /proc/sys/net/ax25/scc0/backoff_type
        echo 900       > /proc/sys/net/ax25/scc0/t1_timeout
	echo 300	> /proc/sys/net/ax25/scc0/t2_timeout
        echo 20         > /proc/sys/net/ax25/scc0/maximum_retry_count

#Ekekull
	echo 2     	> /proc/sys/net/ax25/scc1/standard_window_size
	echo 0		> /proc/sys/net/ax25/scc1/backoff_type
        echo 400	> /proc/sys/net/ax25/scc1/t1_timeout
	echo 100	> /proc/sys/net/ax25/scc1/t2_timeout
        echo 20         > /proc/sys/net/ax25/scc1/maximum_retry_count


#Lan
	echo 2     	> /proc/sys/net/ax25/scc2/standard_window_size
	echo 0		> /proc/sys/net/ax25/scc2/backoff_type
        echo 1300       > /proc/sys/net/ax25/scc2/t1_timeout
	echo 300	> /proc/sys/net/ax25/scc2/t2_timeout
        echo 20         > /proc/sys/net/ax25/scc2/maximum_retry_count
	echo 0		> /proc/sys/net/ax25/scc2/ip_default_mode
	echo 400	> /proc/sys/net/ipv4/neigh/scc2/retrans_time 

#Asarum
	echo 2     	> /proc/sys/net/ax25/scc3/standard_window_size
	echo 0		> /proc/sys/net/ax25/scc3/backoff_type
        echo 1000       > /proc/sys/net/ax25/scc3/t1_timeout    
	echo 300	> /proc/sys/net/ax25/scc3/t2_timeout
        echo 20         > /proc/sys/net/ax25/scc3/maximum_retry_count

	mheardd -n 100
	ax25d -l
	netromd -i -t 30 -l -d
#	rxecho

	. /var/ax25/nodesave.data
	. /etc/ax25/routes.conf &
	axdigi &
				
        RETVAL=$?
        echo
        ;;

  stop)
        # Stop daemons.
        echo -n "Shutting down $DAEMON: "
	/usr/sbin/nodesave  /var/ax25/nodesave.data
	killall mkiss
	killall kissattach
	killall mheardd
	killall ax25d
	killall rxecho
	killall netromd
	ifconfig scc0 down
	ifconfig scc1 down
	ifconfig scc2 down
	ifconfig scc3 down
	ifconfig nr0 down
	ifconfig nr1 down
	ifconfig nr2 down
	ifconfig nr3 down
	ifconfig ax0 down
	ifconfig ax1 down
	
        RETVAL=$?
        echo
        [ $RETVAL -eq 0 ]
	;;

 status)
        status $DAEMON
        RETVAL=$?
        ;;

  restart|reload)
        $0 stop
        $0 start
        RETVAL=$?
        ;;
  *)
        echo "Usage: $DAEMON {start|stop|restart|status}"
        exit 1
esac

exit $RETVAL


--------------080000030504000809050806--

