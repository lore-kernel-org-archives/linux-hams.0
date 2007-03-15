From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 10:34:21 -0400
Message-ID: <620c90570703150734r5214a450te432514627d8c86d@mail.gmail.com>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
	 <45F8566D.10206@wa7v.com>
	 <dd22fa9c0703141323g3e5568dekba6c57a5586d4f6e@mail.gmail.com>
	 <1173962835.1770.27.camel@CO>
	 <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
	 <620c90570703150705u2354b643l4a8dbcce8de29c36@mail.gmail.com>
	 <dd22fa9c0703150716p65d09347rf05687f272a13592@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=bJtOCB5vfAt3tozHBg3lEaYISWf16Hq2sHQdSlPlndx3ZUm250VUnCSNAjd5csxat53v28IrNFGSKCzr6FzkCHZQJ6Tu9Xw6hCmYEHKbLk8GWwYEnkc0lWlmZX8HYg7ENBgaDiRFMktnD8EUz/Uqinjhsyji0Khsmf70sch9X5g=
In-Reply-To: <dd22fa9c0703150716p65d09347rf05687f272a13592@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stephen Brown Jr <stephen.brown75@gmail.com>
Cc: linux-hams@vger.kernel.org

On 3/15/07, Stephen Brown Jr <stephen.brown75@gmail.com> wrote:
> Ok, that will work good for regular connected mode packet, how would I
> set it up for APRS? I have two apps, both of which will run in the
> background and a third app(xastir) connected via an AXIP link from
> another box.
>
> I'm getting closer........
I was looking at Xastir docs and it appears that it will work with the ax25
stack. But first thing you want to do is make sure that you have the stack
up and running, once you think it is working try to make a call out that port
or use Listen to monitor the port and send some ax25 data to the TNC, if
Listen shows it then the port is receiving, same thing, if you can use call
and establish a connection with a remote system, then your ax25 stack is
working, that done you can then proceed to the integration of Xastir to the
system. I have not done that so you will need to talk to some of the Xastir
people.



-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
