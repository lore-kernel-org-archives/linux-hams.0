From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: PROBLEM: gMFSK v0.5 locks up.
Date: Sat, 12 Jul 2003 10:04:13 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F0FC0FD.5060307@pi8zaa.ampr.org>
References: <Pine.LNX.4.44.0304192044470.6051-100000@oh2bns.ampr.org> <20030420023708.GA22988@silly.cloud.net.au> <3F0F1E43.9030500@pi8zaa.ampr.org> <200307112325.24591.ailic@gmx.net> <3F0F3126.8030403@pi8zaa.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3F0F3126.8030403@pi8zaa.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,

Now that I've got gmfsk to compile, I run into another problem.

Until now I didn't get it to produce any sound yet. (sound works on that 
system. Other applications can use the sound card)

There are 2 ways that I can make gmfsk lock up.

1. click the "Abort transmission immediately" button.
2. click the "Mode" pull-down menu and try to select another mode.

There are no messages in /var/log/syslog and /var/log/messages
I'm using fftw-2.1.5, kernel 2.4.21 glibc-2.3.1 and all were compiled 
with gcc-3.2.3.

Any ideas? Can somebody point me in the right direction?

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org


