From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: AX25 Problems!
Date: Thu, 10 Oct 2002 19:56:14 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021010195614.B1031@linux-mips.org>
References: <3DA5221B.25812BBE@kj6eo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3DA5221B.25812BBE@kj6eo.com>; from kj6eo@kj6eo.com on Wed, Oct 09, 2002 at 11:45:47PM -0700
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Walton <kj6eo@kj6eo.com>
Cc: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

On Wed, Oct 09, 2002 at 11:45:47PM -0700, Bill Walton wrote:

> Has anyone seen this error message in /var/log/messages:
> 
> Linux Kernel: netromd uses obsolete (PF_INET, SOCK_PACKET)
> 
> I am running RedHat 7.2 and a 2.4.19 kernel.

The netromd you're running seems to be a bit antique.  The use of
socket(PF_INET, SOCK_PACKET) has been deprecated long time ago; it should
be replaced with socket(PF_PACKET, SOCK_PACKET).

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
