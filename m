From: Wijaya <wijaya_mail@yahoo.com>
Subject: Re: Setting kiss mode Kantronics kpc-9612+ on linux
Date: Wed, 7 Jul 2004 05:40:21 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040707124021.98212.qmail@web41201.mail.yahoo.com>
References: <40EB4BC2.16702.2E985C@localhost>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40EB4BC2.16702.2E985C@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I was do it before as follow manual book.
But, what I need, how to make Linux connect this kiss mode with another
point. Both point is my network, so I have no one working for looking an
example.

Wijaya

--- Rodolfo Brasnarof <rodob@ciudad.com.ar> wrote:
> 
> ---
> On 5 Jul 2004 at 6:57, Wijaya wrote:
> 
> > Hi there, I need advice and help, how to setting up kiss mode on linux
> use
> > tnc from Kantronics (KPC-9612+). 
> > I never setting up any tnc devices before. But I've succed to control
> this
> > device via minicom to connect each others and send/receive simple
> message
> > over it without problem.
> 
> In some Kantronics TNC you set kiss mode by issuing the 
> following commands:
> 
> int kiss
> reset
> 
> Or just int kiss, and then switch tnc off and on again.
> 
> 



	
		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail 
