From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Listen root only
Date: Sat, 16 Jul 2005 12:16:52 +1000
Message-ID: <20050716021652.GA4343@cloud.net.au>
References: <620c9057050715180279131307@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <620c9057050715180279131307@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

On Fri, Jul 15, 2005 at 09:02:41PM -0400, Chuck Hast wrote:
> Folks,
> I am trying to get listen to be viewable by other users than root. I have
> checked the permissions on listen and all appears OK, but when I
> try to run it as a common user, I get a failure.

Define OK?

> Here is the error message:
> kp4djt@fpac-dev:~$ listen
> socket: Operation not permitted
> kp4djt@fpac-dev:~$

listen needs to open a socket to receive all traffic (like packet
sniffing on ethernet), which only root can do. So listen must be either
run by root, or run as root using setuid.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
