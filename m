From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Linpac 0.21 (AX.25 packet radio application) posted
Date: Fri, 29 May 2015 13:47:50 -0700
Message-ID: <5568D076.1060909@trinnet.net>
References: <5563611F.5020204@trinnet.net> <5565EC9D.6060604@uns.ac.rs> <55669E84.2020500@trinnet.net> <5568A972.5010104@uns.ac.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5568A972.5010104@uns.ac.rs>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Miroslav Skoric <skoric@uns.ac.rs>, Linux Hams <linux-hams@vger.kernel.org>


Hello Misko,


> . . . Or in the other words: Could Linpac be
> installed to access a simulated packet network (a node + fbb) in the
> same computer, so to handle mails within the fbb?

So you're saying you'd like to use Linpac's Mail Reader as seen here:

 
http://a.fsdn.com/con/app/proj/linpac/screenshots/linpac-message-index1.png/182/137

to be your preferred message reader for the messages in your FBB BBS?
Yes.  Linpac when built with ax25mailutils, has the ability to read, 
delete, and write messages for a remote "home" BBS for offline reading. 
  Once instructed, Linpac will log into that remote BBS and 
sendout/read-in/delete this newest batch of messages.  You can read up a 
bit about this here (Section 8.3) but the docs are a bit thin and the 
:mail interface is pretty simplistic today:

http://sourceforge.net/p/linpac/linpac/ci/master/tree/doc/manual.html?format=raw

There are also some known bugs too that I need to address as well.

    http://sourceforge.net/p/linpac/linpac/ci/master/tree/linpac-todo.txt

If you or anyone else would be willing to help out with any of these 
prioritized bugs, enhancement requests, etc, that would be greatly 
appreciated!



Now to your final point, could Linpac do this communication to the 
remote FBB BBS over an axip / axudp link?  Yes, per the above URL, 
Linpac fundamentally uses Linux's AX.25 stack.  As such, if you have a 
working AXIP/AXUDP link configured and defined in /etc/ax25/axports, 
Linpac should be able to leverage it.

--David
KI6ZHD
