From: "B. Stienstra" <b.stienstra@xs4all.nl>
Subject: 6pack problem
Date: 23 Mar 2003 11:04:06 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1048413846.30392.25.camel@atlantic>
References: <003701c2f0a8$815f65c0$6400000a@gw.sp1lop.szczecin.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <003701c2f0a8$815f65c0$6400000a@gw.sp1lop.szczecin.pl>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello all,

I've recently bought a TNC2multi (www.tnc2multi.de). The eeprom consist
of a 6pack and tf2.7b firmware. You can switch between those two with a
jumper. Since i'm running linux, i thought 6pack would be the best
option. The problem is that the tnc stops running after a long while,
say 8 hours. The /var/log/messages file says: 
Mar 23 10:05:53 atlantic kernel: 6pack: resyncing TNC

After i disconnect the 12volt from the tnc and then reconnect it with
12v the /var/log/messages says:
Mar 23 10:06:18 atlantic kernel: 6pack: TNC found.

And the tnc is up and running. Does anyone know what the problem could
be? Below you can find my system info.

Kind regards,
Ben, PD2BS

--
PC: PIII, 866Mhz, 256MB mem
OS: RedHat Linux 8.0, kernel 2.4.21-pre4
TNC: TNC2multi (6pack/TF2.7b)
AX25 software: ax25-apps-0.0.6, ax25-tools-0.0.8, libax25-0.0.10








