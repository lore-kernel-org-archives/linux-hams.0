From: Joop Stakenborg <pg4i@xs4all.nl>
Subject: Re: F6FBB on Debian question
Date: Fri, 28 May 2004 21:03:52 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40B78D18.1090703@xs4all.nl>
References: <1083593589.1273.39.camel@oh2bns.ampr.org>        <S263735AbUECPMZ/20040503151225Z+590@vger.kernel.org> <33777.192.168.1.116.1083599653.squirrel@gateway> <40A8FCD5.5070902@utoronto.ca> <40A90375.3080401@xs4all.nl> <40B7406B.7080909@utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40B7406B.7080909@utoronto.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Stubbs <dave.stubbs@utoronto.ca>
Cc: linux-hams@vger.kernel.org

Dave Stubbs wrote:
> Hello all,
> 
> This may be a dumb question, but I've searched all the docs I can find 
> and don't seem to get anywhere.  The FBB documentation mentions 
> INSTALL.SH for setting up initial parameters.  I installed FBB using the 
> Debian packages, and I cannot find INSTALL.SH anywhere, nor is it in the 
> file list for the package.  The BBS works quite well, as far as 
> accepting NETROM and telnet connections, except that I can't seem to set 
> security levels and actually get SYSOP access.  The Documentation 
> mentions that a file called INIT.SYS gets created, but from what I can 
> tell, the /etc/ax25/fbb.conf file seems to have SOME of the contents 
> that are supposed to be in INIT.SYS, and there is no INIT.SYS file.
> 
> Am I chasing a wild goose here?  Or is there some modification in the 
> Debian-packaged version that makes this unneccesary?
> 

You need to run /usr/sbin/fbb. This is actually a shell script, which 
asks questions and sets up a fbb.conf and port.sys file. Next it runs 
the actual daemon (xffbd). The script is easy to read, see also 'man fbb'.

> Thanks for your help,
> 
> Dave
> VA3BHF

Joop PG4I
