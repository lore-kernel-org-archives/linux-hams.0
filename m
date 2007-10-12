From: "Jeremy Utley" <jerutley@gmail.com>
Subject: Re: linux-ax25.org website issues
Date: Fri, 12 Oct 2007 12:27:14 -0700
Message-ID: <d5d4185b0710121227w300565c9q2f84a6518179db1f@mail.gmail.com>
References: <470F751D.9000303@w1nr.net> <20071012171601.GA10256@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=hEIta4zNqRIJVQVtnUQg36+sPhuaH8P9XupS/n5Jg+A=;
        b=qu0btAF8PeJoJh7+djDvI2HTvc+hiTcpmbBAwJfdGmJrTpvgefayJ4hVpgOuZJsZgNrI+zJyeWqW21U2mNmwlDl/Dfz8B/dO5p0SoYw/fSi/zViZwKt/rV2XGtGSweTGGoYtdcfohru5zN9V62AEgXVn6GySLCLbe8XopRO48BI=
In-Reply-To: <20071012171601.GA10256@linux-mips.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

On 10/12/07, Ralf Baechle DL5RB <ralf@linux-mips.org> wrote:
> On Fri, Oct 12, 2007 at 09:22:37AM -0400, Mike McCarthy, W1NR wrote:
>
> > There seems to be a database problem at the www.linux-ax25.org website.
> > Does anyone have the contact info for the webmaster to let them know
> > there is a problem?
>
> You might try webmaster@linux-ax25.org ;-)

That'd be too logical for a ham radio operator to figure out (tounge in cheek)

>
> What happened is that mysql once more shot itself into the foot:
>
> [root@ftp wikidb_ham]# myisamchk text.MYI
> Checking MyISAM file: text.MYI
> Data records:    2253   Deleted blocks:      10
> myisamchk: warning: Table is marked as crashed
> - check file-size
> - check record delete-chain
> - check key delete-chain
> - check index reference
> - check data record references index: 1
> myisamchk: error: Found 2252 keys of 2253
> - check record links
> myisamchk: error: Keypointers and record positions doesn't match
> MyISAM-table 'text.MYI' is corrupted
> Fix it using switch "-r" or "-o"
> [root@ftp wikidb_ham]#
>
> MySQL marking one of its tables as crashed without crashing itself has
> unfortunately become a somewhat regular event.  I think it may have
> started around the time when the system got migrated from a dual P3 to a
> Xeon P4 running all 64-bit software so already quite a while ago.  Maybe
> somebody here has seen the same sort of issue?

I see this fairly often on the mysql servers at work - but usually as
a result of a hardware crash.  We use a shell script that will run a
"CHECK TABLE" command on all tables, then follow it with a script that
looks at the output to find corrupt tables, and does a "REPAIR TABLE"
on them.

The normal operation of MySQL is to lock the table when it detects
corruption - that way it can continue to serve other requests that it
can complete.

Jeremy, NW7JU
