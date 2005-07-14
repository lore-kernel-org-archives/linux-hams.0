From: Dave Platt <dplatt@radagast.org>
Subject: Re: SSH and the NONE option
Date: Thu, 14 Jul 2005 10:01:03 -0700 (PDT)
Message-ID: <20050714170103.29558.qmail@radagast.org>
References: <1121353960.6146.1.camel@localhost>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1121353960.6146.1.camel@localhost>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: abates@omeganetserv.com
Cc: linux-hams@vger.kernel.org

>  
> > Everything in Amature Radio is clear text, so any protocol for
> > authentication has to be OK.  Your ID and password comes along in
> > clear text and that's that.  I guess frequent password changes are the
> > only answer to comfort with security.
> > 
> > Seems like ftp and rcp may be the best bet.
> > 
> 
> If a two factor authentication scheme could be used, then that's the
> ticket.... a challenge response authentication for example... more
> elegant would be something using a hashed password based on a passcode
> and revolving token.  Let's be creative, there are more ways then just
> "ssh"

I thought this issue through when I was setting up an SMTP/IMAP
server for TCP/IP-over-AX.25.  I came to the tentative conclusion
that it would probably be OK to use authentication systems such as
the CRAM-MD5 and similar hash-based schemes.  These don't actually
send the password over the air (encrypted or otherwise);  rather,
they're of the challenge/response sort, in which the client proves
that s/he has a secret also known to the server, but the secret itself
is not transmitted.

These algorithms do use a "large binary number to ASCII" encoding for
transmitting the challenge from the server and the response by the
client, but this is a publicly-documented algorithm and I think it
can be argued that it doesn't obscure the meaning of the data being
transmitted.

Another alternative, which would be entirely in clear text, would
be a one-time password system based on S/Key.  The standard Linux
implementation for this would be OPIE ("One-Time Passwords in
Everything").  There's an OPIE plugin for the Linux PAM (pluggable
authentication module) system, which is or can be used by ssh,
login, ftp, rcp/rsh, and so forth.  An FTP session, or a simple
login session which invoked netcat, might be a decent way to provide
for in-the-clear data transfer to a system which still had a
hard-to-crack access authentication.

An OPIE-based authentication system can have a place even in the
wired-communication world where secure systems such as ssh are
available.  A server which runs ssh, and which will accept OPIE
or other one-time passwords for access, is a convenient thing to have
if you think you may have to use public-access computers (libraries,
cybercafes) to access your system, and you're concerned about
malware such as keystroke loggers which might have been installed
on those systems.

