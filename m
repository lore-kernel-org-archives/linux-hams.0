From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: listen, permissions
Date: Sat, 14 Dec 2002 19:48:46 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212141939370.8488-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.44.0212141058400.15381-100000@jeeves.mvw.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212141058400.15381-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sat, 14 Dec 2002 mvw@mvw.net wrote:

> > Ass listen 'sniffs' the network devices, it need to run as root. I know - this 
> > is not really precise, so someone correct me.
> 
> OK, makes sense (it is a promiscuous mode interface!). But what did I do
> on my old 2.0 kernel system (my 486, which has been up forever!) to allow
> it there?

Earlier, listen was by default installed with the SUID bit set and so any
user could run it with root privileges. As this is considered somewhat
dangerous (a bug in listen could allow a local root compromise), ax25-apps
was changed not to do this. So now it is up to each sysop to enable it if
needed. You can do this as root:

 chown root /usr/bin/listen	# if not already...
 chmod u+s /usr/bin/listen

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

