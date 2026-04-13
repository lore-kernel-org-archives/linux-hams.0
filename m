Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A8126FD93
	for <linux-hams@vger.kernel.org>; Mon, 13 Apr 2026 23:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776123158; cv=pass; b=ISyymj2Rus1T4qp7OP0wgDvoZ25xxAN1yV/WK8NCrXfTjqmNoNaeRU27hu1R6/83mHlqAxX6bHqKzeYGprGMkNcy6AJ+qSNlW+SPUX6LL1fr18ReNlTE9DoCHS/4abGs0k7L2pG84THT8tnuuCb75Ji+VYjUctLMiWgpI0srhGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776123158; c=relaxed/simple;
	bh=0yvgaTEVupxWHQYaQtmOmOt/hFCdCOcwgVMDY/9Wyu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obTkEljxhZU7mjn4KJpaW8coA+s7CRBLhPSSnvtBeuAJMuXxQKp8NnoxV0cutRYCsdKMM0qIDm7hDT7IfnTb+VxyuUYfRpB+3+P832XuXOXwJ4vYCLv/FHSVDP4HwIgqiNGhW237vPnn/xDOwaAnyZXSxjl/QyoL1yoIja0mLVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7tHtUmz; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7tHtUmz"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-651d692e833so1067035d50.3
        for <linux-hams@vger.kernel.org>; Mon, 13 Apr 2026 16:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776123155; cv=none;
        d=google.com; s=arc-20240605;
        b=IKqGvxl5MiGEn6JWpox323qgQLLPBnxPMHLxBHoWL6sptu4MVdAyw80YUDC5gR+O6R
         hwwC9hpFhVKnrFRvWWHqaoQf4y/kBBrOX99lqFHw85h/oDURiL7+Dr1bUbvd/fEpbtTF
         6i/GndLhHZ6D0lLRclATbiyZT1+0G00nLIuQbMlTeNjRTCjYpY2fpEH6SsRR6gSvnjkH
         neVaSmojkTS1HaLs9i51Wfs2qNDAn3Gt2jlkvvu+2pXOVeqpNxxmbNuzwux6ESW5JaKu
         4kxR1g8Ndtd1Ze749n53ZyG53VEbcCG3LO2YjgF10aD6LJjn+76P512cNZ3EXtk4zV8B
         aWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAEZlqbm0dqDAiyd30/0GnEftLygtQElVS2V5SlFAak=;
        fh=gNXqZY/hZrJHEvYlYoIa+RcYMvztuPN54xJbHfQRSj8=;
        b=M+LmCWZh36uXuCo32IviGN2TVsFrFshYxvGE29WXQ/zusvRqI09u6cSLthPGtdLaxz
         XQzK1jl7fIjXBsyIQULn/EDJPRfB24PVvnlM23d/F7g4bQHQVPltYfEGsITqNmsbXwkF
         oNqVknhWVGBRf4CacJLgEIpkSzOqCVRfrL/KO1EqASWBMtYC1HkRrr557FcFx+aBS+O0
         hUxMSWQ2q6Bg7nvcZ4b5aWeFJLDaGPmDtQFgU6OdaPBNlFc9OVAU3b4DGGXyO8BpC/Cm
         6WR3adgmo1UvQ0Hb/J/Opel0gLSCL+L9e8E5+czwB8I0Lx7uEVaKL5Huj2FtYPnvm8Ah
         sdYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776123155; x=1776727955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAEZlqbm0dqDAiyd30/0GnEftLygtQElVS2V5SlFAak=;
        b=p7tHtUmzr/F72/mOMX7MQUAytGesYHA+6sOr6lihHYW+V3TgXY1oZ9SQadSj+gyKHi
         s5eTThVONEh+Q3sbANmfAzDZBWqZ/wB0S5h4LPMDaHjBPb176elQ6K23+Hd2kP76aYOH
         nKnvnfozPhcNtXoSLZPl5d4Y4xdo8mYXb+vc9s9uB46OsSHVqmmeAqiYOOfnszDVOc3X
         x78+DI8JWZKE5LaqkI3G7hVz1xwS2G8qNGbrR9Zcnn4CyjvDAoyoKRtAgzr52+7p80ij
         SGzgHHyXGHuyGRQ391JcpHsixU7U1ig1ybCxcA7d9ORxulZD+78HHmuXS8sNp94cVUQH
         koEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776123155; x=1776727955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uAEZlqbm0dqDAiyd30/0GnEftLygtQElVS2V5SlFAak=;
        b=LM+35xFeAW3hzTyMMi53Jm+dYjUz09dKGSEcUiewOdEIsV3lq58/mTV3bIoW963j1x
         V+kprnXJMCOzfUURyNmBHIiAwAPSWmAJ4hhJjsuBZJzBTcNr0WdeM562eUKZsyvxZZ0I
         8a/NZgG6F6wf74LxxbFLYuztExhh7Vg1uMOIEBBnKUqsJotoztSUqyxz81XhfakrzH35
         CSXNEY1/fpRu5agwYJ9K4epvvOBVDiLVySTXTQJBpbtzGRD0omHPtlBtoZqfepA6YnRQ
         VjT9tJJ65O0deQ+2InuPpXjyqJ3i3JmHFGtU4hwLT54/aua9ppNIp/jr9NRJyr+n9xk3
         e84Q==
