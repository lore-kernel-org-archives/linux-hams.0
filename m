From: mvw@mvw.net
Subject: Re: Beginner questions about soundmodem and others
Date: Thu, 9 Jan 2003 21:17:03 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301092114460.1632-100000@jeeves.mvw.net>
References: <20030109175607.0c94ab8f.washer@trlp.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030109175607.0c94ab8f.washer@trlp.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Washer <washer@trlp.com>
Cc: linux-hams@vger.kernel.org

james

I can answer one of your questions:

> 1)I'm confused by this whole AX.25 kernel thing... I had assumed that
> (most) TNCs handled the AX.25 protocol themselves. I understand that
> with a soundmodem, the linux system would have to do the AX.25, but what
> about if I use an off-the-shelf TNC ( kpc3 for example ). Does linux
> arrange to turn the AX.25 handling OFF in the TNC and do it in software?

Yes. The TNC is put into "KISS" ('Keep It Simple St...') mode, and becomes 
a dumb bitmodem, in affect. The kernel then handles everything. The gives 
you much more control, of course - otherwise you could not have your PC 
directing (and driected by) ax25.

Alternately, you could use a TNC and its inbuilt ax.25 plus PBBS, and no 
PC at all except to read messages people leave you. But then you'd miss 
out on all this fun. ;)

Michael VA3MVW






