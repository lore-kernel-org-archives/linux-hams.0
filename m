From: Rodolfo Brasnarof <rodob@datafull.com>
Subject: Re: question soundmodem again...
Date: Fri, 18 Feb 2005 12:44:36 -0300
Message-ID: <20050218124436.5377e39d.rodob@datafull.com>
References: <20050218133810.89878.qmail@web51002.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
In-reply-to: <20050218133810.89878.qmail@web51002.mail.yahoo.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: ariel mastracchio <ari197516@yahoo.com>

On Fri, 18 Feb 2005 05:38:10 -0800 (PST)
ariel mastracchio wrote:

> Hi, 
> 
>   Someone know if is posible to have two soundcard
> working in the same computer?? one for example keying
> in lpt1 and the other in com1?

It is possible to have two soundcards working on
the same computer, and even more than two. I have two on my system, one
for audio applications, system sound, etc, and the other for packet
operation.

There are some limitations on which cards can be set to work together.
Alsa has good support for more than one card.

You mean having one card with soundmodem for packet operation, and the
other for using with gmfsk for example? It should be possible.
