From: Thomas Osterried <thomas@osterried.de>
Subject: Re: axspawn and security on the air
Date: Wed, 28 May 2003 18:01:00 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030528160100.GA8977@osterried.de>
References: <3ED4C9DA.6070108@lightningflash.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3ED4C9DA.6070108@lightningflash.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Lance Cotton" <joe@lightningflash.net>
Cc: linux-hams@vger.kernel.org

> callsign and wreak havoc. If I require a password for user login, the 
> password is transmitted plaintext, right? Same situation as before.

with our digi / mailbox db0tud, we do it this way:

users have empty passwords.

if we need to authenticate for administration (root access), we use
the package "root"
(see http://x-berg.in-berlin.de/cgi-bin/viewcvs.cgi/ampr/root/ for details).

"md5root" uses a md5-based hashing algorithm like it is used by the bbs'es
(dpbox, etc..). root is suid bit. if the challenge response is ok,
a uid-0 shell is spawned. no plaintext password is transmitted.

but be aware that ax25 sessions as well as tcp sessions could be overtaken
by another user. on the other hand, it's ham community, not inet..

73,
	- thomas

