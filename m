From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Mon, 7 Mar 2011 23:01:29 -0800 (PST)
Message-ID: <alpine.LNX.2.00.1103072301120.13405@wapiti.we7u.net>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au> <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net> <4D74B845.4040600@bfs.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=nT9nyvkKQKkGxUZpHlnaHx0hRNdg/WbdvH4ZioWdyZ8=;
        b=DhnrE2dBBYvId4zLX/JIrtYQll2cvu0ytA+SXOBWr6gp0a0rtRWzB0l/tkS91wp4Vu
         ny2XfyI3Tui64wLFfDuitsZaCaUOmby37NhTnAHbeIdiLpWhNe4s3CWr1C4rfTLJIMhy
         OUUNi22fzdAF0uDI5R6sTCRFzPKr4usTEsUq0=
In-Reply-To: <4D74B845.4040600@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: "Curt, WE7U" <curt.we7u@gmail.com>, linux-hams@vger.kernel.org

On Mon, 7 Mar 2011, walter harms wrote:

> can you try to switch  /bin/setserial & /sbin/modprobe  ?
> maybe some ttyS driver allocates /dev/ttyS5.

Worth a shot.  Same results.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
Babysitting your tracker:  http://info.aprs.net/index.php?title=ControlOperator
