From: Jason Flynn G7OCD <jason.flynn@btinternet.com>
Subject: Re: Responses to my Kenwood D7 question
Date: Sun, 11 Aug 2002 18:14:05 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D569B5D.2020506@btinternet.com>
References: <Pine.LNX.4.21.0208111720040.8397-100000@Consulate.UFP.CX>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Riley Williams <Riley@Williams.Name>
Cc: M Taylor <mctylr@privacy.nb.ca>, John Ackermann N8UR <jra@febo.com>, linux-hams@vger.kernel.org

Riley Williams wrote:
> Does anybody have details of precicely what sort of functions are
> implemented in the KISS mode that is implemented in the TH-D7 ???
> If so, perhaps somebody can write code for the Linux kernel that
> works around whatever limitations it has.

Basically, it's not 8bit clean. I can't see a workaround for this.

This is the story:

In the D7E (note E) mark 1 the TX didn't work. I complained a bit
about this and after a while Kenwood UK told me there would be a
mark 2 because alot of people wanted to use DAMA in Europe (and
most DAMA slaves were PC based?) so they would 'fix' KISS.
So I got on a trial with them.. After a few revisions they got
to this:

1) TX in KISS mode fixed. Good.
2) Note arrives with beta handset from Kenwood JP something like
this :

" To 'make room' for this in the ROM, we had to remove Transparent
Mode from non-KISS mode. Also while in KISS mode can't send binary"

So I told them, that unless it was KISS as in they proper spec then
there was no point in releasing it. They told me they already commited
to a mask for new PROMS. So now I had a handy with a built in TNC
that
1) STILL can't do KISS
2) Can't send binary when not in KISS mode... so I was stuck with
7+/YAPP/UUE etc :-(

After that, I sold mine.

	J



