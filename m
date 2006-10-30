From: Al Bolduc <a.bolduc@comcast.net>
Subject: Re: gMFSK & QSSTV
Date: Mon, 30 Oct 2006 18:22:27 -0500 (EST)
Message-ID: <Pine.LNX.4.62.0610301818460.25123@mars.local.net>
References: <454687F8.9010303@certin.com>
Reply-To: Al Bolduc <a.bolduc@comcast.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <454687F8.9010303@certin.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Eric W. Davenport" <kz5ed@certin.com>
Cc: linux-hams@vger.kernel.org, a.bolduc@comcast.net

On Mon, 30 Oct 2006, Eric W. Davenport wrote:

>
> I saw the script that Al uses and would like to try it but.. I have never 
> created a script so I do not know where to use it.  User a terminal program 
> and run it from there then launch QSSTV, does not seem like it will work 
> since it requires SU.  If I am in SU then if I launch QSSTV it will not find 
> the config file.
>
> So I am confused and if anybody can help me I would appreciate it.
>
> Eric
> KZ5ED
>

You can run the script as SU, then run qsstv as a regular user.  I run the
script from rc.local during boot.  It only has to be run once per boot.
If you want to add another ap to the list, you can run it again as root.

Al

#  Al Bolduc - a.bolduc@comcast.net - ka1as@amsat.org
