Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF3F46D572
	for <linux-hams@vger.kernel.org>; Mon, 28 Sep 2026 17:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617519; cv=pass; b=qbdu9jSru6vS8imidP50SkWpQ8etHpM6OiL3VAYQQwfnqKCJaVCaVRBS2Mtq6prPkk+FNKwj7RViLm/kLVlbMdhKEYNA7smhTi8ph/G4SkHvt9z4RoaUZh2WLXdWlFjESuWDu/8wB07VUSuxkeN2H13fLHEloVJf8rNzRcBG0po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617519; c=relaxed/simple;
	bh=1JawZ69qM5bBuhv9te1lXqt34uRJ1zLcBBkzaOGNFaE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OuIuusxKphLVEYABOTJZFv6/zZOYbicdp8IG9FPELZG2KMivK2X52F+f/10vl3lDyOZkBESzNcsI/u81diWQ1Ff+KQYCTohf4HdqRIKs6UBqzk5uTedlcgz2DxxtfQ+VgYtHu/FYeYiVz4PycYfhlT+qc1IBjXG4YUIm4MUtY/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLIUHWUb; arc=pass smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLIUHWUb"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8a8f3f7ff7cso24153247b3.3
        for <linux-hams@vger.kernel.org>; Mon, 28 Sep 2026 10:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790617517; cv=none;
        d=google.com; s=arc-20260327;
        b=pXqz5ihVukvGDKo0KyPcd+CCpdf0AwVYnJPYPoSVMfdN0lvWUzrFyrl4nFhzU/2XJF
         k9v44tKtAlPwFY4bFAI9UZwx7kF/C7EVsfrerbt6kOuAVv52xYlBUQ+vI2i9wOYlmCia
         34yQb5zCPQ+Tcz0VvtzIlIXkSLdcl+AgkDRCKLjBJVvZaBFOcFVA3sOWJhJ+QuU2RDPv
         LEol9hRGHwr6pYM8A5pkXBJHOD+1dD/obl7R4evHVK2zorM+lnezky7eolvVYnJNf7Q+
         qmXP1xSSiw/JJxDnlVrhBGD3NoYA/g0BvHgG27MaPi7vJD/PuCtLocbFnFxxQTTXcyaw
         Nq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=CUTDIlypWI5Het40q3GjMSz1p/A10Nq+HieZRbltsXY=;
        fh=CzBa28dqU3zrM/smhxW2TDq1BuN42sJnz/1p33+M5Zw=;
        b=I48cV7AxopghPOHNTZEZA7EJxQzn6xBI7o609geUgrk3mr2+KQ1/ykRJdbugcb7AW2
         niTU4TI4rkrXzPE2elOBqC4Issi8+Gwr9dv99FVtsnEJLqeBcZjF1rhlO0BJnREHAYcy
         5of1oqutV4TCa6VP3HwzVXdUWhC1UWbDkQDHp9NImVmSNvuhFxv6Dr9JXxejH4hQb2Qk
         TrKOmgp4hrXU8ApLQ25qGhcvDK2j4mMxwwWHEmCg2ijINEiPWVenIZJ0+wg/+jZqQUa5
         ve5I+GUHSbg/qJ6Up+VWVFTGTPkaJWgzW20NGJhzocYaekKf8nHCPtfKguUsA0RAWHHi
         j+6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790617517; x=1791222317; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUTDIlypWI5Het40q3GjMSz1p/A10Nq+HieZRbltsXY=;
        b=dLIUHWUbhOE4nD9rHRUhCzClu0v0qnE6HQyKIz+QA+3Yuvhd3TOPYYNgftcupvRrXx
         8tVZFRV4A89UVGqWjowWJxeICtOCd/hKlYFVmqVoGEt2AajIhYa8XuXraaQE8LCnVJEN
         dgFX13J68BjqtOvCSCfevFlUVKI598mUF0tTY78XCir4xzvSbA2Ik9bblsjrvNUSoxDH
         dj1XOK10fzvFWqJfafCPpPPFBpVcaGDkV2G66v8/GbH/MxAhQ/htq74s1zlaaaUfQisB
         1i7WwQoAxTkNnc4sJO2MC5vzIAE3XrpS2+iYDqMROyBgiDWCIyDbp+RGVj5dmvPrIMoX
         UlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617517; x=1791222317;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CUTDIlypWI5Het40q3GjMSz1p/A10Nq+HieZRbltsXY=;
        b=Ka0w/wIDG5PcaFE9/Gm/F7JaRKcTZj+oclbIuEIbxf3/uWICaHyAUpPTM0z8lwW2lP
         v/nddKqBwP8K7kHHxbvwGZnTCvLU/m08L/lCeVnoUmJONF9ed9JiRKfP3OoUsL9EWbaC
         qoecNSHcWq7mX3WPS5YZ2xCQdfqzKQv+CivrAVJyYXo+tG0LD7bbZZqXF+VJCL9x5F5E
         ohiA/WzXo21xM2mCvKfovsTQZpO/Mw6CLdBg70gXl9pnfKz0FYkSPhoBMikgVuJsLro+
         20+r06zzEt/cYbU/pHdDQ0oYxMdt5BdD60ejWhluKPuFeHBK81Q8UKWaAX6dHj9LjZUo
         MRLA==
