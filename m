From: Chuck Hast <wchast@gmail.com>
Subject: Re: Listen root only
Date: Fri, 15 Jul 2005 20:40:28 -0600
Message-ID: <620c905705071519402f95a000@mail.gmail.com>
References: <620c9057050715180279131307@mail.gmail.com>
	 <20050716021652.GA4343@cloud.net.au>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050716021652.GA4343@cloud.net.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

On 7/15/05, Hamish Moffatt <hamish@cloud.net.au> wrote:
> On Fri, Jul 15, 2005 at 09:02:41PM -0400, Chuck Hast wrote:
> > Folks,
> > I am trying to get listen to be viewable by other users than root. I have
> > checked the permissions on listen and all appears OK, but when I
> > try to run it as a common user, I get a failure.
> 
> Define OK?
> 
> > Here is the error message:
> > kp4djt@fpac-dev:~$ listen
> > socket: Operation not permitted
> > kp4djt@fpac-dev:~$
> 
> listen needs to open a socket to receive all traffic (like packet
> sniffing on ethernet), which only root can do. So listen must be either
> run by root, or run as root using setuid.
> 
setuid took care of it.
Actually what I am trying to do is have it run as a shell, so that when I
log into listen I get the listen application. I have that working, but without
the arguments Now I have to figure out how to handle that so I can get
the color screen of the different frame types.

-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
