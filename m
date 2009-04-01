From: Andre Lohan <dc5ala@darc.de>
Subject: Re: how to gracefully exit aprsd server port connection?
Date: Wed, 01 Apr 2009 22:39:15 +0200
Message-ID: <49D3D0F3.6020000@darc.de>
References: <024001c9b2f7$00f80410$2401a8c0@fourwinds>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <024001c9b2f7$00f80410$2401a8c0@fourwinds>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Rick Bolen (GM) schrieb:
> Hello,
>
> I have a perl script that connects to an APRSd server port (#14579 - TNC
> data only) and displays it to the console. The feed instructions state
> to hit "ctrl-D" to exit.
>
> This does not work for me. Nothing happens. If I hit "ctrl-C" from the 
> console running my script, it kills the entire aprsd process!
>
> How do I gracefully close my socket connection without taking out the
> whole process?
>
> Thanks,
>
> Rick - KG4OFO
>   
Hello Rick,

my guess is that your script needs to send the ctrl-d to exit. If you 
start your script and hit ctrl-d it's your script that receive that key 
and not the server you are connected to via the script. So your script 
needs to send ctrl-d (EOF, ASCII code 0x1a) to disconnect from the aprs 
server. Maybe you can modify the script to "forward" the EOF to the server.

73,
Andre - DC5ALA
