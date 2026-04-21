Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E21D5146
	for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 05:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776750405; cv=none; b=kksinItEsCSvpGgkHSFTT39C3rUaP4HHa6Tp0YOYGQkFDKRh5KSeSRe7isHlO4bKrNLnxdSeUvcqnRPqlI8WffHFTJEvxpt076JCwP0twuABDs+ShfNI4eBUyoc6UvDw4Fk9jguOnNRzM8gz3lez5Hie2DkrmuaZYcgyXeujFi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776750405; c=relaxed/simple;
	bh=Ub2/CujAcX3WFWcxCD/i+N7vpumJ3LeFtAn0W3AHdL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j/+7vhvi4wsgMfH0jWmWrDmTmH1C6BBgRfmiACn4q2ORTirky0Z5MOes4Xmtf51MwBWXFzB1/Pt3+EF6OR+9Et42qr/W+bvJ0qXn0cDXP7vzElNVjhp5Vrue0jLnMhve/NskNuavFWCNxDyGy3iHr9IcShiPkcT/bX0MSA6vpLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDZmYboU; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDZmYboU"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a58057d7baso48394376d6.1
        for <linux-hams@vger.kernel.org>; Mon, 20 Apr 2026 22:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776750402; x=1777355202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwVOqviN0nRLq3+r1rz1vZYdV1pHIllY/x32ovYOlAo=;
        b=NDZmYboUdWSfSe+3MRBunxCTO4RXxFGjJMDbeFsPGXul2ZASg3Dk7uEjertgiabLk8
         53RICCXDztWaW9sNZs/DIHU3bopo/0OITO4zkkjSXbFXgK/+jGR6Z2ugZLuWWRowCMED
         rd7Kuw1HzfK6rprvU5kVqxmQyMcRUubApCFPbWUzSPqj21sMgpgvPgXu6joJNntnr5NB
         sKlkVqFfWFB42uvn1TjF6IEBCmjCWVqrY6Ss6j6wVP/3KQsRR54BTivGD3CHjQa1r02g
         fVyYHDzs2iIs1SeWRjbRAjoGDYOKpq7v2E21tRFIK0rQE32F9ncKAVB37mQDVAhlyQOn
         OLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750402; x=1777355202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cwVOqviN0nRLq3+r1rz1vZYdV1pHIllY/x32ovYOlAo=;
        b=GYH6I50ApeBuRo7OFFy2O/R+jPZigb0U2BK/JNtpKiZEXsscnlUu1700TguBhDLsPc
         BtqDHng60+9t6X4w2CpvL8Sojjx1C58vYBJ6MSNpTYpH2h0kFBLNjeimZzM0ZDqMfR0i
         Uk9dKcElzV6sausUfG0gAep613b4ukNUSZPYLLjKXdudwMRceZYqxVftjd/SVvLugA2I
         Ve67ORLUgERvx2JDYvmdNYdX78PfqVdZcAlkAo+24N7UhRu8xKNnk7adTT2G/Aixyu00
         He9+0/yxRFkSAAiH4DgGN8M9w4RQF93ZPrgNUbZ/00arJEr/2o+utKcUnA+MMaglWt2I
         BVJw==
X-Forwarded-Encrypted: i=1; AFNElJ+5f2TM4zA5i0taXvVoBCZ13hQoVNIkTpa7IlEmtHglhlbFSm3j6YUsC3rY7xthlOqQBvFpbka7lBvK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj0rad4WZdZhV+uDR7CUqmVurxplyFnVEXPi7icVD0h7qaOUO3
	ROCMWhoOChDQ457uFgE2EqyuL+BHL8K6oej315RwyuHYhIzg7O3C4ZcC
X-Gm-Gg: AeBDieuEDRUE4p3YziMwuLf+PES8L6N1GkPf9GRtZQjXbNY+DZ8xZMBEXogfxLdX5fE
	NmKXZwCs9PdVB9kye0QUD/3WhI+hvPsnqPvdnoO12Y3yFnDhSjCCmOvbyZuUo1/SVxVT+W7b7HM
	vZ/+24NRR5bkpXb2NtQBDVIUW6AqRP0OZooRJKTZg7I4G6X291ODv5g6/o25wm064OGPhDM8y2U
	FcS7ppR0Cx8DQSoESNYoxmI1sqQdPoGaOSEP953CtHF3pCrJIVRO3HqbEgiMTZUf0E8QvpRyrsh
	TQo5vyightWzB3sgaN47aJyO6hvVbXtWBs18GLDo+pOxqyIaDUSZt1hCxVOuMtFIylYYW/ajLVB
	yk1xERICWBcOECYY6Ig72XwQshSL+9yJ4GLRlpnVMuPH0b/mvtmCrppLd7pCYD5FfrzEqaETOiR
	N3n5MGNbthnX5Iwl38PlJ1erkISaYFyIZeIV3YBnlXe6ENir810C+eI3uNhmSTVxFNoA0TBF8F6
	ZeD0AUWztuBXCcojqrCgIdfduTGm5+c7OjgSOg=
