From: Bill Vodall <wa7nwp@jnos.org>
Subject: Re: YAPP File Transfer with Linux
Date: Tue, 12 Jul 2005 09:13:40 -0500 (CDT)
Message-ID: <Pine.LNX.4.44.0507120900580.14121-100000@srv01.compumont.com>
References: <20050712084205.55ec6610.rodob@datafull.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050712084205.55ec6610.rodob@datafull.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


> Bill Vodall WA7NWP wrote:
> 
> > I'm looking for a command line YAPP file transfer
> > facility for Linux.
> 
> Linpac does yapp transfers. I use it, and can upload or download files
> from the local fbb bbs.
> 
> Linpac is a console packet terminal program. It seems like old dos
> baycom program. It's mail support is not that good, but I like it.

Thanks for the reply.

Linpac might work as the client IF it can be scripted to do
the transfer as part of a script with no user intervention.

I'm looking for a much lighter weight serve application then
having to use a full FBB installation.

The examples Curt found might work with some modifications if
I can't find anything else.

Ideally this will work over the AX25 packet system in Linux.

The goal is to be able to script something like:

 # Package Email and NNTP postings in a single file (UUCP does this)
 # (or use a file of exported packet bulletins)
 $ bzip2 -9 FILE
 # send the compressed bundle to the remote system
 $ ax2cp FILE.bz  REMOTE-SYSTEM:FILE.bz

Once at the remote, the file would be decompressed and imported
into the standard Email, News or Packet communication systems.


An alternate solution would be UUCP directly over AX25 packet.  I
know it's been done.  Has anybody here worked through the details
and set it up?

Thanks all,

Bill - WA7NWP

