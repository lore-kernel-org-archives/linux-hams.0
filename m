From: Jeremy Utley <jerutley@gmail.com>
Subject: Re: YAPP File Transfer with Linux
Date: Tue, 12 Jul 2005 11:51:00 -0700
Message-ID: <d5d4185b050712115164b44321@mail.gmail.com>
References: <Pine.LNX.4.44.0507121202210.19475-100000@srv01.compumont.com>
	 <MAEBLGENFLMMCIMBCMPOMEJKCKAA.la6gha@robenel.com>
Reply-To: Jeremy Utley <jerutley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <MAEBLGENFLMMCIMBCMPOMEJKCKAA.la6gha@robenel.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 7/12/05, Robert Eliassen <la6gha@robenel.com> wrote:
> Is TCP/IP often (always?) encapsulated in NetROM or similar protocols over
> AX.25, or is it possible (implemented somewhere) to send IP-packets right in
> AX.25's payload? The routing has to be figured out some way...

From what I remember, both are possible.  TCP/IP can be encapsulated
into the payload of an AX.25 frame, or it can also be a part of netrom
communication.  IIRC, when TCP/IP is sent via NET/ROM there are 3
layers - TCP/IP encapsulated in AX.25, further encapsulated into
NETROM, but I may be mistaken about that.  It's been a while since I
played with JNOS and saw all that stuff.

Jeremy, NW7JU
