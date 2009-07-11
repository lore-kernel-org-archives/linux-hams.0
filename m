From: Pino Zollo <pinozollo@gmail.com>
Subject: Re: [Ham-Linux] Proposal for coding in UTF-8
Date: Sat, 11 Jul 2009 17:38:42 -0400
Message-ID: <200907111738.42775.pinozollo@gmail.com>
References: <200907101616.26422.pinozollo@gmail.com> <4A58F368.5030802@kd4e.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to
         :subject:date:user-agent:cc:references:in-reply-to:mime-version
         :content-type:content-transfer-encoding:content-disposition
         :message-id;
        bh=l5Hu0uEdolnmRFSEZ7/EZLn/nk1Pb0CagkO5fWt5qls=;
        b=seR2FtpkgQDhqcTx5TbAG00gn2fKXJgkEctaGaMY1tzlENiZ5Lb7RXU5AMmxlgRf+/
         3NSAMQHsnk66qMH+nzIt2XWTVwBPVmAqyLpkY/BItnZdXevd/+NDSlf5bcDZBQwIJReG
         zLDHMWPu6D0uXYTxm0RBbZV8SqhF/1JUAcXiU=
In-Reply-To: <4A58F368.5030802@kd4e.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doc@kd4e.com
Cc: ADIF <adifdev@yahoogroups.com>, Debian Hams <debian-hams@lists.debian.org>, Linux Hams <linux-hams@vger.kernel.org>

Il sabato 11 luglio 2009 16:17:44 kd4e ha scritto:
> Is this also compatible with CQRlog as well?
> (Linux, MS, and maybe Apple, not sure.)

I don't know....

If a logger receives an UTF-8 adif file and does not how to handle it will  
bounce a lot of errors...

If a logger receives an ISO-8859-1 adif file and ignores the tag all will be 
OK .

At  present only DBLog knows what to do of the ENCODING tag.

73
Pino ZP4KFX

>
> Pino Zollo wrote:
> > Hi de ZP4KFX
> >
> > I propose to include into the standard the following tag for the header:
> >
> > <ENCODING:5>UTF-8
> >
> > ENCODING can be absent or can be <ENCODING:10>ISO-8859-1
> >
> > This is already implemented in my DBLog...see
> > http://www.qsl.net/zp4kfx/Linux
> >
> >
> > http://www.qsl.net/zp4kfx/Linux/TestUTF8.html
> >
> > http://www.qsl.net/zp4kfx/Linux/DBLog/Shot-QSO%20List-utf8-%20test.png
> >
> > DBLog works on Linux and stores data's on PosgreSQL, both of which are
> > UTF-8 compliant.
> >
> > DBLog can export both in ISO-8859-1 or in UTF-8.
> >
> > Importing, if it  finds into the header <ENCODING:5>UTF-8  then does not
> > do any coversion.
> > If it  finds  <ENCODING:10>ISO-8859-1 or no ENCODING tag, then converts
> > into UTF-8.
> >
> > The difference is mainly for the accented vowels (from 128 to 256) that
> > come mainly by N1MM or Logger32 ADIF files.
> >
> > Also other loggers could follow this method or be aware of the ENCODING
> > tag to avoid errors.
> >
> > Best 73 de
> >
> > Pino ZP4KFX



-- 
Key ID: 0xF6768208 
Key fingerprint = B16D 0A7C 5B29 A334 CE6A  71F6 EAF8 3D88 F676 8208
Key server: hkp://wwwkeys.eu.pgp.net
