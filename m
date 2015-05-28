From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Linpac 0.21 (AX.25 packet radio application) posted
Date: Wed, 27 May 2015 21:50:12 -0700
Message-ID: <55669E84.2020500@trinnet.net>
References: <5563611F.5020204@trinnet.net> <5565EC9D.6060604@uns.ac.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5565EC9D.6060604@uns.ac.rs>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Miroslav Skoric <skoric@uns.ac.rs>, Linux Hams <linux-hams@vger.kernel.org>


Hello Misko,


> It makes me wonder if LinPac has (or maybe will have) a feature that
> allows it running as a 'client' application in the same box where a
> packet server (such as xfbbd) is already running 'on top' of the AX.25
> stack.

Yes, this is how it works today.  Both LinPac and FBB are just 
applications that interface with the Linux AX.25 stack.  Just like 
Firefox and Thunderbird are applications that use TCP/IP.


> For example, if I recall properly, there was a WinPac end-user software
> for Win$$$ that was able to use WinBPQ (BPQ32) as an intermediate level
> for accessing WinFBB running in the same box. If I am not wrong, BPQ32
> allowed more than one application to run on it in parallel,

I don't know BPQ very well but as I understand it, the BPQ application 
implements it's own AX.25 stack.  Other applications can interface with 
with BPQ using TCP connections but you can also configure it's AX.25 
stack to communicate to Linux's AX.25 stack.  There are other mechanisms 
in there too I think.


> In fact, what I want to do is to mimic real client-to-server
> communication as if a real packet network is present. Any idea?

Well, I'm still not quiet following you here but it's worth mentioning 
that the Linpac 1.x proto code is designed to be a client/server design. 
  It's server communicates to the Linux AX.25 stack and can fully 
operate with remote users.  For local users, the Linpac clients (Ncurses 
or Java) connects to the Linpac backend via a TCP connection.  This code 
isn't completely functional at the moment.

Alternatively, I personally run the current Linpac application in a 
Screen session.  When I'm remote but want to control a packet 
connection, etc, I SSH into my system and remotely take over the Screen 
session.  When I'm done, I just detach it.

--David
KI6ZHD
