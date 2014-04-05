From: David Ranch <linux-hams@trinnet.net>
Subject: Re: UBUNTO 12.04 VScom TC800  Serial Kissattach ax??- port configuring
 corruption HELP Required please
Date: Sat, 05 Apr 2014 13:49:43 -0700
Message-ID: <53406C67.3080008@trinnet.net>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org> <024rua-e6d.ln1@atomos.longlandclan.yi.org> <IYGDg$AQECNTFw+e@skywaves.demon.co.uk> <14505098c38.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl> <14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl> <VHW0nDBbGtPTFwcl@skywaves.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <VHW0nDBbGtPTFwcl@skywaves.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Paul

> it configures the first four ax0-ax3 Interfaces and pick upi the port
> details from
> the axports file correctly. continuing ax4 to ax6
>
> Checking the setting again with ifconfig,
> I find that ax0, ax3, ax4 have lost there settings e.g
> ax0       Link encap:AMPR AX.25  HWaddr
>            BROADCAST MULTICAST  MTU:256  Metric:1
>            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>            TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>            collisions:0 txqueuelen:10
>            RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

You need to provide some more information.  Specifically,

   - What distro
   - what kernel
   - what kind of TNCs
   - what version of the various ax25 libs, tools (ax.25 official, 
ve7fet, etc)

Anyway, in troubleshooting this, try bringing everything up for ax0 and 
show us the output of both "ifconfig" and the relevant / corresponding 
output in /var/log/messages.  Then go ahead and bring up ax1 and make 
sure things are ok.  Do that again for ax2 and ax3 and make sure things 
are ok.  Then try bringing up ax4 and see if things break.  If they do, 
send us the output of ifconfig and /var/log/messages.


> Early this morning 03:30 hours when I left the server running
> I had lost three interfaces ax0, ax3, ax4

It's hard to tell what might be happening.  Could be a misconfiguration, 
could be RFI getting into the serial card, etc. The output of 
/var/log/messages might show the card going away and coming back, etc.


--David
KI6ZHD