X-Gm-Message-State: AOJu0Ywk64nxgmRyPN43DZMw5u5YdI/4LXyBJDdamUw9dd4pycFAllgW
	zoLuTrAoOYCoIflM8fhYpn2A0BZUZla9i28mm3gj7moB9YPBCruYTh0i6Hacfq6pk587nmDwb0C
	8YYjfzx1bS3EjWiaWiHW5lfzKmo0h9iqsOMXV
X-Gm-Gg: AeBDieuJa2T4XRDFDuzfJQaVSAMPQzCpxv82SPmVIVx+MAwrwxBuyrCR51yWDTRo4pK
	r7shHl6bPy759iq1oYUoCVMbEOzNxvZGe2CtOYt8QgTwPu9/cZdRm6rEa831PFWrYEpGRfceKk9
	Zri2OGCURZrCZZrXuWU94uvmKBJteoACppytoDQy465GlG/UyK5aXZbJh4R2KDwzleDpwDTWXN8
	SsToT1a2zwfiOEekpjjTi9DNnKbQhiqTn7wi7DzQ35Sus+T2PxobBBLrPuR7pbb4RZqntL7liPN
	v/hxM/pbbY7rgvuYnWihtJoxTW13DDHxS1TgbiFAY83Nnvpncb28zxrpdETRIDVKjuNdZCSMa0W
	mA2s/RzmaSR3ihRWgA1YCfU1LlQ==
X-Received: by 2002:a05:690e:1688:b0:651:c823:2c72 with SMTP id
 956f58d0204a3-651c82330famr6218868d50.20.1776123154303; Mon, 13 Apr 2026
 16:32:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
