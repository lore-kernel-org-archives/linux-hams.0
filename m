From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: AX25 and FBB!
Date: Sat, 15 Mar 2003 21:22:49 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0303152113190.1305-100000@oh2bns.ampr.org>
References: <3E7376CA.9040100@kj6eo.com>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E7376CA.9040100@kj6eo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Walton <kj6eo@kj6eo.com>
Cc: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

On Sat, 15 Mar 2003, Bill Walton wrote:

> What kept the whole thing from working was some "syntax" errors in the
> "node.conf" file.  Some of the parameter values needed to have some of
> the letters capitalized ie "ConnTimeout" instead of "conntimeout" and so
> on.

This is really surprising and actually very hard for me (as the author 
of LinuxNode) to believe. In fact in the source code of node this is the 
way the config commands are defined:

	...
	add_internal_cmd(&cfg_cmds, "alias",        0, do_alias);
	add_internal_cmd(&cfg_cmds, "conntimeout",  0, do_conntimeout);
	add_internal_cmd(&cfg_cmds, "escapechar",   0, do_escapechar);
	...

You will notice that the command name is in lower case. The actual command
parser then is case insensitive.

Could it be that there were other errors in the commands? What does the 
error message in the system log file look like?

> I know that this mailing list is not really intended for FBB questions
> but I am in hopes that you will just "look the other way" and answer my
> simple question if you can.

I'm sure you'll get a good answer from someone here. But there is also a
xfbb list. See http://www.f6fbb.org/mailists.html.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

