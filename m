From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re: Setting kiss mode Kantronics kpc-9612+ on linux
Date: Wed, 07 Jul 2004 01:02:58 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40EB4BC2.16702.2E985C@localhost>
References: <20040705135714.44447.qmail@web41209.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <20040705135714.44447.qmail@web41209.mail.yahoo.com>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Wijaya <wijaya_mail@yahoo.com>


---
On 5 Jul 2004 at 6:57, Wijaya wrote:

> Hi there, I need advice and help, how to setting up kiss mode on linux use
> tnc from Kantronics (KPC-9612+). 
> I never setting up any tnc devices before. But I've succed to control this
> device via minicom to connect each others and send/receive simple message
> over it without problem.

In some Kantronics TNC you set kiss mode by issuing the 
following commands:

int kiss
reset

Or just int kiss, and then switch tnc off and on again.

