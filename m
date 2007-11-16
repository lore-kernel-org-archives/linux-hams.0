From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Soundmodem - suppresing initial xmit
Date: Fri, 16 Nov 2007 08:48:25 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0711160846190.29303@eskimo.com>
References: <20071116163231.GA9559@reid1.localdomain>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20071116163231.GA9559@reid1.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: don <don_reid@comcast.net>
Cc: linux-hams@vger.kernel.org

On Fri, 16 Nov 2007, don wrote:

> When I start soundmodem, it sends out several transmissions.
> They are addressed to "QST-0" and identify my workstation.
>
> Is there a simple way to suppres these?  They are fairly long
> and sometimes I just want to listen to packets (like on an APRS freq).

Just a guess (and I'm probably totally wrong on this), but do you
have Samba configured on that machine?

I remember some people ended up with SMB broadcasts going out on
that interface.  The fix was to tweak the Samba configuration so
that it didn't use that networking interface.  By default Samba
broadcasts on all interfaces as I recall.

--
Curt, WE7U: <www.eskimo.com/~archer/>     XASTIR: <www.xastir.org>
  "Lotto:  A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
The world DOES revolve around me:  I picked the coordinate system!
