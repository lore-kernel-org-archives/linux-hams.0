From: Chuck Hast <wchast@gmail.com>
Subject: Re: Trying to get Ax25 running.
Date: Sat, 16 Oct 2004 08:08:17 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <620c90570410160808749d301@mail.gmail.com>
References: <620c905704101518153ff636e@mail.gmail.com>
	 <4323.192.168.0.2.1097865189.squirrel@192.168.0.2>
	 <1097866437.1290.30.camel@oh2bns.ampr.org>
	 <Pine.SUN.4.58.0410151221210.28043@eskimo.com>
	 <620c9057041015125535932b34@mail.gmail.com>
	 <620c90570410151618432401d1@mail.gmail.com>
	 <200410160128.i9G1Sk2M028098@yagi.h-net.msu.edu>
	 <1097930726.1287.1.camel@oh2bns.ampr.org>
	 <620c905704101606165716759@mail.gmail.com>
	 <1097934722.1296.8.camel@oh2bns.ampr.org>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1097934722.1296.8.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Sat, 16 Oct 2004 16:52:02 +0300, Tomi Manninen <oh2bns@sral.fi> wrote:
> On Sat, 2004-10-16 at 16:16, Chuck Hast wrote:
> 
> > I have done that, but I still have a problem. When I run the ax25-up file that
> > is set up for for the mkiss line, it starts up ok the first time, but
> > when I run the
> > ax25-down file that ax25-config generates it does not shut down a mkiss entry
> 
> Hmm.. I guess the simple solution would be to do a "killall mkiss"
> somewhere near the top of the script. It should be placed before the
> kissattach processes are killed.
> 
> > if I do a ps -e I see a PID and mkiss if I do a ps -r I see that it is
> > the attachment
> > to the ttyz0 port that does not go away.
> 
> This makes me wonder if the pty behaviour has changed along the way and
> if my suggestion about the order of kissattach/mkiss is valid anymore...
> Oh well... :)
> 
> 
> 

here is the ax25-down script that is supposed to kill it all.
I am not using any of this but just the AX25 stuff. I run listen
manually right now.
I am just trying to sort through it all.

-----------------------------------------------------------------
#!/bin/bash
#
# Einen eventuell laufenden ax25d beenden
if [ -s /var/run/ax25d.pid ]; then
  tmp="`cat /proc/\`cat /var/run/ax25d.pid\`/cmdline`"
  if [ "$tmp" == "/usr/sbin/ax25d" ]; then
    kill `cat /var/run/ax25d.pid`
  else
    echo "stale \"ax25d\" pid-file, deleting..."
  fi 
  rm -f /var/run/ax25d.pid
fi
# Monitor beenden
if [ -s /var/run/listen.pid ]; then
  tmp="`cat /proc/\`cat /var/run/listen.pid\`/cmdline`"
  if [ "$tmp" = "/usr/bin/listen" ]; then
    kill `cat /var/run/listen.pid`
  else
    echo "stale \"listen\" pid-file, deleting..."
  fi
  rm -f /var/run/listen.pid
fi
echo "$(ls /proc/sys/net/ax25)" > /tmp/ax25-config.tmp
read Auswahl < /tmp/ax25-config.tmp
i=0
while [ "$Auswahl" != "" ]
do
let i=i+1
awk ' NR == '$i' { print $1 }' /tmp/ax25-config.tmp > /tmp/ax25-config-tmp
read Auswahl < /tmp/ax25-config-tmp
if [ "$Auswahl" != "" ]; then 
ifconfig "$Auswahl" down
fi
done
# Startkiss0
killproc -KILL /usr/sbin/kissattach > /dev/null
modprobe -r ax25; modprobe -r kiss; modprobe -r mkiss > /dev/null
# Endkiss0
--------------------------------------------------------------


-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
