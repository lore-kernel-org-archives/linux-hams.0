From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: libax25 0.0.11 released
Date: Mon, 17 Mar 2003 13:42:03 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10303171338100.5861-100000@saturn.trs.ntc.nokia.com>
References: <002401c2ec69$a719c3c0$14000a0a@p75>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <002401c2ec69$a719c3c0$14000a0a@p75>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Harris <charis.g3orh@virgin.net>
Cc: Linux Hams <linux-hams@vger.kernel.org>

On Mon, 17 Mar 2003, Colin Harris wrote:

> With Tommi's update of Node and this update of libax25 ,
> forgive maybe a silly question but how is the best way to
> implement the two changes on an already running system
>  after taking it down of course ). Can I just install over
> the top starting with libax25 and then save my node.conf
> before installing node  0.3.1 in the same way ?

I think this should be just fine. If you do a "make install" with node it
should not overwrite any config files ("make installconf" does that) but
it's always a good idea to make backup copies of node.conf,perms,etc...

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

