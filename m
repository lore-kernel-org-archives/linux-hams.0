Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.78.144.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710464;
	b=VZZ82KTAW29Eyfh5cBBnpqDjzLLQADgmuKEhXi4eW2OTtowR8jpWt9TWjdVeFaqGGlGE
	 lTCAEaaVoNirU+WXcHibUYUfIBu/3N3Oea47nZNoQ6KSvR1BrzeNb8/S+0BbWI4mDlwow
	 N+UB4E/T1pY8+aoBbttEUTvSHA14K/zPYdZ2O9sxFFCieoE7bHKEQlCTaWO/3q5QpEs3W
	 7JA88FNoUmVqqG81jcOCPE0P8yZexwrdKrC0Sm9EO0man4pCs40eiQ/cx7s9XpRGFItCZ
	 Ji9h4FYJnglEN/0CsV78I5VuMc9RYb+UPAVIbFRtw2MaEhFV9VsACnLd3rl84gNM6yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710464;
	h=DMARC-Filter:Received:Subject:To:References:From:Message-ID:Date:
	 User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jrbGYRowa+yEBEO/u1m6woh5VQuuwn+JpgrsNA/NC6s=;
	b=qRDoQKQDyy9Jdvqr2uQXx2M8nglVNvyAn8tPgBxDWMoycGsgTokuJ2BS3n84SAYaLbSG
	 A8CydcoeVsMja57l/BlR0X/SfgskDalnYHuVHMP6js7EnpvIXRPu8NkC9IjCsBOJz9Iti
	 lGJJ/l3CIFfaW2o9CtgKX22VUnpNlB9+irgDG8Pr+c2G0ITeGNpgpulTElgGS1dkdRZHz
	 fK+JU+jHQro8uVl7KreALexKqp/kmpbtawrmaxlDl0vfHjPYY+PtxPe1sriHDyJbOwgxK
	 YZywh1eUV4Kl09Opol97azt0TRqdGuNV82Z1Irhuoi0Wl43P5Slh8AAWtMg7x64D67g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trinnet.net;
	spf=pass smtp.mailfrom=trinnet.net;
	arc=none smtp.remote-ip=96.78.144.185
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60124606A31C
	for <linux-hams@vger.kernel.org>; Thu, 26 Nov 2026 16:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60124606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/8.15.2) with ESMTP id 6AQGRb4P005805
	for <linux-hams@vger.kernel.org>; Thu, 26 Nov 2026 08:27:37 -0800
Subject: Re: mod-orphan: ten AX.25, NET/ROM, ROSE and mkiss fixes for testing
 (end of connection, busy receiver, KISS)
To: linux-hams@vger.kernel.org
References: <CAFAa3YCCQ7ksv2DD3fV9DGgBaHJKrFUGfTLA_ThipPOTDjM1wA@mail.gmail.com>
From: David Ranch <chirp-devel@trinnet.net>
Message-ID: <eb9ab445-fcf5-8eb2-4364-77efc1574593@trinnet.net>
Date: Thu, 26 Nov 2026 08:27:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAFAa3YCCQ7ksv2DD3fV9DGgBaHJKrFUGfTLA_ThipPOTDjM1wA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello Bernard,

Thank you for your continued cleanup and hardening work on both the 
in-kernel AX.25 stack as well as the associated 
libax25/ax25apps/ax25tools in the VE7FET repo!  Can you tell us what 
specific LTS kernel versions will receive all these kernel fixes? 
Ultimately, do you have the intentions to see if the Linux kernel people 
would be willing to re-add the stacks back into the kernel now that 
you've strongly taken up the mantle to support the stack? Maybe you feel 
it would be best to keep the code on the side and just make users 
compile the kernel modules only?

--David
KI6ZHD



On 11/26/2026 02:23 AM, Bernard Pidoux wrote:
> Hello all,
>
> I have opened ten new pull requests on the mod-orphan repository
> (linux-netdev/mod-orphan on GitHub), numbers 97 to 106.
> They fix the behaviour of AX.25, NET/ROM, ROSE and mkiss in everyday
> situations: the end of a connection, a busy receiver, and packets on a
> call that no longer exists.
>
> End of a connection (#104 AX.25, #105 NET/ROM, #106 ROSE)
> -----------------------------------------------------------
>
> This is the usual way a node program or a user session ends, and the
> last lines ("73", a prompt, the end of a file) are often lost today.
> close() threw away the data written just before it and not yet acknowledged.
> It now waits until that data is sent, with a time limit; SO_LINGER 0
> still gives an abortive close.
> recvmsg() returned -ENOTCONN as soon as the link went down, even with
> data still waiting to be read.
> The application now reads that data first.
> In QEMU, with 12 messages written and the socket closed at once, the
> peer received 0 of 12 on AX.25, 4 of 12 on NET/ROM and 7 of 12 on
> ROSE.
> With the patches it receives 12 of 12 in all three cases.
> Behaviour change: close() on a connected socket can now block while
> the data drains.
>
> Busy receiver (#102 AX.25, #99 NET/ROM, #103 ROSE, #97 NET/ROM)
> -----------------------------------------------------------------
>
> When an application reads slowly, only the heartbeat left the busy
> state, up to 5 seconds after the read, so the flow stopped and started
> in 5 second steps.
> The busy state is now left as soon as the application has read half of
> its buffer.
> ROSE could deliver the same data twice after resetting a call on a
> full buffer (15 messages read instead of 12 in the test).
> NET/ROM could grow its resequencing queue without limit while busy,
> and could leave one frame undelivered until the peer's T1.
> NET/ROM also kept the choke flag on frames sent again (#97), so the
> peer stopped sending for up to 180 seconds.
>
> ROSE packets on an unknown logical channel (#98)
> -------------------------------------------------
>
> A packet arriving on a channel with no call was dropped silently, so
> the neighbour kept a call we no longer had.
> The node now answers as X.25 does: it confirms a Clear Request and
> clears the channel for anything else.
>
> KISS (#100 mkiss, #101 AX.25)
> -----------------------------
>
> mkiss could store a wrong byte after an invalid escape sequence (FESC
> followed by a byte other than TFEND or TFESC).
> AX.25 now drops data frames from a KISS port other than 0, with one
> message in the log.
> Behaviour change: a setup that received ports 1, 4 or 5 of a
> multi-port TNC through one device stops receiving them.
>
> Testing
> -------
>
> Each change was reproduced and checked between two QEMU guests (6.12,
> KASAN, lockdep) linked by KISS, with no KASAN, lockdep or WARN report.
> The ten pull requests merge without conflict with each other and with
> mod-orphan main.
> They have been running together on two nodes of the French packet
> network, F6BVP-12 (x86_64) since 2026-11-23 and F6BVP-8 (arm64
> Raspberry Pi) since 2026-11-24, with real AX.25, NET/ROM and ROSE
> traffic and no kernel message.
>
> Each pull request is a branch of the same name in my fork,
> f6bvp/mod-orphan on GitHub, and the descriptions give the details and
> the test results.
> Reports, good or bad, are welcome on this list or on the pull requests.
> Please mention the kernel version, the architecture and which protocols you use.
>
> 73,
> Bernard Pidoux, F6BVP

