From: Josh Freeman <cpe.jfreeman@gmail.com>
Subject: Re: Unwanted packets on AX25 interface
Date: Wed, 25 Jan 2006 16:22:53 -0600
Message-ID: <96cafccb0601251422l78d31119oc8e45c7275d3e34f@mail.gmail.com>
References: <478F6623898BBC4DBD692A223D28298A165991@amewebsrvr.webametx.local>
	 <96cafccb0601250711n63221f4xc537bbc5290579e0@mail.gmail.com>
	 <43D7BD3F.4060401@lightningflash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43D7BD3F.4060401@lightningflash.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 1/25/06, J. Lance Cotton <joe@lightningflash.net> wrote:
>
> Also turn off the mdns service. It's not related to samba. It's some kind of
> auto-finding name service. Apple calls it "Rendezvous", but it has a generic
> name, too; I just can't remember it.
>

Ah-ha! Killing mDNS got rid of the first

Tx: fm KI4ITI-9 to QST-0 UI  pid=CC
F..(..@................."...............

packet, anyway. I'll have to use it a bit to see if the others show up
again - from what I've seen so far I can't predict when they'll come
out. I'd wager, though, that mDNS is the culprit there too.

Thanks for the help!

Josh KI4ITI
