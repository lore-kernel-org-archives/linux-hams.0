From: Chris Kantarjiev <cak@dimebank.com>
Subject: Re: net2kiss and ptys
Date: Wed, 18 Jul 2007 19:58:49 -0700 (PDT)
Message-ID: <200707190258.l6J2wnLm015045@moose.dimebank.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Google knows everything, if you look hard enough.

I finally found

http://www.lanana.org/docs/device-list/devices.txt

which told me how the legacy pty devices are numbered and named.
With that in hand, I can

# makedevs /dev/ptyp c 2 0 0 8
# makedevs /dev/ttyp c 3 0 0 8
# cat < /dev/ptyp0 &
# echo hi > /dev/ttyp0
hi
# cat: Read error: Input/output error                       

That looks pretty good to me. Now for the acid test...

# kissattach /dev/tts/1 1 192.168.44.3 
AX.25 port 1 bound to device ax0
# net2kiss -i ax0  /dev/ptyp0 &
# net2kiss -i ax0  /dev/ptyp1 &

# digi_ned -p /dev/ttyp0:9600:1 -v &

sure enough, the radio transmits!

# aprsd &

(aprsd.conf has tncport set to /dev/ttyp1)

sure enough, the radio transmits!

And both packages seem to see the packets... aprsd is writing packets
into the log, but I think that they're raw KISS packets, not something
I can read :-/

Now, to try to understand if aprsd is actually doing what I want it to.
My test radio is in my office, so it's not hearing many packets!

73 de chris K6DBG