X-Received: by 2002:ad4:5eca:0:b0:8ae:6380:8f97 with SMTP id 6a1803df08f44-8b027ff9ec0mr283807226d6.9.1776750401954;
        Mon, 20 Apr 2026 22:46:41 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac462d9sm96508256d6.7.2026.04.20.22.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:46:41 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: netdev@vger.kernel.org,
	linux-hams@vger.kernel.org
Cc: jreuter@yaina.de,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH v5 net] ax25: fix OOB read after address header strip in ax25_rcv()
Date: Tue, 21 Apr 2026 05:46:26 +0000
Message-Id: <20260421054626.732399-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417065407.206499-1-ashutoshdesai993@gmail.com>
References: <20260417065407.206499-1-ashutoshdesai993@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A crafted AX.25 frame with a valid address header but no control byte
causes skb->len to reach zero after skb_pull() strips the header.
The subsequent reads of skb->data[0] (control) and skb->data[1] (PID)
are then out of bounds.

Linearize the skb after confirming the device is an AX.25 interface.
Guard with skb->len < 1 after the pull - one byte suffices for LAPB
control frames which have no PID byte. Add a separate skb->len < 2
check inside the UI branch before accessing the PID byte.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
v5:
- Move skb_linearize() to after ax25_dev_ax25dev() check; avoids
  unnecessary allocation for frames on non-AX.25 interfaces
- Lower general guard from skb->len < 2 to skb->len < 1; the stricter
  limit incorrectly dropped valid 1-byte LAPB control frames (SABM,
  DISC, UA, DM, RR) which carry no PID byte
- Add explicit skb->len < 2 check inside UI branch before the PID
  byte (skb->data[1]) access
v4:
- Linearize skb at entry to ax25_rcv(); replace pskb_may_pull() with
  skb->len < 2 check (per David Laight review)
v3:
- Remove incorrect Suggested-by; add Fixes:, Cc: stable@
v2:
- Replace skb->len check with pskb_may_pull(skb, 2)

Link to v4: https://lore.kernel.org/netdev/20260417065407.206499-1-ashutoshdesai993@gmail.com/
Link to v3: https://lore.kernel.org/netdev/20260415063654.3831353-1-ashutoshdesai993@gmail.com/
Link to v2: https://lore.kernel.org/netdev/20260409152400.2219716-1-ashutoshdesai993@gmail.com/
Link to v1: https://lore.kernel.org/netdev/20260409012235.2049389-1-ashutoshdesai993@gmail.com/

 net/ax25/ax25_in.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
index d75b3e9ed93d..c81d6830af48 100644
--- a/net/ax25/ax25_in.c
+++ b/net/ax25/ax25_in.c
@@ -199,6 +199,9 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
 	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
 		goto free;
 
+	if (skb_linearize(skb))
+		goto free;
+
 	/*
 	 *	Parse the address header.
 	 */
@@ -217,6 +220,9 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
 	 */
 	skb_pull(skb, ax25_addr_size(&dp));
 
+	if (skb->len < 1)
+		goto free;
+
 	/* For our port addresses ? */
 	if (ax25cmp(&dest, dev_addr) == 0 && dp.lastrepeat + 1 == dp.ndigi)
 		mine = 1;
@@ -227,6 +233,9 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
 
 	/* UI frame - bypass LAPB processing */
 	if ((*skb->data & ~0x10) == AX25_UI && dp.lastrepeat + 1 == dp.ndigi) {
+		if (skb->len < 2)
+			goto free;
+
 		skb_set_transport_header(skb, 2); /* skip control and pid */
 
 		ax25_send_to_raw(&dest, skb, skb->data[1]);
-- 
2.34.1

