From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: ANN: gMFSK v0.4
Date: Mon, 8 Apr 2002 18:32:40 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0204081822410.15167-100000@oh2bns.ampr.org>
References: <3CB1CD09.12082.1950EDB@localhost>
Reply-To: <tpm@prkele.tky.hut.fi>
Mime-Version: 1.0
In-Reply-To: <3CB1CD09.12082.1950EDB@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wilbert Knol <w.knol@niwa.cri.nz>
Cc: linux-hams@vger.kernel.org

On Mon, 8 Apr 2002, Wilbert Knol wrote:

> A question: I would like to extract PTT from a USB serial adapter, but the 
> device file for it doesn't show up in the pick list of gMFSK. Can I safely 
> add a symlink to the USB device file and call it, say /dev/ttyS99?

You can type whatever filename you want in the PTT text entry box. It
doesn't need to be from the list.

I don't have any USB serial converters here but I suppose you could just
type /dev/ttyUSB0 or /dev/usb/ttyUSB or whatever there. If the USB serial
driver implements the necessary ioctls it should work.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

