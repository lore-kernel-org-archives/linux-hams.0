From: Chuck Hast <wchast@gmail.com>
Subject: Re: Trying to get Ax25 running.
Date: Wed, 13 Oct 2004 18:55:44 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <620c90570410131855154bae53@mail.gmail.com>
References: <20041013024040.43747.qmail@web40829.mail.yahoo.com>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20041013024040.43747.qmail@web40829.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Folks,
I updated my Linux install to 2.6.5.7-108default, and only got one lockup
and that was under X. At first I thought it may have been due to the fact
that all the ax25 stuff is under root, not sure if that is where it is supposed
to be. If I run  call from a consol screen under both root and my login, it
appears to be working now to the point where I can do ax25 calls. Next
step will be to start putting in the network stuff.

Once I get it all running then I will need to see how to build something
that I can stick on a CD in order to distribute to the other switch ops who
want to move to Linux. 

I assume that Call will not run in a X console. That appears to be where
things go off into the weeds, by way last time I locked it up I tried to
ssh in from another machine on my network, no joy. I could not even ping
the machine, so it appears that it was locking up solid. 

Now to start adding the ROSE and Node stuff to it so that we can start
testing the piece that we need for our network here, and also will be
adding the other network stuff so people can play with the whole nine
yards.



-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
