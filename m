From: Robert Thoelen <kd1zd@rtcubed.org>
Subject: Problems with nrattach
Date: Tue, 13 Apr 2010 21:59:13 -0400
Message-ID: <g2n83d6fb251004131859w55f96e8cga36a794e5b3cbc0f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

I'm having problems with nrattach and kernel 2.6.18.

I have done a modprobe netrom, and an lsmod shows the netrom module
linked to the ax25 module.

My nrports and nrbroadcast files are set up.

When I run nrattach, it says the nr0 port is assigned, but nothing
shows up in the ifconfig list. =A0Also, re-running nrattach shows it
trying to attach to nr0, indicating that the previous command did not
work.

I can't find any other error messages which would point me to what is
going wrong.

I'm using ax25-tools-0.0-10-rc2, and libax25-0.0.12-rc2.

Any suggestions on what could be going wrong?
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
