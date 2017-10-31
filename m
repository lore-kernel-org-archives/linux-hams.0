From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Fw: [Bug 197169] New: duplicate packets
Date: Tue, 31 Oct 2017 21:52:42 +0100
Message-ID: <20171031215242.2cf3d29e@shemminger-XPS-13-9360>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=GLPdM7PLrorxbGW1NdGu3aoNQcVThNzCYQ44vlfiMSM=;
        b=Uvo6IiaDAINKiMqCHxbGZ0wuOM/hHje7R/KEWvmvrqaHSFejqzIy7w/Ie8K9uK5/87
         XmBYaxeSU0cZvUoO6SEtQCmpqyICRN3mlxh7OUSgD50vpVqXI7HKsgt1RAlMxTom0DGa
         uwy0YGKLrFXvLPz8NZmynoUMqFBzJYzWo5vPvEDG4VNiOcPOrvMFq08inlEtIu7Q05JV
         pfqUpD0iPLJAq2fKDk2yEzQ87SvCNTLwjWRRTgji0tZKlvE84/Zx0AGYr3MCFQvDQo5B
         /4Q63rfgPkDuw207SGlpiWOWK39GDGiDDM/aDlyyqw0UBZEFpkg3WJYgxWtspx6cXRh+
         hSsA==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-hams@vger.kernel.org, ralf@linux-mips.org

This showed up on Bugzilla for networking

Begin forwarded message:

Date: Mon, 09 Oct 2017 12:39:47 +0000
From: bugzilla-daemon@bugzilla.kernel.org
To: stephen@networkplumber.org
Subject: [Bug 197169] New: duplicate packets


https://bugzilla.kernel.org/show_bug.cgi?id=3D197169

            Bug ID: 197169
           Summary: duplicate packets
           Product: Networking
           Version: 2.5
    Kernel Version: 4.9.30
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Other
          Assignee: stephen@networkplumber.org
          Reporter: bpulk@s.gnet.hu
        Regression: No

all outgoing packets are duplicated on ax25 interface

steps to reproduce:

kissattach /dev/ttyS0 radio
ifconfig ax0 10.0.0.2
arp -H ax25 -s 10.0.0.111 TEST-0
tshark -i ax0
ping -c1 10.0.0.111           =20

root@debian:~# tshark -i ax0
Running as user "root" and group "root". This could be dangerous.
tshark: Lua: Error during loading:
 [string "/usr/share/wireshark/init.lua"]:44: dofile has been disabled due =
to
running Wireshark as superuser. See
https://wiki.wireshark.org/CaptureSetup/CapturePrivileges for help in runni=
ng
Wireshark as an unprivileged user.
Capturing on 'ax0'

    1 0.000000000     10.0.0.2 =E2=86=92 10.0.0.111   ICMP 101 Echo (ping) =
request=20
id=3D0x11a4, seq=3D1/256, ttl=3D64
    2 0.000005518     10.0.0.2 =E2=86=92 10.0.0.111   ICMP 101 Echo (ping) =
request=20
id=3D0x11a4, seq=3D1/256, ttl=3D64

--=20
You are receiving this mail because:
You are the assignee for the bug.
