From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: nr0 doesn't show up (netrom)
Date: Mon, 30 Nov 2009 13:13:08 -0800
Message-ID: <4B143564.2060206@junglevision.com>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org> <4B142D5A.7010803@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4B142D5A.7010803@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

A little bit more information.

I can bring up a nr0 device by doing

/sbin/ifconfig nr0 up 192.168.0.10

But any attempts to set the hardware address fail.

/sbin/ifconfig nr0 hw ax25 KE6I-10 192.168.0.10

Give me

SIOCSIFHWADDR: Invalid argument


I don't think it works this way, because netromd then
tells me "no NET/ROM ports defined"
