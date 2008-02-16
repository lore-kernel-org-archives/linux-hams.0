From: "Pino Zollo" <pinozollo@gmail.com>
Subject: Help pppd
Date: Sat, 16 Feb 2008 07:30:12 -0300
Message-ID: <000a01c87086$f4f98160$98cc10ac@tower>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to:subject:date:mime-version:content-type:content-transfer-encoding:x-priority:x-msmail-priority:x-mailer:x-mimeole;
        bh=oUX6s8HMpHU8tV+ByYZSoSNhJOw7bueS2BDcR/TEJ1g=;
        b=l4iu3s+KGk2Dkvc741v8GJrgLqioMJt65zgTZ1m2RoTUVxhusKVkg81H6NAnj/kWEjuNj1eRPVcshd14TMAECrSZXRY6ujlIzjV/fto9nhNGAuRxCamSsFW7l68lbvQ/bY0TUIgx7xfekzsnsMqnK4Dkh1ZS1Y1RhmD9yjtzeuw=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yahoo linux hams <linuxhams@yahoogroups.com>, Linux Hams <linux-hams@vger.kernel.org>

Please can somebody help me in configuring Gnome ppp on Debian 4.0r1 ?

I connec to trough a cellular phone on USB.
It connects and for 2 minutes I can even log to a DX Cluster, then pppd dies
with error 15:
"Lack of LCP responses"

I have tryed some changes in the config file in /etc/ppp but no result.

Haw can I convince pppd to stay alive ?

Thanks for the help

73 de Pino ZP4KFX

