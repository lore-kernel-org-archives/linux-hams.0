From: Bud Rogers <budr@netride.net>
Subject: Re: Run app on login
Date: Sat, 13 Nov 2004 21:06:58 -0600
Message-ID: <200411132106.58898.budr@netride.net>
References: <620c9057041113184754867a6d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c9057041113184754867a6d@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Saturday 13 November 2004 20:47, Chuck Hast wrote:
> Folks,
> I am trying to figure out how to have a particular application start
> up when a user logs in with a specified login.
> Example,
> User logs in with "radio"  password "hamradio"
> Instead of bringing up a prompt, I want a login of radio to start up
> a special application. I am sure that Linux can do it, just not quite
> sure how to do so.

Anything you put in a user's .bashrc or .bash_profile will be run 
whenever that user logs in.  You can have it set up things in your 
environment, or run certain commands.  Man bash will give you the 
details.

HTH  73

-- 
Bud Rogers  <budr@netride.net>  KD5SZ  EM05vb
