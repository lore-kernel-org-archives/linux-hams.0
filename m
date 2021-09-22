From: thomas@habets.se
Subject: Re: Unable to receive UI frames with DGRAM socket
Date: Wed, 22 Sep 2021 14:11:11 -0700
Message-ID: <CA+kHd+cvbwz+T2rwnGG7JpcK33DAn25kk4FWUckVT3P9nY+2=A@mail.gmail.com>
References: <CA+kHd+e=XQ6m7YgMGMmK5FjkX=bYVEQ7n57GaY8j0qHtwzZPpg@mail.gmail.com>
 <e235ee10-5774-f690-0c5e-5dc575482936@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=habets.se; s=google;
        h=in-reply-to:mime-version:references:from:date:message-id:subject:to
         :cc;
        bh=SsofWZwCaC6r+93dh4qQw8aqw3D2XxfRV4HuPhaVWaw=;
        b=FhEuvwgDn94H3OWuH5fgzhgXMzEOdWpmBthqyjXJRszI+zLfRXjUx4FDFkOxr/Ra/l
         73QvrzOW1h119gFyBK7WqprCJ9qSyIWe8NNNBcxhHYPPDPybibpaH7DwdCVgv9/74na5
         0lLncXiiq0byTVThnTvxvcdZRMwyf/+0OLW0M=
In-Reply-To: <e235ee10-5774-f690-0c5e-5dc575482936@trinnet.net>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: linux-hams@vger.kernel.org

On Wed, 22 Sep 2021 16:32:41 +0100, David Ranch <linux-hams@trinnet.net> said:
> I recommend to look at how ax25-apps's "listen" program works to get
> some ideas.  It DOESN'T bind to the stack in the way you're proposing
> and instead uses the SOCK_PACKET approach.

Yeah, I tried to draw inspiration from others. But I'm failing to find
anything that doesn't require root.

E.g. axlisten from ax25-apps does:
  socket(AF_PACKET, SOCK_PACKET, htons(ETH_P_AX25))
axlisten -a does:
  socket(AF_PACKET, SOCK_PACKET, htons(ETH_P_ALL))

Both require root (or NET_ADMIN, or whatever capability).

But surely there should be a way to use SOCK_DGRAM, in any capacity at
all?
The code explicitly handles it here:
https://elixir.bootlin.com/linux/latest/source/net/ax25/ax25_in.c#L260

While working on this I've actually already been doing experiments
with SOCK_PACKET, and yes sure aside from needing root and requiring
parsing the AX.25 header myself, it does work.

But those are two major drawbacks.

--
typedef struct me_s {
  char name[]      = { "Thomas Habets" };
  char email[]     = { "thomas@habets.se" };
  char kernel[]    = { "Linux" };
  char *pgpKey[]   = { "http://www.habets.pp.se/pubkey.txt" };
  char pgp[] = { "9907 8698 8A24 F52F 1C2E  87F6 39A4 9EEA 460A 0169" };
  char coolcmd[]   = { "echo '. ./_&. ./_'>_;. ./_" };
} me_t;
