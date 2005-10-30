From: Chuck Hast <wchast@gmail.com>
Subject: Re: 6pack query
Date: Sun, 30 Oct 2005 08:37:30 -0400
Message-ID: <620c90570510300437w7c9b9a8cp5a9bcc738120d638@mail.gmail.com>
References: <43643575.1010407@midcoast.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43643575.1010407@midcoast.com.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ray Wells <mvc@midcoast.com.au>
Cc: linux-hams@vger.kernel.org

On 10/29/05, Ray Wells <mvc@midcoast.com.au> wrote:
> Hello learned members of the list,
>
> I'm contemplating changing my KISS only EPROMs for 6PACK (to perhaps
> improve matters on my 0k3 HF ports)
>
> The kernel (2.2.20) has been compiled to include 6PACK - compiled in,
> not as a module.
>
> Given that there is no equivalent of kissparms for 6PACK, how does one
> set parameters such as txd, slottime, etc?
>
> In my mind, given that spattach is symbolically linked to kissattach,
> the parameters are set with kissparms in the same way as they are with
> KISS TNCs.
>
> Am I correct in my thinking, or way off target?

Ray,
I am running it and that appears to be the way it works. I have set up my
kissparms and when i change them I can see the changes in the way the
TNC operates.


--
Chuck Hast
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
