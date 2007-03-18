From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: Document request - ROSE protocol specification
Date: Sun, 18 Mar 2007 11:07:04 -0400
Message-ID: <620c90570703180807r587aab45g60268305089e9529@mail.gmail.com>
References: <45F87682.8010206@rns-stearn.demon.co.uk>
	 <620c90570703141711v444bd67dqd9cf8e86a6fc1b54@mail.gmail.com>
	 <45F92C62.2030707@ccr.jussieu.fr>
	 <620c90570703150642q76cfb326scdca89934a9593a1@mail.gmail.com>
	 <45FD1873.403@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=lMlMNpTwPMqWIF0aoo2YXewas+0nU+Tbbb9DTO9QzD+Z6TzLIjPM3xMitnIullRPH6IUe/oYpqqrQVwVXsW5C33jWfINukMbEFCxuRWjWUclxFt4s7fU0WB+q564TJYZNaaZ8VZU4P6KU/Zn7Erb0cSfxDe98hjkouVuC9mcpso=
In-Reply-To: <45FD1873.403@ccr.jussieu.fr>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: Richard Stearn <richard@rns-stearn.demon.co.uk>, linux-hams@vger.kernel.org

On 3/18/07, Bernard Pidoux <pidoux@ccr.jussieu.fr> wrote:
>
>
> Chuck Hast wrote:
>
> >...What listen does
> > not show is the GFI, it does show the LCI and in the call request packet
> > the
> > random number  (NbAlea) which is used to assign the LCI. Nor does it show
> > the cause/diag code data when there is a error or a disconnect.
> >
> > So any work you do in this direction will be a big help for us.
> >
> >
>
> Actually, listen provides some error diagnostic including the point
> where the link failed as shown here :
>
> 0: fm KP4DJT-9 to F6BVP-11 ctl I72^ pid=1(X.25) len 26
> X.25: LCI 031 : CLEAR REQUEST - Cause DTE Originated - Diag 0
> at N3PPC-9 @3100,386335
> 0: fm KP4DJT-9 to F6BVP-11 ctl RR0v
>
> Not so bad.

Yes, that is how I knew that we were getting the error location information,
I was watching it in Listen and observed that on the fpac console it did
not match.  But being able to have a full set of tools in WireShark (was
Etherreal) for data collection and analysis would be a very good thing,
so I encourage him to get as much info as possible to integrate X.25 PLP
so we have one more tool to use.


-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
