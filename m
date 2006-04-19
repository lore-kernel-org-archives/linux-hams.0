From: Jarmo <oh1mrr@nic.fi>
Subject: Re: Broadcasting unwanted UDP messages
Date: Wed, 19 Apr 2006 15:55:53 +0300
Message-ID: <200604191555.53320.oh1mrr@nic.fi>
References: <4445B27F.5050206@irock.com.au> <Pine.LNX.4.58.0604182049520.18174@wapiti.we7u.net> <0BEBA6C7-D164-4F4C-AEE9-EE7BF24C9741@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0BEBA6C7-D164-4F4C-AEE9-EE7BF24C9741@tssg.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams <linux-hams@vger.kernel.org>

John Ronan kirjoitti viestiss=E4=E4n (l=E4hetysaika keskiviikko, 19. hu=
htikuuta 2006=20
>          interfaces =3D 10.0.4.162
>          ^^^^^^^^^^^^^^^^^^^^
> [snip]
>
> Try that.

If you use 10 series subnet, you have change "remote announce" into 10.=
x.x.255
If 192 series something like below.

;   interfaces =3D 192.168.12.2/24 192.168.13.2/24
# *** merged from original smb.conf: ***
   interfaces =3D 192.168.0.1/24

# Configure remote browse list synchronisation here
#  request announcement to, or browse list sync from:
#       a specific host or from / to a whole subnet (see below)
;   remote browse sync =3D 192.168.3.25 192.168.5.255
# Cause this host to announce itself to local subnets here
;   remote announce =3D 192.168.1.255 192.168.2.44
# *** merged from original smb.conf: ***
   remote announce =3D 192.168.0.255

Jarmo


--=20
Linux is the answer.
What was your question?
(Brian Lane)
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
