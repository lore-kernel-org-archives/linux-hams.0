From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: TNC Software emulator - talk with KISS interface
Date: Fri, 2 May 2003 19:30:59 +0300 (EEST)
Sender: linux-hams-owner@localhost
Message-ID: <Pine.LNX.4.44.0305021910560.4626-100000@oh2bns.ampr.org>
References: <20030502152915.24259.qmail@web13309.mail.yahoo.com>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030502152915.24259.qmail@web13309.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sriram Chadalavada <swenggsri@yahoo.com>
Cc: linux-hams@vger.kernel.org

On Fri, 2 May 2003, Sriram Chadalavada wrote:

>   I am looking for software (KISS-based)TNC emulators
> that can run on Redhat 7.3 configured with AX.25
> support.
> Currently, I have installed KISS interfaces on two
> Linux boxes and made them talk. But our project
> (KUTESAT) needs emulation of an AX.25 link between two
> systems ie a KISS interface on host talking to a sw
> TNC which in turn communicates with its counterpart on
> the other machine.

Hmm... What do you mean by an AX.25 link? What kind of signals do you need 
for the link?

The KISS "protocol" is simply a very simple encapsulation of AX.25 frames 
over serial lines. When using KISS mode, a TNC actually hands over all the 
AX.25 protocol handling to the host PC. The TNC is left only with HDLC 
processing (bit stuffing and framing), CRC checking and the actual 
modulation/demodulation.

I would say that two computers talking KISS to each other, actually have
an AX.25 link.

But maybe you need something else? Syncronous HDLC signals maybe?

>                I looked up on the web and found tfkiss
> rpm which works on Suse. Can this be used on Redhat
> 7.3 too (installation as rpm or from source)? If so,
> is it possible to make it work with the KISS
> interfaces described above (created by using
> kissattach command)?

I'm not very familiar with the TFKISS software but my understanding is
that it enables one to use a KISS TNC with terminal software that is
written for the so called WA8DED HostMode. So the serial port will still
be talking KISS. And you can not make TFKISS talk with the linux kernel.

I don't think this is what you want (?).

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

