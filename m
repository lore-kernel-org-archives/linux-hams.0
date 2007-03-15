From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 10:05:59 -0400
Message-ID: <620c90570703150705u2354b643l4a8dbcce8de29c36@mail.gmail.com>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
	 <45F8566D.10206@wa7v.com>
	 <dd22fa9c0703141323g3e5568dekba6c57a5586d4f6e@mail.gmail.com>
	 <1173962835.1770.27.camel@CO>
	 <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=Y0EyEij7qobeN2dRnbM4kLY/XuMeS66gkav3peqcMmghq+6aedkMdusDcgx1hxdHNyxpgxmWEM84FeUdkoKpGGD772erQmnKvmxKqH+/Oc8+qPfNv1WbF0wUW6ULSyxZWHeRVWA3QnTuzAVqMl2ziFrQmGPBrzAfDvE3bSTXqYM=
In-Reply-To: <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stephen Brown Jr <stephen.brown75@gmail.com>
Cc: linux-hams@vger.kernel.org

On 3/15/07, Stephen Brown Jr <stephen.brown75@gmail.com> wrote:
> How would I get more than one app to talk to a single tty, ttyS4 in my
> case, this is the port the TNC is connected to. This is the part of
> the puzzle I seem to be missing......
>
I believe that this is the function of ax25d, you would use ax25d.conf to
set up the different apps that are talking to that port.

Here is a sample ax25d.conf file:




# /etc/ax25/ax25d.conf
#
<netrom>
parameters 1   10 * * * * *
NOCALL     * * * * * * L
default    * * * * * * *    root /usr/local/sbin/fpacnode fpacnode -q %S
#
#
#[djt14 via sp0 ]
#parameters 1   10 * * * * *
#NOCALL     * * * * * * *
#default    * * * * * * *    root /usr/sbin/fpacnode fpacnode
#

# StartRose
#{kp4djt-9 via rose}
#default    * * * * * * *       root /usr/sbin/node node 6pac0
# Endrose
#
# Start6pac8
[kp4djt-15 via 8 ]
NOCALL     * * * * * *  L
default    * * * * * *  -   root /usr/sbin/axspawn axspawn -w %u
# End6pac8
#
# Start6pac0
[kp4djt-0 via 0 ]
NOCALL     * * * * * *  L
default    * * * * * *  -   root /usr/sbin/axspawn axspawn -w %u
# Endkiss0
#
# Start axip
[kp4djt-12 via 9 ]
NOCALL     * * * * * *  L
default    * * * * * *  -    root /usr/sbin/axspawn axspawn -w %u
# End axip
#
# KP4DJT-5 TelPac
#
[KP4DJT-10 via 9 ]
NOCALL     * * * * * * L
default    * * * * * * -  root /usr/sbin/telpac_node telpac_node -q %S
# End TelPac Node
#
(END)

You really need to read the ax25 how-to, this part of it has not changed
that much.

In my case I am running a FPAC switch and FPAC does most of this so the
ax25d is not used, we multiplex several services on a single TNC, the switch,
the TelPac app, others have BBS on a port, each one has a different call or
alias for access, but all are on the same port/tty.

-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
