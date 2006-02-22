From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: LinuxNode
Date: Wed, 22 Feb 2006 18:49:21 +0200
Message-ID: <1140626961.8290.2.camel@oh2bns.ampr.org>
References: <001101c637cc$175e7440$1501a8c0@ik5zuk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001101c637cc$175e7440$1501a8c0@ik5zuk.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luigi - IK5ZUK <ik5zuk@tiscali.it>
Cc: linux-hams@vger.kernel.org

On Wed, 2006-02-22 at 17:21 +0100, Luigi - IK5ZUK wrote:

> I'm playing around LinuxNode (ver. 0.3.2) and when I connect the node by
> telnet, I see the following two error messages:
> 
> nrconfig: port netrom not active
> rsconfig: port rose not active

Assuming you don't want to use NET/ROM or Rose and just want to get
rid of the above (warning) messages, you need to go and edit the
files /etc/ax25/nrports and /etc/ax25/rsports and delete or
comment out the definitions of the ports mentioned in the message.
 
-- 
Tomi Manninen / OH2BNS / KP20JF74

