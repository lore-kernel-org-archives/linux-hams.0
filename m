From: Jorge Matias <martin@andorinha.ist.utl.pt>
Subject: Re: Protocol error
Date: Mon, 18 Nov 2002 00:40:51 +0000 (WET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0211180032490.25179-100000@andorinha.ist.utl.pt>
References: <3DD7E005.25470.636F19D@localhost>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3DD7E005.25470.636F19D@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Demetre Valaris <sv1uy@bbs.sv1uy.ampr.org>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Sun, 17 Nov 2002, Demetre Valaris wrote:

  Hi Demetre,

  I have the same problem for a loooong time. I also have lots af messages
like this one in my /var/log/messages:

Nov 18 00:34:36 hamradio kernel: NET: 8 messages suppressed.

  These messages arrive with a pace of 1 message every +-4 secs.
  I suppose that the fact that I have all the traffic passing trough
linuxnet makes this messages lots of times. (about one error for each
frame received/sent).

73,
Jorge Matias
CT2HBZ

> Hi guys,
>
> Ever since I started using AX25 tools I seem to be getting the foolowing error
> message from the kernel in /var/log/messages.
>
> Nov 17 18:15:21 nest-0 kernel: protocol 0000 is buggy, dev ax0
>
> This message keep repeating quite often.
>
> Now this is probably a warning and it does not seem to cause any problems to
> my AX25 operation. Has anyone seen this messsage in his setup and what does it
> mean please?
>
> I use SUSE 7.3 with 2.4.10-GB kernel and I use the distribution AX25 tools.
> On port ax0 I do not use TCP/IP, just AX25 because it is the ax port for my
> APRSD. The funny thing is that I do not get any reports on interface ax1 where
> I use TCP/IP and it has a pk6 link to AMPRnet. I also have to tell you that I
> have assigned an IP address to port ax0 as well, but I do not use any IP on
> ax0.
>
> Any ideas would be much appreciated.
>
> 73 de Demetre SV1UY
> e-mail sv1uy@sv1uy.ampr.org
> http://www.athnet.ampr.org/~sv1uy
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 

