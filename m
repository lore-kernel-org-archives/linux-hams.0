From: Bob Nielsen <nielsen@oz.net>
Subject: Re: YAPP File Transfer with Linux
Date: Tue, 12 Jul 2005 07:56:07 -0700
Message-ID: <20050712145607.GA17243@oz.net>
References: <20050712084205.55ec6610.rodob@datafull.com> <Pine.LNX.4.44.0507120900580.14121-100000@srv01.compumont.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0507120900580.14121-100000@srv01.compumont.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Jul 12, 2005 at 09:13:40AM -0500, Bill Vodall wrote:
> 
> > Bill Vodall WA7NWP wrote:
> > 
> > > I'm looking for a command line YAPP file transfer
> > > facility for Linux.
> > 
> > Linpac does yapp transfers. I use it, and can upload or download files
> > from the local fbb bbs.
> > 
> > Linpac is a console packet terminal program. It seems like old dos
> > baycom program. It's mail support is not that good, but I like it.
> 
> Thanks for the reply.
> 
> Linpac might work as the client IF it can be scripted to do
> the transfer as part of a script with no user intervention.
> 
> I'm looking for a much lighter weight serve application then
> having to use a full FBB installation.
> 
> The examples Curt found might work with some modifications if
> I can't find anything else.
> 
> Ideally this will work over the AX25 packet system in Linux.
> 
> The goal is to be able to script something like:
> 
>  # Package Email and NNTP postings in a single file (UUCP does this)
>  # (or use a file of exported packet bulletins)
>  $ bzip2 -9 FILE
>  # send the compressed bundle to the remote system
>  $ ax2cp FILE.bz  REMOTE-SYSTEM:FILE.bz
> 
> Once at the remote, the file would be decompressed and imported
> into the standard Email, News or Packet communication systems.
> 
> 
> An alternate solution would be UUCP directly over AX25 packet.  I
> know it's been done.  Has anybody here worked through the details
> and set it up?

Another alternate would be to use a FTP client which allows sending a 
file via the command line, such as ncftpput.  If there is a way to use 
SSH without encryption (or if the FCC dropped the prohibition of 
encryption), scp could handle the file transfer and compression in one 
step.  Or are you trying to avoid tcp/ip?

Bob, N7XY

