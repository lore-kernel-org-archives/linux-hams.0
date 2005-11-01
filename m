From: Jim Bayer <kc9aop@gmail.com>
Subject: Re: KPSK install problem
Date: Tue, 1 Nov 2005 09:51:35 -0600
Message-ID: <e524c5320511010751g3ecd1147pc20f0459a533375b@mail.gmail.com>
References: <4363D46A.9020206@gmail.com>
	 <MBEEJPNKIJCJGNMGGBLBEEJFCFAA.henk@oegema.com>
	 <20051031022838.GA3286@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051031022838.GA3286@cloud.net.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

You should try using the locate command.  where is only returns
executables in your path.

first as root:# updatedb  (this creates the locate database)
then # locate db.h

or you could just run a find command from the root file system:

# cd /
# find . -name "db.h" -print

will search your entire disk for the file.


Good luck and '73

Jim - KC9AOP

On 10/30/05, Hamish Moffatt <hamish@cloud.net.au> wrote:
> On Sat, Oct 29, 2005 at 10:14:23PM +0200, Henk Oegema wrote:
> > I dont have any files with a name db.h
> > When I do a 'whereis db.h' I get: /usr/share/man/man3/db.3.gz
> >
> > Neither in /usr/include nor /usr/local/include is db.h
>
> Then you need to install a db development package for your distribution
> eg libdb4.1-dev on Debian.
>
> 73
> Hamish
> --
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
