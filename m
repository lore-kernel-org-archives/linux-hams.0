Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE446346FA8
	for <linux-hams@vger.kernel.org>; Tue, 12 May 2026 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778597120; cv=none; b=CCqoAeKm7oRFpuM01LyAIaP3d80NeMccB65bCv8Nod4ko1o5hDsIc91k/yh0ypiTbklff7Y4v5Or9N2GbQsQmy9m2cimNPubcIc6w9BTJptwEUtNO4ujzXfQdG1O16MHaIX7zRB+kQYGUCZh1xlyHU3+8CXjcj4IaXyx2hetPAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778597120; c=relaxed/simple;
	bh=pNjPLUfYOnlL9AuWfKEjlCxudFzPIGw2EJqVl9WOMxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P8TXjhbvj/t+45CLAbjbgMwRV+KJNy5ODvypyvAJC6/ZGOTEmdq8LJZN4jzANG1et+2x3x+XylE0++A9pJMSeSF7Fq07MrHwsYbqtvK6hhj41VzPt9Wpd1NS/XxtJYKKHayJpfv+xXnWRc8n48ZODuiD3HMOD9LfLuwzW5fK8SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHtJxjAo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHtJxjAo"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so95516825e9.2
        for <linux-hams@vger.kernel.org>; Tue, 12 May 2026 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778597117; x=1779201917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sza2ZxpHlBY8pmqC5zMaFu/RPKkibTVxTiEJ6kAqjb8=;
        b=PHtJxjAosh1U0g+a1DEOfiXi0eYoCeR8VARgRkKyNwOTVNJhxAtIMoMl37QJ2m5MUx
         CRyN8WiSsk96kU6JPWTHLyaX2yhs4nGeUalx1dZgsvH8CNOdmzsH9tFY9hX9tOzF430I
         n7x0gW4XaIQDz9Xtrn2i8CDqsLfbzXhU86FAp7SUe9u0kRoBTF0cvhIJoDp/iONDV5hH
         1oal/A+UqE2FYL2YmH1I4Lb5rGpMHF+UWpElhC8m+GfumLD//U9mdtz+dLaXSSH3GRO0
         Zsfss3DulDcPsRDKyCfPqEIhnkeaRTnk5PMZ9ykCVNjuOR4miSCEppl8Z3UrOSCBvcNN
         TYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597117; x=1779201917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sza2ZxpHlBY8pmqC5zMaFu/RPKkibTVxTiEJ6kAqjb8=;
        b=PZ/weolIGnXL3ez3rPHo7ntDgBke9qusqG8Q86uzlZI9lr3TlUu015nC8D5VnPbhV/
         E4ZrEIFeFjYrO3W/bMmg3ike+Y1zCEXY/ANQeTflnwqRztw4CVl07pOm9lIBiCwgoZCG
         IgNqfkUCXTJCC9JUblvSMcFlN8cughYvAwUg62kjFOFwhNHbSW1bZws5q5oEvdNOppx5
         rDXOTIUoDVmTX3Y5zUk1gZ4uYSED7Dgj+bYduqfXCBXuKm9SQtazSG79zxvoW9w2Lpnj
         p1Gp5jY0/MdFExm3a0raXRJgXUvc3rrlvlIlI5KaqZQErVyHRRAdNE3bzq7YuNO0Kea1
         xxvw==
X-Forwarded-Encrypted: i=1; AFNElJ/2SlOlMfDM9jscJ6bVsFfMG6ptadS7ZV1463h95hz/ZqC8kWauU9zilSIgikvZGPhcmLxdWZ5FmLtn@vger.kernel.org
X-Gm-Message-State: AOJu0YxrqDJnj7Lrf0mBCw7D6XD9dUlScLZxMT41VyXFgSo4h5Yg6MAx
	PY3Mq6QsUc6dpVVq2ewR0sMUsgPBVSjgmycO7NSbySbuea2teJU4Z0JI
