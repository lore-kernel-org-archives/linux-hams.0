From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: Re: Request change ???
Date: Wed, 9 Jul 2003 19:18:45 +0200 (CEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0307091916160.8812-100000@zoef.pe1icq.ampr.org>
References: <001101c345e4$3c5be020$2a01a8c0@p3>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001101c345e4$3c5be020$2a01a8c0@p3>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ronald Jochems <pd1acf@xs4all.nl>
Cc: Jeroen Vreeken <pe1rxq@amsat.org>, Ralf Baechle DO1GRB <ralf@linux-mips.org>, linux-hams@vger.kernel.org

On Wed, 9 Jul 2003, Ronald Jochems wrote:

> All,
>
> I'm not sure if this is the 'right' way/group to ask, but here is my
> question. It is related to the AX25 kernel i believe.
>
> Please see below examples, my question is about the 'statistical'
> information wich is 'new' in i believe 2.4 kernels.
> The total ammount of packets is translated in complete bytes transmitted,
> and received.
> With the current Z8530 SCC driver these statistics are not calculated.
> For ethernet cards they are calculated.
>
> Is there a way to make this work ? I guess it is a driver issue ???
>

It must be in the driver. I have those statistics displayed for my dmascc
ports but not for the scc ports.

dmascc0   Link encap:AMPR AX.25  HWaddr PE1ICQ-3
          inet addr:44.137.25.18  Mask:255.255.255.255
          UP RUNNING  MTU:1500  Metric:1
          RX packets:65 errors:0 dropped:0 overruns:0 frame:0
          TX packets:78598 errors:0 dropped:0 overruns:0 carrier:0
          collisions:58762 txqueuelen:64
          RX bytes:2835 (2.7 Kb)  TX bytes:3615508 (3.4 Mb)
          Interrupt:7 Base address:0x210

scc0      Link encap:AMPR AX.25  HWaddr PE1ICQ-7
          inet addr:44.137.24.162  Mask:255.255.255.255
          UP RUNNING  MTU:1500  Metric:1
          RX packets:3027370 errors:4790988 dropped:0 overruns:0 frame:0
          TX packets:630643 errors:5 dropped:0 overruns:5 carrier:0
          collisions:0 txqueuelen:16
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)


73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org