In-Reply-To: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
From: Dan Cross <crossd@gmail.com>
Date: Mon, 13 Apr 2026 19:31:58 -0400
X-Gm-Features: AQROBzA6yB1tHg7_sL9f3dml-X6wSovSpsc2jm5WyAOCYeRQ-BhEEp9_rNfnBFo
Message-ID: <CAEoi9W5o_twDPYMZDqajqz+UYJm5wOvAx+hUFefXmU=vUbOgtg@mail.gmail.com>
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
To: hugh@blemings.id.au
Cc: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 3:36=E2=80=AFAM Hugh Blemings <hugh@blemings.org> w=
rote:
> [snip]
> My email here seeks to see that we, as a technical community, navigate a
> potentially tricky point in the hobbies presence in the Linux kernel as
> well as possible.  I've a decent long term view of the matters at hand,
> but lack a good "current" picture[1].
>
> There's a thread[2] that kicked off, primarily in linux-hams that
> initially focused on bug fixes in the Netrom code. This has broadened
> into a discussion about the future of the AX25, NETROM and ROSE code in
> the kernel.
>
> A couple of well respected mainline kernel maintainers have noted the
> maintenance overhead of these (relatively) lightly used protocols. This
> has led to, quite reasonably I think, some discussion of whether they
> should be removed or deprecated - the perception being they're not used
> much. Note that none of this a judgement on the hobby itself or the
> utility to the broader community.
>
> There's also been some very good points raised in that thread by hams
> around whether it makes sense to move the implementation into userspace
> or to out of tree kernel code. Both can be done in such a way as to
> cause little to no impact from the actual application code that makes
> use of the protocols.
>
> My intuition is that we probably have folks here on linux-vger that have
> the requisite skills and reputation, or ability to gain them, to keep
> the in tree drivers up to date. But perhaps that's just "old" thinking
> on my part?
>
> So I figure a thread here to discuss how we go forward made some sense -
> stay with the current in kernel model, look to go oot or userspace.

I think it would help frame the discussion to present some background,
go into the various options, and present pros and cons of each. With
respect to keeping protocol implementations in the kernel and in-tree,
it further makes sense to present these from two separate
perspectives: a) hams who use the software, and b) the Linux kernel as
a project.

# Background

Linux has had implementations of AX.25, NET/ROM, and ROSE in the
kernel since the 1990s.  Though it is nowhere near as popular as it
was in the 1980s and early 90s, packet radio using these protocols is
still in use world-wide: AX.25 in particular is the basis for APRS,
and beyond that remains broadly popular for accessing packet BBSes,
exchanging mail, sending radio telegrams via the various traffic
services (e.g., NTS in the US), and so on.

