From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Poor eth0 through put
Date: Mon, 14 Oct 2002 01:18:03 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021014011803.A9376@pull.privacy.nb.ca>
References: <4.3.2.7.2.20021013172543.00acce70@pop3.norton.antivirus>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4.3.2.7.2.20021013172543.00acce70@pop3.norton.antivirus>; from jbauerly@grapevine.net on Sun, Oct 13, 2002 at 06:04:48PM -0500
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John J. Bauerly" <jbauerly@grapevine.net>
Cc: linux-hams@vger.kernel.org

On Sun, Oct 13, 2002 at 06:04:48PM -0500, John J. Bauerly wrote:
> Hello All;
> 
> Another weekend and no progress. I compiled a new kernel for ax25 installed 
> and it seems to be ok. However when I went to send the tgz down the lan to 
> the backup machine, ftp is choking. Any file greater than 25k will not 
> transfer using ftp. I pinged the machines found a high error rate between 
> the 2 machines. I brought a third on line and both will work fine to it 
> under RH6.2. Hum. I booted the 2 problem machines into windows. Ping and 
> file transfer are ok if one or both are running windows. Don't want to run 
> windows. Since then I reloaded both machines with RH6.2 orginal kernel. 
> Checked and made sure which packages are running. The hardware is the same 
> between the 2 that are failing and the third. To me it does not look like a 
> hardware problem. It looks like a setup problem in Linux. But I have set 
> software and bios the same. What else can I check and improve the lan 
> performance?

What NICs are you using? 3Com 3c905b or $2 Realtek 8139 based card? Or some
8-bit WD*008 ISA card?

What is the physical wiring? (Cross over cables, a cheap noname hub, or a
known good Cisco switch) 

Have you tested with the newest Red Hat provided kernel for 6.2? (2.2.18-5
I think but am not certain)

Check dmesg, /var/log/messages (grep for NET, eth, IP), /var/log/boot.log

Try /etc/rc.d/init.d/networking restart
and check the log files again for errors/warnings.

Check any/all blinking lights on NICs, hubs, switches. Look for collision
light(s), and see if it lit often.

You could upgrade to RedHat 7.3, or RH 8.0. 

-ve1mct
