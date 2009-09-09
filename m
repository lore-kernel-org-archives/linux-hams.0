From: Alan Crosswell <alan@columbia.edu>
Subject: Re: Problem with soundmodem on Eee PC
Date: Wed, 09 Sep 2009 19:14:28 -0400
Message-ID: <4AA836D4.8080805@columbia.edu>
References: <984e45570909091532n34cb261hd9cdd6f30d448bf7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <984e45570909091532n34cb261hd9cdd6f30d448bf7@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julian Moss <julian.g4ilo@gmail.com>
Cc: linux-hams@vger.kernel.org

Julian,

Soundmodemconfig's diagnostic has a known issue that the scope will
sometimes freeze even though the modem is running fine.

Please send your soundmodem.conf XML file that is typically saved in
/etc/ax25/ which will help diagnose your issue.  You can use
"plughw:0,0" for example which is a software shim that will compensate
for a hardware sampling rate that doesn't match.  What kind of sound
hardware are you using?  motherboard sound card, PCI, USB?   Also, what
is the kernel release?  Do a:

uname -a
dmesg
lspci

If you look in the dmesg output or in /var/log/messages (name varies
depending on the linux distro you are using) you might see some error
messages that correlate with the soundmodem failing.

Just to assure you, once you get these issues with your sound hardware
diagnosed, soundmodem itself will run for months or years with no
problems.  I have several soundmodem-based digipeaters running that
would have been up for several years except for the occasional lose of
mains power.





Julian Moss wrote:
> Is this the right place to ask about the soundmodem AX25 soundcard driver?
>
> I am trying to get APRS running on an Eee PC Surf 2G which has had
> Eeebuntu (based on Ubuntu 9.0) installed in place of the original
> Xandros.
>
> The version of soundmodem I installed from the repository would not
> decode anything. In the diagnostic scope display I saw straight lines
> in the trace which you can see in my blog posting here:
> http://www.g4ilo.com/2009/09/eee-im-getting-nowhere.html .
>
> I found a posting in a list here
> http://osdir.com/ml/linux.hams/2005-10/msg00058.html which suggested
> that this is caused by soundmodem opening the sound card at an
> unsupported sample rate of 9600. The post included a hack to make it
> use 11025.
>
> I downloaded the source code tar.gz from here
> http://www.baycom.org/~tom/ham/soundmodem/ and compiled it. I noticed
> that the diagnostic scope display in my version froze after a couple
> of seconds. I applied the changes given in the above posting, though I
> noted that the line numbers in the config app code were slightly
> different from those given.
>
> Although the diagnostic is unusable the modified soundmodem itself
> seemed to work and decodes APRS received from my radio. However I have
> noticed that after some fairly short period of time, perhaps an hour
> or so, nothing is decoded and I have to restart the computer to get it
> going again. This obviously makes it unusable in practise.
>
> I am at a loss what to try next, since the source code is too complex
> for me to try to debug it. Has anyone got this working reliably on an
> Eee PC?
>   