AX.25 is a bit of an odd duck by modern standards; if fits into
neither the IP/TCP nor ISO/OSI models neatly, and in OSI terms,
provides functionality spanning layers 2-4; details may be found in
the relevant specification documents.  Note that Linux implements
version 2.0 of the protocol
(http://bitsavers.informatik.uni-stuttgart.de/communications/arrl/AX.25_Lin=
k-Layer_Protocol_Ver_2.0_198410.pdf),
while the current version is 2.2
(http://www.ax25.net/AX25.2.2-Jul%2098-2.pdf), with updates in 2017
(https://tarpn.net/t/faq/files/AX25.2.2-Sep%2017-1-10Sep17.pdf).

NET/ROM adds multi-hop routing on top of AX.25 with dynamic routing,
and provides a facility to address nodes using an alias (e.g., "CHAT"
resolving to "G8BPQ-6" or similar).  As far as I know, the
specification is rather less formal than those for AX.25, and the
protocol was original specified as a chapter in the manual for the
original software.  This has been extracted a few times, such as
https://packet-radio.net/wp-content/uploads/2017/04/netrom1.pdf

ROSE is basically an implementation of the CCITT X.25 network layer
with some elements of AX.25 mixed in. Stations are addressed using a
10-digit "telephone numbers".  It is statically routed.  Its
documentation describes it as, "The ROSE X.25 Packet Switch", e.g.:
https://web.tapr.org/meetings/CNC_1989/CNC1989-ROSE-PacketSwitch-W2VY.pdf

Of these, surely AX.25 is the most widely used (after all, it forms
the basis for the others), with NET/ROM next and ROSE last.  It's
unclear how widely used ROSE is at this point; lack of
interoperability with other packages that just don't implement it is
probably a limiting factor here.

A folks have run TCP/IP over packet radio by embedded IP datagrams (or
their fragments) inside of AX.25 frames that are then sent over the
air using the in-kernel stack.

## Recent Activity Outside of the Linux Kernel

Newer developments in the amateur packet radio world have focused on:

* Improving the implementation of AX.25 to increase robustness and
throughput.  For example, adaptations of Jacobson/Karels congestion
control have been incorporated into some AX.25 implementations, as
have adaptively pausing protocol timers if the link is detected to be
in use.  Also, adding forward error correcting codes at layer 2 to
help with transit over marginal RF links e.g. FX.25
(https://web.archive.org/web/20110718212817/http://www.stensat.org/Docs/FX-=
25_01_06.pdf).
* Newer protocols to try and work around some of the deficiencies of
AX.25: IL2P ("Improved layer 2 Protocol":
https://packet-radio.net/wp-content/uploads/2020/10/il2p-specification0-4.p=
df),
and ARNGLL (https://github.com/arngll/arngll-spec/blob/main/n6drc-arngll.md=
)
are examples here.
* The European amateur radio community noted problems with NET/ROM
some time ago and proposed FlexNET as an alternative
(https://www.qsl.net/ww2bsa/index_htm_files/DCC1995-FlexNet-DK7WJ-N2IRZ.pdf=
),
but details on the protocol itself are scant. Similar problems were
noted by others, and by all accounts, the best ideas of NET/ROM and
FlexNET were synthesized into the INP3 protocol
(https://wiki.oarc.uk/_media/packet:internodeprotocolnp.pdf).

Not much, if any, of this work has been picked up by Linux writ large.
Some doesn't make a lot of sense from a kernel perspective: FX.25, for
instance, is more of a physical layer thing.  However, while there
have been patches proposed at various times (e.g., there was an
implementation of INP3 done as a delta on top of the in-kernel NET/ROM
code), little of it seems to have been integrated: I didn't see
evidence that INP3 support was incorporated when I looked earlier this
morning.

## Problems With the Kernel Implementations

Put bluntly, the kernel implementations are showing their age.
Although it has incorporated some enhancements (7-bit sequence
numbers, for example) the AX.25 protocol implementation remains at
version 2.0.

Thomas Habets has noted a number of problems in a blog post:
https://blog.habets.se/2021/11/AX25-user-space.html Some of these are
purely quality of implementation issues ("setting CRC mode resets all
other settings") but others seem rather more fundamental: e.g., the
"10 REJs in a row" problem: this suggests that the kernel does not
iterate over frames in the outbound window or examine the outbound
queue when processing inbound supervisor frames.

Problems including data corruption, leaked references, deadlocks,
panics, etc, occur distressingly regularly.  E.g.,
https://lore.kernel.org/linux-hams/CAEoi9W4FGoEv+2FUKs7zc=3DXoLuwhhLY8f8t_x=
Q6MgTJyzQPxXA@mail.gmail.com/
and https://lore.kernel.org/linux-hams/my4l7ljo35dnwxl33maqhyvw7666dmuwtduw=
tyhnzdlb6bbf5m@5sbp4tvg246f/
for recent-ish examples.

A search of the `linux-hams` archive turns up a lot of problem
reports, some of which are unaddressed for significant chunks of time.
As Habets put it, if the current implementations were proposed for
incorporation into the kernel today, they probably wouldn't be
accepted, as they would not meet the required quality bar.  Note
that's not a comment on the original authors or their work, but
rather, just an acknowledgement of the current state of affairs and
how things have changed since these were first introduced.  As the man
page for ax25(4) puts it, "BUGS: Too numerous to list in full
currently."

# The Various Options

It seems that there's consensus that the current situation is
untenable, and something should be done.  As I see it, there are
essentially three paths, with some variations on each:

1. Keep AX.25, NET/ROM, and ROSE in the kernel and in-tree
2. Move the protocols to an out-of-tree module (so they still run in
the kernel, but are not maintained in-tree)
3. Move the protocols into a userspace implementation, and provide
backwards compatibility with a shim library that exposes the existing
API, but implements it in terms of a new implementation

## Staying in-kernel, in-tree.

This is the current state of affairs. Right now, the code receives
token maintenance, and there are two paths forward:

1. Status quo, in which no maintainer(s) step up, and the code remains
in a state of perpetual gloom, hovering between mostly working and
mostly broken.  It works _well enough_ for those who invest time in
getting it up and running that it's not critical to change, but system
updates are risky.  As time goes forward, and more people are scouring
the kernel looking for zero-day security exploits and DOS
opportunities, it becomes an obvious attack vector.  This is obviously
not ideal.
2. One or more maintainers actively begin active work to modernize and
clean up the implementations. It's a fairly large task, and requires
coordination with a much larger effort (that is, the rest of the
kernel).  There are obviously folks who are skilled at working in the
Linux kernel, well integrated into the community, and thus positioned
to provide maintenance going forward.  There are also folks who are
interested in keeping this code in-tree.  The question is whether the
intersection of these two sets is large enough to be sustainable.

Then there's the question of a larger roadmap: if the code stays
in-tree, does it gain new functionality (e.g., implementing the latest
version of AX.25) or is this just to keep what's there working well?

### Pros and Cons of Staying in the Kernel (for hams)

Pros:
* No need to change anything.  Those with working AX.25/NETROM/ROSE
configurations can keep using them as-is.  There is no additional
software to install, no additional services to set up, configure or
monitor, nothing else to keep up to date, etc.  Installation is de
facto handled by the distribution.
* Compatibility with existing software.  Programs written to use the
sockets API and these protocol families (e.g., `socket(AF_AX25,
...);`) work unchanged.
* Likely some amount of prestige is attached to having a working
implementation in a project as important as the Linux kernel.

Cons:
* Inaccessibility to most developers.  The number of people who can
write reasonable software in a higher-level language is pretty large
at this point; the number who can do so in C is much smaller.  The
number who can competently write software in the Linux kernel and
shepherd it through the review and integration process is a tiny
fraction of that.
* Slow rate of change. Updates goes through upstream and are generally
filtered down through distros and vendors; this can take quite some
time. Of course, users can compile and install their own kernels, but
many do not.
* A bug in the stack often manifests as a system `panic`, taking down
the entire machine, not just the AX.25, NET/ROM, or ROSE software.
* Shifting to active maintenance requires long-term investment.  The
intersection of people using this code and capable of working on it is
small; unlike (say) TCP/IP, or process scheduling, memory management,
or filesystems and management of storage devices, the number of people
who are concerned about the health of this code at more than an
abstract level is tiny, which means incentive to keep it up-to-date
and well-maintained is inherently lower than other areas of the
kernel.
* Documentation is poor, in the sense that it hasn't been kept up to
date as things have changed.  The TLDP pages have good information,
but their age shows, and the necessary formulae for figuring all of
this out in 2026 is scattered across web pages, blogs, video
tutorials, and mailing list archives in a way that can be bewildering
to newcomers.  I tried to document my own setup at https://kz2x.radio,
but that just underscores the point.

### Pros and Cons of Staying in the Kernel (for Linux)

Pros:
* It keeps the kernel honest.  Having a protocol that doesn't match
the usual pattern of TCP/IP in-tree is a forcing function for
exercising the common networking code (e.g., sockets etc) in useful
ways to keep it flexible.  Doing so makes it easier to incorporate
future protocols that follow different models.
* Goodwill with the ham community.

Cons:
* It is a maintenance drag.  The state of this code is not great, it
has many known bugs, and the amount of effort required to bring it up
to current quality standards, not to mention incorporate e.g. the new
versioner version of AX.25 or anything else, is substantial.  A single
motivated maintainer with kernel experience can likely stop the
bleeding, but doing much more in a reasonable timeframe is going to
need more folks who are invested and have the time to devote to it.
* A bug in AX.25 usually kills the kernel.  This isn't just a problem
for hams, its a problem for the rest of the kernel, as well.
* Related, if folks really started looking into it, it would probably
turn into a security quagmire.  Running in-kernel, with complete
privileges over the entire machine, is the antithesis of a modern
security posture, for that a tiny fraction of the overall Linux
installed base would use.  And as Habets pointed out, what _should_
the semantics be for e.g. network ACLs and AX.25?

### Discussion

The most likely course of action is some middle path between status
quo and active maintenance; my suspicion is that we can probably
muster up a couple of folks who will improve the code to a point that
it's substantially less buggy, leaky, and crash-prone as it is
currently.  That would certainly be an improvement; but will we be
able to attract the combination of folks with the time, motivation,
and familiarity required to, say, update the AX.25 v2.2?

The central question I come back to is, what advantage is conferred by
keeping these protocols in the kernel?  Put another way, what is it
about having them in the kernel that cannot be replicated by moving
them out of the kernel and running them elsewhere?

## Moving to an Out-of-Tree Kernel Module

An alternative that keeps the stack in the kernel, thus retaining the
ham-perspective compatibility "Pro" listed above, is to move the
implementations out-of-tree, so that they are still loaded as kernel
modules, but no longer maintained in the kernel tree proper.

### Pros and Cons of an Out-of-Tree Kernel Module

Pros:
* As with an in-tree kernel module, compatibility with existing
software is preserved.
* Similarly, a working setup is mostly unchanged, caveat that the
out-of-tree modules must be installed as an additional, explicit step.
* Most kernel developers are freed from any sort of maintenance
burden.  The AX.25, NET/ROM, and ROSE code is not a priori a vector
for security exploits, nor a magnet for sloppy LLM-generated patches
or syzkaller fuzzing reports.

Cons:
* Maintenance is now squarely on the amateur radio community (which is
not necessarily a bad thing)
* Installing the modules for AX.25, NET/ROM, and ROSE would require
additional steps, though would hopefully be facilitated by distros and
package managers.  Note that the userspace programs used with these
protocols already require an additional step to install; this would
just be adding a handful of other packages to the mix.
* It is likely to be seen as a demotion by the ham community.  No
matter how much you explain it to folks, there will be some who view
removal from the main kernel tree as a step down.
* Inevitably, there will be impedance mismatches as kernel interfaces
change.  Whereas now these are mostly taken care of since the code
is-tree along with the interfaces that are changing, out-of-tree
modules will lag the kernel. Moreover, there is a versioning burden
that does not exist right now: one must ensure one has the correct
module version of their kernel, etc.
* This code as a forcing function of an unusual protocol family to
prevent the kernel's network stack from becoming too IP-centric is
significantly lessened; it would still need to be accommodated, since
it would run in the context of the kernel, but since it was not in the
kernel by default, it wouldn't exert as much pressure on design.
* It doesn't do much, if anything, for the documentation problem.
* It doesn't do much to address the accessibility issue for most developers=
.

### Discussion

Some more details are needed here, in particular around infrastructure
to support this (where does it live? How is it tested?) and
interaction with the kernel proper (how are breaking changes detected
and mitigated?).

## Moving to a Userspace Implementation

The final option on the list of viable alternatives is to excise the
protocols from the kernel entirely, and run them in a userspace
program.  This is predicated on the observation that each of the three
is run over relatively low-speed links: 1200 BAUD to 9600.  In that
case, there the performance penalty for crossing the
userspace<->kernel boundary is insignificant.

There is significant precedence for this: among extant AX.25
implementations, JNOS2, LinBPQ, Direwolf, Sailer's SoundModem (and
probably others I'm unaware of), are all userspace implementation.

### Pros and Cons of a Userspace Implementation

Pros:
* The protocol code could be made completely independent of the
kernel, and thus both are free to change at their own rate; the
interface boundaries would be the usual system call interfaces.
* A bug or failure merely crashes a program (which could be
restarted); it does not take down the entire machine.
* It could be reimplemented in whatever language one likes, or
accessed via FFI; it not be constrained to C (or Rust).  Libraries
implementing the protocols could be incorporated into larger systems
that use open monitoring systems, are managed by e.g. systemd, and so
forth.
* A suitable userspace implementation may already exist: LinBPQ and/or
JNOS2, for example.  LinFBB was brought up as a use case, and at a
glance it appears that it may be possible to make LinFBB use LinBPQ
directly.
* Userspace code is arguably easier to develop and iterate on:
portions can be unit-tested, it can be put into artificial test
scaffolds and exercised, and so forth.  The edit/compile/test cycle is
fast and can be made fairly easy.  Sanitizers, fuzzing, and other
tooling can be easily brought to bear to flush out bugs and increase
robustness.  While much of this can likely be done in the kernel, as
well, it requires considerably more expertise to do that well.
* Userspace implementations of these protocols are not constrained by
e.g., the sockets API that the existing kernel implementation exposes
to client programs.  They can provide whatever interface to clients
that makes sense, specifically tailored to amateur radio use.
* This could lead to further simplifications inside of the kernel: for
example, special cases for routing IP over AX.25 and/or NET/ROM (if
these exist) could be removed; TAP/TUN could handle that use case
instead.
* A userspace implementation is more portable.  Perhaps Linux hams
don't particularly care so much, but with some care, the
implementation could be made to run on e.g. a microcontroller or
another OS.

Cons:
* Compatibility with existing software requires more work.  In
particular, to use existing software that expects the sockets API
unmodified, we would have provide a shim library that implements that
interface, and then inject that into existing software: for
dynamically linked executables, this can be done using `LD_PRELOAD`
tricks; statically linked binaries would be out of luck.
* Just emulating the sockets API doesn't give exact fidelity for other
functionality.  Files tied to AX.25 and synthesized by the kernel,
such as those under /sys, are not easily provided (unless we overload
`open` in addition to the socket APIs).  Tools like `netstat` would no
longer display information about amateur radio protocol state; to be
fair, the `ip` and `ss` tools are already pretty anemic for these
protocols, but the point is that some amount of retooling would be
necessary.
* Messaging would ideally be handled with thoughtfulness, care, and
attention.  I would anticipate that some members of the amateur radio
community would have a hard time not misinterpreting removal from the
kernel as "Linux kicking out hams!"  Of course that wouldn't be the
case; a significant factor of the motivation for proposing a userspace
implementation is getting a much _better_ implementation for hams.

### Discussion

Again, I would ask why people want AX.25, NET/ROM, and ROSE in the
kernel, specifically.  To my mind, the important part is being able to
use these protocols from a stable platform; whether they are
implemented in or out of the kernel is an implementation detail, and
mostly irrelevant.

To that end, the userspace route seems like the best, long-term,
provided it is messaged and socialized properly, and folks step up who
are committed to providing the necessary compatibility shim libraries.

> If the consensus is that trying to keep the drivers in thee tree up to
> date is the way ahead I'm happy to put my hand up to do this if no one
> else is so inclined - I've a couple friends I can bug to help me get
> back up to speed.
>
> But I'm also mindful there are other hams that have been more recently
> involved in kernel work, so am going to give them a gentle nudge offline
> too :)

The above are my two cents.  I'd be interested in other perspectives.

        - Dan C.
          (KZ2X)

> Cheers/73,
> Hugh
> VK3YYZ/AD5RV
>
>
> [0] First licensed in the late 80's and can even remember the smell and
> sound of a Model 33 teletype connected to a TNC :)
>
> [1] Installed Slackware in the early 90's and never fully recovered,
> some of my code still in the kernel to this day :)
>
> [2]
> https://lore.kernel.org/linux-hams/761f83cc-58eb-4b4a-ba91-d11412e7b2a6@g=
mail.com/T/#t
>
>
>
> --
> I am slowly moving tohugh@blemings.id.au as my main email address.
> If you're usinghugh@blemings.org please update your address book accordin=
gly.
> Thank you :)
>
>
