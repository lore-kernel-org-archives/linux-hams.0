Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89E62A1B2
	for <linux-hams@vger.kernel.org>; Sun, 19 Apr 2026 01:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776562275; cv=none; b=Eb3a9Vr+sSJGx+XVwem3V58QBVmqJidJxUSQQiVaXsHuJKvI6JcNGJFEkaX6+aZCEGVjEHxihxfPauj+lKkkdXYDXSe4SS0g34oH80lC072VvcYAM8GSAfoTGXeJuRvd8Qp+Ze5m3IuzYsZm6aSjd/pIOKC8EaRVuODf5Rmcf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776562275; c=relaxed/simple;
	bh=QEXfZQIfHcPPOmt9oDgATr86yvXY7E/X0oKgOwyVooc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=CcUTwDZMrnOkMT3SJX+MgImCw0pEVWCjhUSFxtptTC2qoviZHsfTfZb7imInuiax88uOj2ahXu1Gec6+8Bi/jNYT9CE8fTGQmhc0tY2jTyVTKO3lDX/meiwy0QySP3rWS9tqfxqXQY0XBWTGwoWx1KDLTs9KAxSPk2D469alJlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcsBcIgX; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcsBcIgX"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7dc51aa8926so863442a34.3
        for <linux-hams@vger.kernel.org>; Sat, 18 Apr 2026 18:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776562273; x=1777167073; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEXfZQIfHcPPOmt9oDgATr86yvXY7E/X0oKgOwyVooc=;
        b=pcsBcIgXAafVBoZOUVjT8bFMVy8KVrSRiKLLtnqysPlwwz7Sfw+vS2/ZM1V7sIuWfD
         /O5ckO765rSpOZHcX6vxDAH2QUNknK16X6mPFaONHZ7qr0xTSw0H9i1KowxmIO7Dfhs/
         +jPodQcTeUdHKKETYHM8s6CquXzVaYQnhz6ndDdBl5F0Pm5iGzv0weRH9QplSpVKoN5C
         fO1DvqKTllIg4Raqvoz6UzcI7swOrOkT04gOJDgt3VPvApDq0lTqCTSEQbLpmTaz3nxF
         VjdsTELAdCoedRJ8vfuscD6PzPm/YcHOARaoi7irbb6wzFuE07p5//Rundgf7gFkCbtl
         xEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776562273; x=1777167073;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEXfZQIfHcPPOmt9oDgATr86yvXY7E/X0oKgOwyVooc=;
        b=okdCP4gT1iKXWbOgeQXOb9Yb/N8WmVQCEfXuQ4BE3GPCL+EW2osd6hk62KmBKl4xO+
         9kPboMlTLVwDMZHZFbkZGPB0n2fG7Tb8agjMRsoF1G6SV6DCi2uvX1lSxiA7/49p3zXR
         SNvokVnHW4BphscWBUysSs6zFAzcZE3hFQaNH8xzjWDMkxjBv/Ia0FAfa0vp7d3hVqg7
         kx0AqNOLFjUK32LzlCuhKiQwgoDBD0Brr06rz5IrNtA0Z0n2y1h3LEMO/zBwdW23FSxn
         tKh9ULLJVgtmDnyUBCBqsufsICksi54Z2gJa9YOpMO/DPPodCRXrOCvAMRLKa85o5ETt
         hl3g==
X-Gm-Message-State: AOJu0Yz8y13KOsSJBOlh+d2DH2y/yTyTrxkgxGpDd8exHUpVY0mfVdm0
	psjoZZ2I8UNn2Jfbnzbr93T0QUdK7RHjGVHiyMfKnEp7CTAXxx7ksBD94Bg7yg==
X-Gm-Gg: AeBDieurEVSkOopKMt+xzYlK0aGoGc9RCCqScNm0iKyO3Tcf/TEW7v2WmZa8oOO2hGX
	ASf2QVRSwTYeFfHnPA9Wb3KlebvZaQ5Y45JCyFwJUbV05XX0ulg9o6W2XG+6ImVlR34APmPrhKW
	e6iXkRFQXXfmmJcHu/45fOXv0zI9eSmuGPUmoSf16EQPHUHZDap8w8dtCIbR7YjUZExpH1LDeMV
	IMa0E9bbsZZKnxZbJDCbvvDiGFnr4UYIwuCKsjOGU+3blN1uDZTb5Pg0SYpnRrZF8giBQ+npBNX
	7PtSM0hh1l4VkRO1g09MTOTaGmmVBi6UxIPwSyAMEhFDuiHmSIZFMPoMupkEZz2sZKF7c7lgItW
	8sDfmU2YXjpqS0YFQ3XYvb/q7KIcsN/klLx4eS1viiyQi/wYu9QTyo1jNMFNbDbrTffIDZ/KaBe
	t5dHXwvaJm9+ic3v1+PA9fhg5C/f+7CFtdCTIP5UVYs8mBG0o4VYOaqDuUsNruqZsGyOakVazaZ
	qdiddVk7w==
X-Received: by 2002:a05:6830:2b08:b0:7d7:fcac:6374 with SMTP id 46e09a7af769-7dc9514f073mr5046437a34.8.1776562272840;
        Sat, 18 Apr 2026 18:31:12 -0700 (PDT)
Received: from smtpclient.apple ([173.175.80.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc9a7102b0sm4355914a34.0.2026.04.18.18.31.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Apr 2026 18:31:12 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
From: "Steven R. Loomis" <srl295@gmail.com>
In-Reply-To: <hsdnwdq2o2g26gbvm3wvychl5rp3eri7ggj7kkmple7yzm3kgz@u2pbkjyacqyw>
Date: Sat, 18 Apr 2026 20:31:01 -0500
Cc: linux-hams@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BBE715A7-E261-4A6D-A9CD-6B0D3CF72F1F@gmail.com>
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
 <CAEoi9W5o_twDPYMZDqajqz+UYJm5wOvAx+hUFefXmU=vUbOgtg@mail.gmail.com>
 <CAEoi9W6vTPPHh-NBKZcgmo7GKTecQw1UuZ4HjwNTzqvNXWC43g@mail.gmail.com>
 <hsdnwdq2o2g26gbvm3wvychl5rp3eri7ggj7kkmple7yzm3kgz@u2pbkjyacqyw>
To: Nate Bargmann <n0nb@n0nb.us>
X-Mailer: Apple Mail (2.3864.500.181)

I have a dormant project [1] to add Node.js bindings for AX25 to be able =
to write Node.js apps directly on AX25.
My AX25 use is also dormant, but I would love to bring it back up =
someday.

User space makes a lot of sense for the reasons given.
Since maintenance is a question though, perhaps it=E2=80=99s a question =
of who would volunteer for making any change (beyond no change)?=20

> what could the AX25 stack in user space do that Direwolf cannot? =20

The AX25 stack would still attach to Direwolf so that connected AX25 =
apps could run.

[1]: =
https://github.com/srl295/node-ax25-seqpacket/blob/add-actual-stuff/lib/ax=
25-seqpacket.js

--
Steven R. Loomis
K6SPI

