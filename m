From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: FTP with wncrypted password.
Date: Fri, 9 May 2003 20:34:38 +0100
Sender: linux-hams-owner@localhost
Message-ID: <20030509203438.A707@pull.privacy.nb.ca>
References: <20030509145648.35959.qmail@web9605.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030509145648.35959.qmail@web9605.mail.yahoo.com>; from ari197516@yahoo.com on Fri, May 09, 2003 at 07:56:48AM -0700
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ariel mastracchio <ari197516@yahoo.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Fri, May 09, 2003 at 07:56:48AM -0700, ariel mastracchio wrote:
> Dear List:
> 
>    I'm looking for a ftp server that support encrypted
> password (not SSH or SSL, too much overhead for 1k2
> bps, and prohibited on packet!). I look in the web but
> can't found one. I test pro-ftp wu-ftp with't luck.

Either an One-Time Password, like SKey or use a public key
IDENTITY such as id_dsa.pub or id_rsa.pub in openssh ( aka user 
certificate in SSL), with no (NULL cipher) encryption.

I suspect you have to build OpenSSL with ALLOW_ENULL_CIPHER or
something like that, and I am not sure if any special flags or
patches are necessary with OpenSSH.

-ve1mct
