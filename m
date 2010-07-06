From: John Ronan <jpronans@gmail.com>
Subject: Re: unix98 ptys
Date: Tue, 6 Jul 2010 08:41:36 +0100
Message-ID: <C8D466FE-708F-49DE-8C5A-5B143DC078AA@gmail.com>
References: <4C324469.4090500@gmail.com> <20100705232749.GY7246@x-berg.in-berlin.de>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:content-type:mime-version
         :subject:from:in-reply-to:date:content-transfer-encoding:message-id
         :references:to:x-mailer;
        bh=f/hxvVF2sBDG08VWYKHH5X4ua4Tlr/TWcBOpFQ4FVeE=;
        b=UM4Pc1sHgfWqa8DNjXRTRrFDF0goyO4dRP+SeBrLDGeWlV/BGxvBnXVdzZHtiw7LsZ
         VDSgNZxXH+S6FRbaRMey9WlrpU4912SwGHuUvPRmTWUk0/pv9t0O1cmr3ZGPfx+6fXj2
         gWqb4bi0tlJSr1wpzNB5K6glnogOB67dB6IFs=
In-Reply-To: <20100705232749.GY7246@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>


On 6 Jul 2010, at 00:27, Thomas Osterried wrote:

> Hello John,
> 
> On 2010-07-05 21:45:29 +0100, John Ronan <jpronans@gmail.com>
> wrote in <4C324469.4090500@gmail.com>:
>> Hi,
>> 
>> I just had a go at getting ax25 mkiss working on ubuntu 10.04.
>> I came across this message and was wondered if there is a similiar  
>> mechanism to /dev/ptmx for the receive side.
>> 
>> http://www.mail-archive.com/linux-hams@vger.kernel.org/msg00103.html
>> 
>> At the moment I'm using kissattach /dev/pts/5 1200mk 44.155.6.12
>> etc to attach to it.  I've never used Unix98 ptys before so any  
>> assistance appreciated
> 
> Please read http://lists.debian.org/debian-hams/2010/06/msg00022.html
Hi Thomas,

Thanks for the reply.  Ok I have it working now. However the link I quoted above indicated that kissattach finds the relevant slave pts/? devices automatically, but kissattach (from ax25-tools-0.0.10-rc2) does not.  A quick diff shows some code in  Bernards version seems to iterate through the ptys.  

Should I be using Bernards code from 2005?  Or should I just update the linux-ax25 wiki to so that anyone else  searching for the information can find it.

Regards 
de John
EI7IG