X-Gm-Gg: Acq92OHMvxVLTqicXBpTEuy/HNy05dG7LiZlCP8Oz3sFvsIfu+x5UbzH/3vrOp9rPXI
	rZxSAlAvkHO3wkUW8Ie9vLzgF2yCmfgAl4PSRo/5+bVLmuny3jTigIOK3mUp8JKkRIRs/jQU2Pz
	uWxaZnI378G9kIj5VuGMZUKy8/NgTVJlfaOppg/q22sDd1sBJlGms3M7Wvg//bd/Cclsndt3h7i
	T/9hyt4p7GpctUyRCdEKtLizdysf4Kro3uLdupzaxhknBP1E2qATEeq5LYLukj5700NOHZ1X2Kk
	sp0TGW9cJq+JYWyBcxTeXbxooqi+QjzprSCgydXb+WeBiMSSnh9H75t5k+xUwRy66fWtSoGUjHC
	4KQqACEpRO9x90lDkyU8RQe98yALavFrLAII1oU2D4b2+roPo7JLzb/XmbATv4Yq1+PJ0yByKee
	0Y21Bzzwgaq/31ukw5yFbWGNWAv73yZ+94jiPduv6mtRYeuutEks6Sopj4CzIdB7afRGX3z8Vor
	7rF
X-Received: by 2002:a05:600c:17d4:b0:488:c014:34da with SMTP id 5b1f17b1804b1-48e51f4cde9mr282699415e9.26.1778597116959;
        Tue, 12 May 2026 07:45:16 -0700 (PDT)
Received: from ubuntu-f6bvp (lfbn-idf1-1-304-238.w86-195.abo.wanadoo.fr. [86.195.26.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d1f669sm2563255e9.4.2026.05.12.07.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:45:16 -0700 (PDT)
From: f6bvp <bernard.f6bvp@gmail.com>
To: toke@toke.dk,
	kuba@kernel.org,
	stable@vger.kernel.org
Cc: Bernard Pidoux <bernard.f6bvp@gmail.com>,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	gregkh@linuxfoundation.org,
	linux-hams@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio (hamradio) subsystem
Date: Tue, 12 May 2026 16:45:10 +0200
Message-ID: <20260512144512.9960-1-bernard.f6bvp@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87se8mytvv.fsf@toke.dk>
References: <87se8mytvv.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bernard Pidoux <bernard.f6bvp@gmail.com>

Toke Høiland-Jørgensen <toke@toke.dk> writes:

> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>

Hello Toke, Jakub, all,

I understand the decision to move AX.25, NET/ROM, and ROSE out of tree,
and I am not opposing it. The maintenance burden caused by AI-generated
syzbot reports with no human follow-up is a legitimate reason to act.

That said, I would like to raise one specific concern: the ROSE subsystem
accumulated a number of real bugs through upstream commits that were merged
without hardware testing. I have been running ROSE on actual packet radio
equipment and was able to reproduce and fix five of these bugs, confirmed
via KASAN and netconsole.

The most severe symptom is that the ROSE module cannot be cleanly unloaded
once an AX.25 connection has been established, which makes amateur radio
applications that rely on ROSE effectively unusable until a reboot.

My five patches address:

1. rose: fix dev_put() leak in rose_loopback_timer()
   Fixes: 0453c6824595 ("net/rose: fix unbound loop in rose_loopback_timer()")

2. rose: hold loopback neighbour reference across timer callback
   Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")

3. rose: fix race between loopback timer and module removal
   Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

4. rose: clear neighbour pointer after rose_neigh_put() in state machines
   Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")

5. rose: guard rose_neigh_put() against NULL in timer expiry
   Fixes: 5de7665e0a07 ("net: rose: fix timer races against user threads")

Each patch carries the appropriate Fixes: tag and a Tested-by from me on
real hardware. They are visible on lore.kernel.org.

Since ROSE will no longer be maintained in-tree from 7.1 onward, the only
remaining users are those running current stable kernels (7.0.y and
earlier). Would it be possible to have these five patches queued for the
stable trees via Greg's stable process?

I am happy to resend them as a formal series tagged [PATCH stable] against
the current stable releases if that is preferred.

Thank you for your work on the Linux networking subsystem.

73 de Bernard Pidoux, F6BVP
<f6bvp@free.fr>
