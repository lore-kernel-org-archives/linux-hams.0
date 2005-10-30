From: Ray Wells <mvc@midcoast.com.au>
Subject: Re: 6pack query
Date: Mon, 31 Oct 2005 06:54:35 +1100
Message-ID: <436524FB.1040203@midcoast.com.au>
References: <43643575.1010407@midcoast.com.au> <620c90570510300437w7c9b9a8cp5a9bcc738120d638@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570510300437w7c9b9a8cp5a9bcc738120d638@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chuck Hast <wchast@gmail.com>
Cc: linux-hams@vger.kernel.org


Chuck Hast wrote:

>On 10/29/05, Ray Wells <mvc@midcoast.com.au> wrote:
>  
>
>>Hello learned members of the list,
>>
>>I'm contemplating changing my KISS only EPROMs for 6PACK (to perhaps
>>improve matters on my 0k3 HF ports)
>>
>>The kernel (2.2.20) has been compiled to include 6PACK - compiled in,
>>not as a module.
>>
>>Given that there is no equivalent of kissparms for 6PACK, how does one
>>set parameters such as txd, slottime, etc?
>>
>>In my mind, given that spattach is symbolically linked to kissattach,
>>the parameters are set with kissparms in the same way as they are with
>>KISS TNCs.
>>
>>Am I correct in my thinking, or way off target?
>>    
>>
>
>Ray,
>I am running it and that appears to be the way it works. I have set up my
>kissparms and when i change them I can see the changes in the way the
>TNC operates.
>
>
>--
>Chuck Hast
>To paraphrase my flight instructor;
>"the only dumb question is the one you DID NOT ask resulting in my going
>out and having to identify your bits and pieces in the midst of torn
>and twisted metal."
>
>
>  
>
Thanks Chuck,

I appear to have guessed that part correctly. However, I may have bombed 
out in believing that spattach was "ready to go".

Upon close inspection of kissattach.c I find that a change as per 
/.../6pack.txt hasn't been implemented.

So, for my next question, if I make the change and recompile kissattach, 
and rename it spattach, can I still use the original kissattach for KISS 
applications?

Ray
