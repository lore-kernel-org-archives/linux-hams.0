From: C Schuman <k4gbb1@embarqmail.com>
Subject: AX25 in /etc/init.d
Date: Thu, 30 Apr 2009 23:42:48 -0400
Message-ID: <49FA6FB8.1030706@embarqmail.com>
Reply-To: k4gbb1@embarqmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; d=embarqmail.com; s=s012408; c=relaxed/simple;
	q=dns/txt; i=@embarqmail.com; t=1241149371;
	h=From:Subject:Date:To:MIME-Version:Content-Type;
	bh=y5bRlxxANEb5j9hzxja1MBfZFRk=;
	b=C9i6askIYIgnAkMFz9cBP08CwBJqTeTkazWr0V8reWIk6yrMJ12GevLn4slMB+ec
	CgxWmGi+obQGGSP8tzoG62Nq/44sI5eXBwHZn3cnsMHuyOXwgHdb2SmWVFom7lbI;
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-Hams <linux-hams@vger.kernel.org>

I installed AX.25 on a system a couple of days ago and when I copied my 
usual ax25 script into /etc/init.d/ I received a message saying that the 
script did not have a proper header. The script worked without any 
problem, but it started me thinking.  Most Ax.25 Howto Docs make little 
of the bootup process. Some even suggest that the kissattach and other 
config commands be placed in the rc.local file.

AX.25 is becoming a major work in Linux systems. It deserves to have 
it's own boot script. I have been using the same script for years and I 
recently added the the requested header. I would like to suggest that 
AX.25 How to docs include the use of such a script and have attached my 
script as an example.

73
<<Charley>>
      k4gbb

#! /bin/bash
# Provided by Charles S Schuman ( K4GBB )
# 04/29/09

### BEGIN INIT INFO
# Provides: ax25
# Required-Start: /etc/ax25/ax25-up
# Required-Stop: /etc/ax25/ax25-down
# Default-Start: 3 4 5
# Default-Stop: 0 1 2 6
# Short-Description: Ax.25 initialization
# Description: This script provides the control for the ax.25 packet 
radio service.
#           The fine tuneing is accomplished via /etc/ax25/ax25-up and 
/etc/ax25/ax25-down.
#
### END INIT INFO

StartAx25="yes"

# /etc/init.d/ax25
#
# Kernel-Parameter "ax25=yes|no" ?
      if [ "`grep -e [Aa][Xx]25=[Nn][Oo] /proc/cmdline`" != "" ] ; then
        echo -e "ax25: Aborting startup on user request (kernel boot 
parameter)."
        exit 1
      fi

case "$1" in

  start|-start)
    echo "/etc/init.d/ax25: Starting AX25..."
    /etc/ax25/ax25-up
    ;;

    stop|-stop)
    echo "Stopping AX25..."
    /etc/ax25/ax25-down
    ;;

   restart|-restart)
    echo "AX25 Restart"
    /etc/ax25/ax25-down
    sleep 1
    /etc/ax25/ax25-up
    ;;

  status|-status)
    if [ ! -d /proc/sys/net/ax25 ] ; then
      echo "ax25 is down"
    else 
      echo "$(ls /proc/sys/net/ax25)" > /tmp/ax25-config.tmp
      read Select < /tmp/ax25-config.tmp
      i=0
      while [ "$Select" != "" ]
      do
      let i=i+1
      awk ' NR == '$i' { print $1 }' /tmp/ax25-config.tmp > 
/tmp/ax25-config-tmp
      read Select < /tmp/ax25-config-tmp
        if [ "$Select" != "" ]; then
          /sbin/ifconfig "$Select"
        fi
      done
        if [ -z "$(uname -r | grep kjd)" ] ;then
          netstat --ax25
        else
          /sbin/ifconfig ipax0
          cat /proc/net/ax25
        fi 
    fi
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
    ;;
esac

exit 0

