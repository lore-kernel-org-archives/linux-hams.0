From: "John Feist" <aa6qn@pacbell.net>
Subject: RE: Red Hat 9.0
Date: Tue, 17 Feb 2004 17:09:00 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <EEEFIEMENNJDPDJAIOOLOEPCCEAA.aa6qn@pacbell.net>
References: <E6B40EBA0E7B31449C3C565C8ED2F2A00130E415@spsrvr04.sp.gruposimoldes.pt>
Reply-To: <aa6qn@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <E6B40EBA0E7B31449C3C565C8ED2F2A00130E415@spsrvr04.sp.gruposimoldes.pt>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

After doing the Make Install, go to /boot/grub and edit grub.conf line for
kernel

kernel /boot/vmlinuz-2.4.23 ro root=/dev/sda1  (or what ever your boot drive
is)


AA6QN
-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org]On Behalf Of Cristiano Tavares
- SP
Sent: Monday, February 16, 2004 6:45 AM
To: linux-hams@vger.kernel.org
Subject: Red Hat 9.0


73's to you all.

I'm trying to use Red Hat 9.0 with ax25 but when I compile the kernel and
reboot it I get a error mesage saying that there is no root directory.

Can anyone help me get over this, please.

Cris
CT1FLZ

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

