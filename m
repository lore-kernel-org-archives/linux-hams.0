From: "Ray Wells" <mvc2@dodo.com.au>
Subject: mkiss problem
Date: Mon, 23 Jun 2003 10:17:55 +1000 (AUS Eastern Standard Time)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3EF64733.00000B.01608@gizmo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi All,

I intermittently get the following message from mkiss ....

mkiss: ax1: truncating oversized transmit packet!

Usually when this happens I have to reboot the system to restore the port to
a working condition, but sometimes, like right now, the port keeps working
ok. Being a HF port makes it impossible to monitor what is "really"
happening on another radio. 

I'm not sure of what information I should include here so I'll post what I
think might be relevant.

The machine is a Pentium 166 with 32M RAM running Debian 2.2.r0 with kernel
2.2.20 running xfbb (7.04h) and fpac (3.25).

There are nine ports: four using a Baycom USCC>4 card (but the 9k6 port is
not in service), two using TNC's with KISS-only EPROM's, one axip link on my
LAN, and two loopback between the bbs and the node. The BBS has a Telnet
port configured.

The offending port, ax1, is used on 40m with a paclen of 64, if that
information is relevant. My scc1, 30m port also has paclen 64 configured.
All other ports are configured for paclen 250.

Here is my /etc/init.d/ax25 file, with non-essential garbage removed.

#!/bin/sh
#
# This is /etc/init.d/ax25
test -f /usr/sbin/ax25d || exit 0


      # Configure serial ports
      #echo "Configuring serial ports"
      /bin/setserial -v /dev/ttyS0 irq 4
      /bin/setserial -v /dev/ttyS1 irq 3
        # AX25
      echo "AX25: starting interfaces ..."
        #
        echo "Starting sccinit"
      /sbin/sccinit
      #
      # configure the scc0/local device
      /sbin/ifconfig scc0 44.136.56.25 hw ax25 KEMPC-13
      /sbin/ifconfig scc0 netmask 255.255.255.0 broadcast 44.136.56.255 arp
      # configure the scc1/30m device
      /sbin/ifconfig scc1 44.136.56.25 hw ax25 KEMPC-12
      /sbin/ifconfig scc1 netmask 255.255.255.0 broadcast 44.136.56.255 arp
      #
      # configure the scc2/70cm device
      /sbin/ifconfig scc2 44.136.56.25 hw ax25 KEMPC-11
      /sbin/ifconfig scc2 netmask 255.255.255.0 broadcast 44.136.56.255 arp
      #
      #configure the scc3/9k6 device
      /sbin/ifconfig scc3 44.136.56.25 hw ax25 KEMPC-10
      /sbin/ifconfig scc3 netmask 255.255.255.0 broadcast 44.136.56.255 arp
      #
        # configure the ax0/7550 device
        #
      echo -n " 7550 "
      /usr/sbin/kissattach  /dev/ttyS0 7550 44.136.56.25
        /sbin/ifconfig ax0 44.136.56.25 netmask 255.255.255.0 broadcast 44
136.56.255 arp
      #
        #
      echo -n " 40m "
      /usr/sbin/kissattach  /dev/ttyS1 40m 44.136.56.25 -m 64
      /sbin/ifconfig ax1 44.136.56.25 netmask 255.255.255.0 broadcast 44.136
56.255 arp
      #
        # configure axip
      /usr/sbin/kissattach /dev/ptyqf axip 44.136.56.25
      sleep 2
      /sbin/ifconfig ax2 44.136.56.25 netmask 255.255.255.0 broadcast 44.136
56.255 arp     
      #
      # configure loopback ports
      /usr/sbin/kissnetd /dev/ptyq1 /dev/ptyq2 &
      sleep 4
      #
      /usr/sbin/kissattach /dev/ttyq1 bbs 10.0.0.1
      /usr/sbin/kissattach /dev/ttyq2 node 10.0.0.2
      #
      /sbin/ifconfig ax3 10.0.0.1 netmask 255.255.255.255 hw ax25 KEMPC-6
      /sbin/ifconfig ax4 10.0.0.2 netmask 255.255.255.255 hw ax25 KEMPC-5
      #
        # configure the netrom devices
        #
      echo "... configuring 'netrom'"
      /usr/sbin/nrattach -i 44.136.56.25 -m 236 netrom
        #
        # configure the rose device
        #
      echo "... configuring 'rose'"
      /usr/sbin/rsattach -i 44.136.56.25 rose
      #
 
      /bin/netstat -rn  
      #
      #
      echo "Setting KISS parameters for 7550"
      /usr/sbin/kissparms -p 7550 -r 125
      /usr/sbin/kissparms -p 7550 -t 400
      /usr/sbin/kissparms -p 7550 -s 20
      /usr/sbin/kissparms -p 7550 -f n
      /usr/sbin/kissparms -p 7550 -l 40
      #
        #
        echo "Setting KISS parameters for 40m"
      /usr/sbin/kissparms -p 40m  -r 64
      /usr/sbin/kissparms -p 40m  -t 400
      /usr/sbin/kissparms -p 40m  -s 20
      /usr/sbin/kissparms -p 40m  -f n
        /usr/sbin/kissparms -p 40m  -l 200
      echo -n "Starting AX25 and NetRom networking daemons: "
      echo -n " ax25d"
      /usr/sbin/ax25d &
      echo -n " netromd"
      /usr/sbin/netromd -t 30 -i &
      echo -n "   Starting axip daemon"
      /usr/sbin/ax25ipd
      echo -n " mheardd"
      /usr/sbin/mheardd &
        
      /usr/sbin/rxecho
      
      echo -n "   Starting Ethernet"
      ifconfig eth0 44.136.56.95
      
           #
      echo "Setting AX25 parameters"
      /usr/sbin/axsetparms
      #
      echo "Starting FPAC daemon"
      /usr/local/fpac/fpac.sh
      sleep 2
      #                 
      #
        echo -n "Starting Xfbb daemon"
        /usr/sbin/fbb &
          

Does anyone have some thoughts on this problem?

Regards

Ray Wells VK2TV
