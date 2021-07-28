From: "Alejandro Colomar (man-pages)" <alx.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] packet.7: Describe SOCK_PACKET netif name length issues
 and workarounds.
Date: Wed, 28 Jul 2021 22:52:15 +0200
Message-ID: <a050e248-af45-0678-b25c-27e249fb5565@gmail.com>
References: <YP/Jcc4AFIcvgXls@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PUAw6z5Mv2Gc2MTPDaFS8HQXeD9s7MU+i2BPK1JVR3k=;
        b=ERum8YtVoz22rlJfSAMNFjru7xCCFlIncst5ebw/3Vx1lWzxJFdMcestrTlYY5SRjY
         rVwimvYmeUZnAplwOnCEglFuXMya/6TZo8szaiTVj7T6MeaGE6Jlw62KInGdKAi2DN3K
         ZK7EKOu27l5XFz/FrjbgxZMAu2cUzPmH7xqaw6mz8AZKPK+v6CGf0uqXVY+RcBCZ61j0
         6o/3/7YL4PtRXJ5lyOd9mCy4iacjnIQe+cqyIDpo6/m5AUr17ubXq+XMgf3ItKEq2swT
         ylIafEEmaYs/8hevwWCNUsMimSkbDPUoWNf+r7LKYD37o7Ze1XC+NNPXabRuA2VTTlZP
         tyuw==
In-Reply-To: <YP/Jcc4AFIcvgXls-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hams-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Osterried <thomas-SbBNwotClTQPyMaTEpOvjQ@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello Ralf,

On 7/27/21 10:53 AM, Ralf Baechle wrote:
> Describe the issues with SOCK_PACKET possibly truncating network interface
> names in results, solutions and possible workarounds.
> 
> While the issue is know for a long time it appears to have never been
> documented properly and is has started to bite software antiques badly since
> the introduction of Predictable Network Interface Names.  So let's document
> it.
> 
> Signed-off-by: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>

Thanks for the patch!
Please see a few comments below.

Thanks,

Alex

> ---
>   man7/packet.7 | 31 ++++++++++++++++++++++++++++++-
>   1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/man7/packet.7 b/man7/packet.7
> index 706efbb54..7697bbdeb 100644
> --- a/man7/packet.7
> +++ b/man7/packet.7
> @@ -627,6 +627,34 @@ extension is an ugly hack and should be replaced by a control message.
>   There is currently no way to get the original destination address of
>   packets via
>   .BR SOCK_DGRAM .

Since the bug spreads across multiple paragraphs, maybe consider adding 
a subsection of BUGS to keep it organized?

> +.PP
> +The
> +.I spkt_device
> +field of
> +.I sockaddr_pkt
> +has a size of 14 bytes which is less than the constant
> +.B IFNAMSIZ
> +defined in
> +.I <net/if.h>
> +which is 16 bytes and describes the system limit for a network interface


See the following extract from man-pages(7):

$ man 7 man-pages | sed -n '/Use semantic newlines/,/^$/p';
    Use semantic newlines
        In the source of a manual page,  new  sentences  should  be
        started  on new lines, and long sentences should split into
        lines at clause breaks (commas, semicolons, colons, and  so
        on).   This  convention,  sometimes known as "semantic new‐
        lines", makes it easier to see the effect of patches, which
        often  operate at the level of individual sentences or sen‐
        tence clauses.


> +name.  This means the names of network devices longer than 14 bytes will be
> +truncated to fit into
> +.I spkt_device .
> +All these lengths include the terminating null byte (\(aq\e0\(aq)).
> +.PP
> +Issues from this with old code typically show up with very long interface
> +names used by the
> +.B Predictable Network Interface Names
> +feature enabled by default in many modern Linux distributions.
> +.PP
> +The preferred solution is to rewrite code to avoid
> +.BR SOCK_PACKET .
> +Possible user solutions are to disable
> +.B Predictable Network Interface Names
> +or to rename the interface to a name of at most 13 bytes, for example using
> +the
> +.BR IP (8)

You probably meant s/IP/ip/

> +tool.
>   .\" .SH CREDITS
>   .\" This man page was written by Andi Kleen with help from Matthew Wilcox.
>   .\" AF_PACKET in Linux 2.2 was implemented
> @@ -637,7 +665,8 @@ packets via
>   .BR capabilities (7),
>   .BR ip (7),
>   .BR raw (7),
> -.BR socket (7)
> +.BR socket (7),
> +.BR ip (8),
>   .PP
>   RFC\ 894 for the standard IP Ethernet encapsulation.
>   RFC\ 1700 for the IEEE 802.3 IP encapsulation.
> 


-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
