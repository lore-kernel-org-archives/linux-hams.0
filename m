From: "Robin Gilks" <g8ecj@gilks.org>
Subject: Re: Any PHP gurus out there?
Date: Wed, 12 May 2004 11:58:55 +1200 (NZST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <46922.202.37.96.11.1084319935.squirrel@zeus.localdomain>
References: <36436.202.37.96.11.1084308102.squirrel@zeus.localdomain>
Reply-To: g8ecj@gilks.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <36436.202.37.96.11.1084308102.squirrel@zeus.localdomain>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> Greetings
>
> I've recently updated my system and am now using php 4.3. This has
> incorporated a recent change that causes register_global to be off by
> default and as a result it has broken the webconvers (ww convers access
> through a web page gateway) scripts I wrote a few years back.
>
> I've managed to get all the global variable handling stuff sorted out
> (with a sprinkling of $_POST and $_GET acesses as required!!) but I'm
> finding that in either the file or socket handling there is a very large
> delay (minutes on occation).
>
> When I get home tonite I'll post what I have to my website (look under the
> personal pages for g8ecj) in case anyone knows of a "standard fix" that
> I've missed in my browsing of php.net :-))
>

I've found the major problem at last - there is a bug in feof() handling
on non-blocking streams that causes it to hang for the timeout time. By
using stream_get_meta_data and testing the eof status I've got round it.

The suggestions of turning on register_global in php.ini, although
appreciated, are totally against what I was trying to do which was fix the
scripts so they would be more secure (which is why the change happened in
the first place!!).

Many thanks for the replies..


-- 
Robin Gilks zl3rob/g8ecj
Internet: g8ecj@gilks.org    http://www.gilks.org


