From: Robert Thoelen <kd1zd@rtcubed.org>
Subject: Question with axudp
Date: Tue, 5 Jul 2011 19:30:55 -0400
Message-ID: <CAAynhLMhGVDiVsAugsWSOLTRkrw6OeXRYeyKJEdUVaHMmE0rZQ@mail.gmail.com>
References: <CAAynhLOuj2DTQur_ixt2QoeLRK0oa0aOAVYXXPVeRkXNqHq5+g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CAAynhLOuj2DTQur_ixt2QoeLRK0oa0aOAVYXXPVeRkXNqHq5+g@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

I have a system running UROnode, and I have a couple of internet
links.=A0 I want to create a virtual machine in a data center to run
UROnode and have my internet axudp links connect to that system.
Then, I can use one connection from my home station via axudp to
connect to the virtual machine.=A0 The purpose behind this is among
other reasons to keep netrom broadcasts from cluttering my RF node.

Anyway, the virtual machine seems to be working well and is
broadcasting its netrom node to the home system.=A0=A0 I'm having troub=
le
getting the home system to send packets back to the virtual machine.

My question is:=A0 if I use a few ssids with my callsign, will that
cause ax25ipd from routing another ssid with my call?=A0 The virtual
machine is kd1zd-9, and the home system uses kd1zd-3 to kd1zd-7.

What could be causing the home system to not send packets out to the
virtual machine?=A0 The other axudp links in the .conf file work fine.

Thanks,
Bob
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
