From: "Dexy" <dexy@ihug.co.nz>
Subject: Compaq Presario 901AT / RedHat 8.0 hiccup
Date: Tue, 28 Jan 2003 22:35:47 +1300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <000b01c2c6b0$d5450810$94dfadcb@Cpq>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Greetings, all

   I tried Mandrake 6.5 on this machine, but couldn't get the screen to set
up.  Someone suggested newer linux, so I downloaded RH8 and made a bootable
CD install set.  The Disk 1 boots fine, but it only gets as far as the
partition check (bear with me, this was written down from the screen):

Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
ALI15X3: IDE controller on PCI bus 00 dev 80
PCI: No IRQ known for interrupt pin A of device 00:10.0. Please try using
pci=biosirq
ALI15X3: chipset revision 196
ALI15X3: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0x8080-0x8087, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0x8088-0x808f, BIOS settings: hdc:pio, hdd:pio
hda: FUJITSU MHR2020AT, ATA DISK drive
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
hdc: Compaq CRN-8245B, ATAPI CD/DVD-ROM drive
ide0 at 0x1f0-0x1f7, 0x3f6 on irq 14
ide1 at 0x170-0x177, 0x376 on irq 15
hda: 39070080 sectors (20004MB) w/2048KiB Cache, CHS=2432/255/63, (U)DMA
hdc: ATAPI 24x CD-ROM drive, 128KB Cache
Uniform CD-ROM driver Revision: 3.12
ide-floppy driver 0.99.newide
Partition check:
    hda:spurious 8259A interrupt: IRQ7

   (there is a pause at hda: then spurious... comes up)
   At this point the machine locks up, with the drive light lit.

   Using pci=biosirq (see line 4 above) makes no difference.  What is device
00:10.0?

   The partition it is checking is the default 18GB WinXP.  Is it actually
checking this?  I'd have thought it would be hda1, but it's only showing as
hda.  I've left the machine going for 1/2-hour, it surely would have checked
it by then if it was going to.

   IRQ7 is usually something to do with the // port, no?  Then why is it
happening during boot?  There's a facility do disable the port during boot,
but this makes no difference, nor does changing from Bi-dir to EPP to
EPP/ECP.

   Incidentally, the // port is the reason I'm trying linux - XP trashes it
as far as use for "Push to talk" for an Amateur Radio transciever, and
there's no Com port I can use :-(.  It works fine under 98se, but I can't
get screen drivers.

   Is there anyone out there who can give me tips on how to get this going?

Cheers
Dex ZL2DEX



