From: Chuck Hast <wchast@gmail.com>
Subject: Re: Run app on login
Date: Sun, 14 Nov 2004 15:53:42 -0800
Message-ID: <620c905704111415532b703c30@mail.gmail.com>
References: <Pine.LNX.4.44.0411131952180.1435-100000@wapiti>
	 <20041114184424.66418.qmail@web60610.mail.yahoo.com>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20041114184424.66418.qmail@web60610.mail.yahoo.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Sun, 14 Nov 2004 10:44:24 -0800 (PST), Jim Bayer <kc9aop@yahoo.com> wrote:
> Curt,
> 
> You will also need to change /etc/shells to include the new login script or the "radio" user may
> not be able to log in.  It will not be able to ftp for certain.
> 
> '73

I made the app the shell and as soon as the user drops out of it they
are logged out, that
was my original worry when they were logging in as they got a command
prompt then
they had to start the app. Now the login starts the app as the shell
and it is done.
