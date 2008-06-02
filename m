From: "Robin Gilks" <g8ecj@gilks.org>
Subject: Re: BUGs into libax25
Date: Mon, 2 Jun 2008 18:49:35 +1200 (NZST)
Message-ID: <42208.192.168.1.15.1212389375.squirrel@gilks.ath.cx>
References: <4843220B.20703@upmc.fr> <4843579E.8030003@w1nr.net>
Reply-To: g8ecj@gilks.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4843579E.8030003@w1nr.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>


> As I recall, there is a limit to the size of a callsign in the AX.25
> protocol specification.  Will changing it create an incompatibility with
> standard TNC protocol stacks?
>
> Mike, W1NR
>

Copy to mailing list....

As I recall (from doing several AX25 implementations), the limit is 6
characters, at least one of which MUST be numeric. This would make 6
letters unsupported by the AX25 specification but not necessarily in
practice (but some TNCs etc may reject a connection).


-- 
Robin Gilks zl3rob/g8ecj



