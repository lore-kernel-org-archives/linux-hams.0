From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Netrom:  Quality issue
Date: Sun, 07 Jul 2013 09:59:47 -0700
Message-ID: <51D99E83.9000604@trinnet.net>
References: <51D79AE6.5030208@junglevision.com> <51D7A082.1000500@junglevision.com> <51D7AC41.6060606@junglevision.com> <51D7AE2B.3070408@junglevision.com> <51D852B6.3060401@trinnet.net> <20130706202807.GB18314@x-berg.in-berlin.de> <51D905C2.1000301@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <51D905C2.1000301@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cathryn Mataga <cathryn@junglevision.com>
Cc: Thomas Osterried <thomas@x-berg.in-berlin.de>, linux-hams <linux-hams@vger.kernel.org>


I agree with Cathryn that this is a "as designed" issue though I'd argue 
we should CHANGE it.  Specifically, the Linux netromd man page says 
"RECEIVED from a routing broadcast" where as

Kantronics KPC3+ - 
http://www.kantronics.com/documents/kpc-3plus_manual_RevD.pdf
"
Page 137
. . .
When K-Net hears neighbor node (A) transmit a node broadcast, it
computes the quality to distant nodes (B, C, D, etc.) contained in that 
broadcast
by using the quality that is assigned to neighbor node (A). If the 
***resultant
computation*** is less than MINQUAL, the distant nodes (B, C, D, etc.) 
are not
added to the nodes table (see QUALITY command).
--


I also looked around for finding the default for the X1J TNC but 
couldn't find a clear citable URL but I believe the default there is 140.

--David




> Err, I don't think it's really a bug.  He's probably got a node coming 
> in at quality 120 and then it does (120 * 120 +128)/256 Maybe update 
> the man page to explain what's going on.
>
>               worstqual     this is the worst quality node received 
> from a routing broadcast that will be added
>                             to our routing table.
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

