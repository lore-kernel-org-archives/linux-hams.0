From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: netstat with rose support?
Date: Fri, 14 Jul 2006 07:01:27 -0400
Message-ID: <620c90570607140401i7ec25270nacd77ce3904ca16e@mail.gmail.com>
References: <620c90570607112014j5857afecs2e4a69eb4b1bc2e7@mail.gmail.com>
	 <20060712231643.GA16205@linux-mips.org>
	 <620c90570607130408w44cc5d59n508ab8268db24021@mail.gmail.com>
	 <20060713112041.GA20294@linux-mips.org>
	 <20060713122824.GA4729@lina.inka.de>
	 <20060713133633.GA23187@linux-mips.org>
	 <620c90570607131623w459e65d4i47041509c9496249@mail.gmail.com>
	 <20060714032426.GA11804@lina.inka.de>
	 <620c90570607132032i5e144fe4nad370f67c9d101a0@mail.gmail.com>
	 <20060714042733.GA13746@lina.inka.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060714042733.GA13746@lina.inka.de>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bernd Eckenfels <be-mail2006@lina.inka.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-hams <linux-hams@vger.kernel.org>

On 7/14/06, Bernd Eckenfels <be-mail2006@lina.inka.de> wrote:
> On Thu, Jul 13, 2006 at 11:32:17PM -0400, Chuck Hast wrote:
> > Yes I see that too on mine but when I do a netstat --rose I get the short
> > help
> > page (i.e. that was wrong try again) but if I do say a netstat --netrom I
> > get:
>
> I think AF ROSE protocol support was never finished. It works for ifconfig,
> but not more.
>

I found this last night while digging through history:

http://he.fi/archive/linux-hams/199703/0201.html

It looks like there was support at one time, it either did not get
left in there or
was never really put in.

I am not sure where to try to put this in or I would try to do it, this is a bit
above me.


-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