X-Gm-Message-State: AFq9FYJC/ZRW7SaS/713/vXcIE1JDcWaOkvAhWG8xCqjw9XSUL242TAx
	aQXkT9PP46lzAQYj6OzdGCocfDYiiANZ9ElBteNnqhSMy1x0scmLBwQtXnVOCQtOU/W19a+Wnmv
	sokGwUWMPvDr8exnoRoybPvKkhaop0ZpC5nLdzDs=
X-Gm-Gg: AYBFou1bg13ZjXlz1QpxuDEuZV5RXgqZ+U8HmmMJvEIZ83jUu3yS5XmKMTdOQpeNshn
	nHgN7GY9chd+TA9W7fBIRPz1XcSsA7JU0eoeRZhiyh8VJt/+ILhpH8mUuqSiF1Qe4KZGRkn1v1u
	i0mlIsykbg5RWEIgnOyCey0RZL4U2/BSqUfYCNoJlG1THCCd8oztXqpADy2ZFGv2dmS7kctQrXf
	Q8u4MBtdrs6rPoG6+hNT0XAmlUm+vkJ60yXvWIkADdPDW00vwk2ItO5z+8w/a+maCHs/DR2YqDm
	vnv3HZ7I2keywX2GHRz+P6+0zqbnDjaXQEqGDKhpofNAKkUtRt56mdY=
X-Received: by 2002:a05:690c:6d81:b0:888:7a02:280d with SMTP id
 00721157ae682-8a649591e1dmr76490777b3.30.1790617516235; Mon, 28 Sep 2026
 10:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Mon, 28 Sep 2026 19:45:04 +0200
X-Gm-Features: AclHuK-MdBYEJV_V4FohOgRNgiqC72SJ0NSSJPLl107ijggkz4yZc-kCaXjT0iI
Message-ID: <CAFAa3YCRWb7pX9z0dju8HBJK+d8qGmAfJWhsHx+tgmnAGtMwGQ@mail.gmail.com>
Subject: AX.25 / NET/ROM / ROSE fixes in mod-orphan: status and call for testing
To: linux-hams@vger.kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello all,

Since AX.25, NET/ROM and ROSE were removed from the mainline kernel,
the modules live on out of tree in the mod-orphan repository
maintained by Jakub:

  https://github.com/linux-netdev/mod-orphan

This is a short status report on the fixes I have been working on,
and a call for testing.

Already merged
--------------

  #1, #2  rose: use-after-free, refcount and timer fixes on teardown
  #4-#7   rose: routing loop detection, NULL neighbour guard,
          t0timer teardown, quieter state 3 warnings
  #8      ax25: bound REJ-driven fast retransmits with the N2 counter
          (the "machine-gun" REJ/RR/I storm, thanks to Chris KQ6UP
          for the report)
  #9      rose: purge rose_neigh->queue on final teardown
  #10     hamradio: always override the alloc_objs compat shims

Under review
------------

ROSE:
  #11  clear stale N(R)/N(S) before (re)transmitting a data frame
       (RESET/DATA storms between neighbours, up to ~2000 frames/s)
  #25  hold a reference on incoming sockets queued for accept()
       (use-after-free and kernel panic when a caller hangs up
       before the call is accepted)

NET/ROM, input validation:
  #12  linearize and validate lengths in nr_rx_frame()
  #13  require full NET/ROM headers in nr_route_frame()
  #14  validate source address in nr_find_socket()
  #15  bound fragment reassembly in nr_queue_rx_frame()

AX.25, input validation:
  #16  fix OOB read after address header strip in ax25_rcv()
  #17  check frame length in ax25_decode() and ax25_rx_iframe()
  #18  fix integer overflow in ax25_rx_fragment()

NET/ROM, locking and leaks (the syzbot deadlock reports):
  #20  use a single lock for the node and neighbour lists
  #21  look up and update routes in one critical section
  #22  fix reference count leak in nr_rt_device_down()
  #23  clear nr_neigh->ax25 under the routing lock in nr_link_failed()
  #24  fix nr_node leak when nr_del_node() removes the last route

Several of these are patches posted to netdev by other people
(Stanislav Fort, Greg Kroah-Hartman, Mashiro Chen, Ashutosh Desai,
Junjie Cao) that were never merged because the subsystem was being
removed. Their authorship is kept, or credited when I had to rework
the patch, with a short note on what changed.

Testing
-------

The ROSE and NET/ROM crash fixes were first reproduced and checked in
QEMU with KASAN and lockdep kernels. Since 2026-09-26 the whole series
runs on several nodes of the French packet network carrying real
AX.25, NET/ROM and ROSE traffic: x86_64 (6.12), arm64 Raspberry Pi
(6.18) and 32-bit armv7 Raspberry Pi (6.18). No BUG, Oops, KASAN,
refcount or lockdep report so far, and no ROSE storm since #11 was
deployed on 2026-09-25.

How to test
-----------

All the patches under review are gathered in one branch on top of
mod-orphan main:

  https://github.com/f6bvp/mod-orphan/tree/hamradio-fixes-under-review

  git clone -b hamradio-fixes-under-review \
      https://github.com/f6bvp/mod-orphan.git
  cd mod-orphan
  make KDIR=/lib/modules/$(uname -r)/build

The repository as a whole builds against 7.0 kernel headers (tested
with Ubuntu 7.0.0-31; the other orphaned subsystems it carries do not
build on older kernels).
On 6.x kernels I build only the net/ax25, net/netrom and net/rose
directories with a small compatibility shim; ask me if you need that.

Reports, good or bad, are welcome on this list or on the pull
requests. Please mention the kernel version, the architecture and
which protocols you use.

73,
Bernard Pidoux, F6BVP
