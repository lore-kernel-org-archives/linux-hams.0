From: "Marius Petrescu" <marius@yo2loj.ro>
Subject: RE: Using ax25ipd
Date: Fri, 25 May 2012 03:22:56 +0300
Message-ID: <005701cd3a0c$8b90e5c0$a2b2b140$@ro>
References: <4FBEB9ED.3050805@boling.us> <4FBECB76.60109@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4FBECB76.60109@trinnet.net>
Content-Language: en-us
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'David Ranch' <linux-hams@trinnet.net>, linux-hams@vger.kernel.org

Hi David,
This is exactly what socat will do in this case.
It automates that dynamic /dev/pts/# alloocation by providing symbolic links
with the names that you choose.
So it becomes scriptable.

Marius

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of David Ranch
Sent: Friday, May 25, 2012 03:00
To: linux-hams@vger.kernel.org
Subject: Re: Using ax25ipd


Here are my notes I wrote down to get this working in a very manual 
fashion   Should be too hard to automate this in a script (see the URL 
below)

--David


09/04/2011

http://wiki.complete.org/LinuxPacketRadio#ax25ipd-1

   - requires changes to ax25-apps too --

1. Update /etc/ax25/axports and define the ipct port

2. /usr/sbin/kissnetd -p2 &
    - Please record the FIRST port and SECOND port out of that list
      for follow-on commands

3. /usr/sbin/kissattach -l /dev/pts/7 ipct 44.4.10.40
    - In this example, /dev/pts/7 camesfrom the output of the kissnetd
      command above.  44.4.10.40 is my AMPR IP address

4. From the output of command in step 2, take the SECOND port given (not the
    first port) and put that into /etc/ax25/ax25ipd.conf for the "device"
line

5. run /usr/sbin/ax25ipd

6. Per db0fhn security, you MUST log into Echolink via the same egress IP
    address (easily done via NAT) as this AXUDP connection.

7. Connect to the remote station:

    call ipct db0fhn


--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html

