From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Suse 9.1 and Xastir problems compiling
Date: Tue, 6 Jul 2004 10:03:23 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.SUN.4.58.0407061002350.29856@eskimo.com>
References: <40E9E13A.8090207@ftc-i.net>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40E9E13A.8090207@ftc-i.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gale D. Wilkinson" <gdwrbw@ftc-i.net>
Cc: linux-hams@vger.kernel.org

On Mon, 5 Jul 2004, Gale D. Wilkinson wrote:

> I am having a problem getting Xastir to compile on Suse 9.1 as the
> ./configure script says it can not find the Motif devel files.  Per Yast
> they are installed.  Even went so far as to remove Motif and install
> Lesstif with the same results.
>
> Hopefully some one out there has managed to get Xastir up and running on
> Suse 9.1!
>
> As I am a fairly new user of Linux I have no idea where to look,  any
> help would be greatly appreciated.

Send me the output of this command:

    rpm -q -a | grep -i motif

And also send me your config.log file.  Don't send all that to the
list.  Thanks.

--
Curt, WE7U			         http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
