From: "Vic" <radio@beer.org.uk>
Subject: Re: Cloning Hard drives
Date: Sun, 9 Dec 2007 22:34:55 -0000 (GMT)
Message-ID: <60437.127.0.0.1.1197239695.squirrel@127.0.0.1>
References: <0JSS00MBZU39P300@bgmpomr1.sasknet.sk.ca>
Reply-To: radio@beer.org.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0JSS00MBZU39P300@bgmpomr1.sasknet.sk.ca>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> Is there a way to clone or ghost a Linux hard drive??

Yes.

dd is the best way IMO - just make sure you've got DMA turned on & use a
decent blocksize, or it takes forever.

There are a couple of utilities that do stuff like this - such as FOG
http://freshmeat.net/projects/freeghost/ . I don't use apps like this;
they're just fluff as far as I'm concerned.

If you're trying to move between different filesystems, consider using
rsync. You ought really to do this from a liveCD, but TBH, I've done it
loads of times with no problems. You just get a warning next time you
boot...

HTH

Vic.

