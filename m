From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: 2.6.14-r4 crashing
Date: Sat, 22 Oct 2005 13:46:42 +0100
Message-ID: <20051022124642.GA3951@linux-mips.org>
References: <61062.192.168.1.2.1129943887.squirrel@192.168.1.12>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <61062.192.168.1.2.1129943887.squirrel@192.168.1.12>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aa6qn@aa6qn.sytes.net
Cc: linux-hams@vger.kernel.org

On Fri, Oct 21, 2005 at 06:18:07PM -0700, aa6qn@aa6qn.sytes.net wrote:

> I could use some guidence here to stabelize the system. It crashes
> serveral times a day and it looks like a IRQ syncing problem. This only
> happens when I load ax25 and its associated modules. I am not sure if I
> missed something in the kernel configuration so I am grasping at straws at
> the moment.

Care to add any details?  "Looks like" isn't a useful bugreport, sorry ...
AX.25 doesn't run any code in interrupts btw. - except maybe a bunch of
the more esotheric devices, so I'm interested in your setup.

  Ralf
