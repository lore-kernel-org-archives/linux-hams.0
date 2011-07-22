From: f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH 0/7] ROSE: Misc fixes
Date: Fri, 22 Jul 2011 18:12:50 +0200
Message-ID: <4E29A182.4020102@free.fr>
References: <cover.1311152437.git.ralf@linux-mips.org> <4E270D35.9070306@free.fr> <20110720175950.GA13753@linux-mips.org> <4E293E96.3030708@free.fr> <20110722105641.GA24477@linux-mips.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000202030501000603090109"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20110722105641.GA24477@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------000202030501000603090109
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Le 22/07/2011 12:56, Ralf Baechle DL5RB a =E9crit :
> On Fri, Jul 22, 2011 at 11:10:46AM +0200, Bernard, f6bvp wrote:
>
>> Replacement patch applied and install went fine.
>> Nearly 24 hours after running the new "atomic" rose code
>> on two systems, I observe that 'use' parameter is 0, something I
>> never observed before. It used to be positive on some link and
>> rarely
>> displaying a high number meaning underflow negative values.
>>
>>> /proc/net/rose_neigh
>>> addr  callsign  dev  count use mode restart  t0  tf digipeaters
>>> 00020 F6BVP-5   ax0      1   0  DTE      no   0   0
>>> 00019 F6BVP-7   ax0      2   0  DTE      no   0   0
>>> 00018 F6BVP-9   ax2      2   0  DTE      no   0   0
>>> 00017 F3KT-11   ax0      3   0  DTE     yes   0   0
>>> 00016 F8COJ-11  ax0      2   0  DCE     yes   0   0
>>> 00015 F6GGY-9   ax0      3   0  DTE      no   0   0
>>> 00014 F4BWT-11  ax0      4   0  DTE      no   0   0
>>> 00013 F1MVP-5   ax0      2   0  DTE      no   0   0
>>> 00012 F5KBW-9   ax0      6   0  DTE      no   0   0
>>> 00011 IR5AG-13  ax0      2   0  DTE      no   0   0
>>> 00010 K4GBB-9   ax0      4   0  DCE     yes   0   0
>>> 00009 KD4YAL-9  ax0      2   0  DTE      no   0   0
>>> 00008 KP4DJT-9  ax0      3   0  DTE     yes   0   0
>>> 00007 P43L-4    ax0      5   0  DCE     yes   0   0
>>> 00006 VK2XB-2   ax0      2   0  DTE      no   0   0
>>> 00005 VK2TV-2   ax0      2   0  DTE      no   0   0
>>> 00004 VK7HDM-5  ax0      2   0  DTE      no   0   0
>>> 00003 YN1BBS-9  ax0      5   0  DTE      no   0   0
>>> 00002 TI2HAS-9  ax0      5   0  DTE      no   0   0
>>> 00001 RSLOOP-0  ???      1   2  DCE     yes   0   0
>> I guess this is a pretty good thing.
>>
>> I will try removing rose module and report if any progress
>> on that point too.
> Most excellent!  Take  your time for testing - unfortunately we missed
> the v3.0 train already but it would be great if we could backport these
> fixes to -stable after some more positive testing.
>
> Is the system that was having these issues btw. running a preemptable ker=
nel
> or does it have multiple cores or hyperthreading?
>
> Thanks,
>
>    Ralf
On one Linux box system I have a dual core CPU and kernel was compiled=20
with Symmetric multi-processing support.
[*] Symmetric multi-processing support
However I am booting kernel with maxcpus=3D1 in order to keep this test=20
system as "simple" as possible.
As I am not sure if that may influence hyperthreading or not I attach=20
here info.log file displaying my last boot log.
I did not enabled Hyperthreading
[ ] SMT (Hyperthreading) scheduler support and
(X) No Forced Preemption (Server)
This one shows the new 0 value for use parameter except for RSLOOP-0 as=20
shown previously.


On my other Linux box there is an Intel Core 2 CPU and kernel was also=20
compiled with SMP support, no SMT hyperthreading,
Multi-core scheduler support enabled and Voluntary Kernel Preemption=20
(Desktop) enabled.
This one has no special boot instructions, and thus runs with two CPUs=20
enabled
and /proc/net/rose_neigh table also shows use parameter =3D 0 except for=20
RSLOOP-0.


Bernard


--------------000202030501000603090109
Content-Type: text/plain;
 name="info.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="info.log"

  /var/log/kernel/info.log

Jul 20 22:04:06 f6bvp-11 kernel: imklog 4.6.2, log source = /proc/kmsg started.
Jul 20 22:04:06 f6bvp-11 kernel: Initializing cgroup subsys cpuset
Jul 20 22:04:06 f6bvp-11 kernel: Linux version 2.6.39.3 (root@f6bvp-10) (gcc version 4.4.3 (GCC) ) #4 SMP Mon Jul 11 18:27:23 CEST 2011
Jul 20 22:04:06 f6bvp-11 kernel: Command line: BOOT_IMAGE=2.6.39.3 root=UUID=2a98cbcc-9db7-442c-a308-fc1a37dc693e pci=use_crs maxcpus=1 splash=silent resume=UUID=fbb4a76a-7d96-465a-bcf3-54b42027a836 vga=788
Jul 20 22:04:06 f6bvp-11 kernel: BIOS-provided physical RAM map:
Jul 20 22:04:06 f6bvp-11 kernel: BIOS-e820: 0000000000000000 - 000000000009f000 (usable)
Jul 20 22:04:06 f6bvp-11 kernel: BIOS-e820: 000000000009f000 - 00000000000a0000 (reserved)
Jul 20 22:04:06 f6bvp-11 kernel: BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
Jul 20 22:04:06 f6bvp-11 kernel: BIOS-e820: 0000000000100000 - 000000007fee0000 (usable)
Jul 20 22:04:06 f6bvp-11 kernel: BIOS-e820: 000000007fee0000 - 000000007fee3000 (ACPI NVS)
Jul 20 22:04:06 f6bvp-11 kernel: BIOS-e820: 000000007fee3000 - 000000007fef0000 (ACPI data)
Jul 20 22:04:06 f6bvp-11 kernel: BIOS-e820: 00000000e0000000 - 00000000f0000000 (reserved)
Jul 20 22:04:06 f6bvp-11 kernel: BIOS-e820: 00000000fec00000 - 0000000100000000 (reserved)
Jul 20 22:04:06 f6bvp-11 kernel: NX (Execute Disable) protection: active
Jul 20 22:04:06 f6bvp-11 kernel: DMI 2.3 present.
Jul 20 22:04:06 f6bvp-11 kernel: DMI: MICRO-STAR INTERNATIONAL CO., LTD MS-7258/MS-7258, BIOS V3.9 07/16/2007
Jul 20 22:04:06 f6bvp-11 kernel: e820 update range: 0000000000000000 - 0000000000010000 (usable) ==> (reserved)
Jul 20 22:04:06 f6bvp-11 kernel: e820 remove range: 00000000000a0000 - 0000000000100000 (usable)
Jul 20 22:04:06 f6bvp-11 kernel: last_pfn = 0x7fee0 max_arch_pfn = 0x400000000
Jul 20 22:04:06 f6bvp-11 kernel: MTRR default type: uncachable
Jul 20 22:04:06 f6bvp-11 kernel: MTRR fixed ranges enabled:
Jul 20 22:04:06 f6bvp-11 kernel:  00000-9FFFF write-back
Jul 20 22:04:06 f6bvp-11 kernel:  A0000-BFFFF uncachable
Jul 20 22:04:06 f6bvp-11 kernel:  C0000-CDFFF write-protect
Jul 20 22:04:06 f6bvp-11 kernel:  CE000-EFFFF uncachable
Jul 20 22:04:06 f6bvp-11 kernel:  F0000-F7FFF write-through
Jul 20 22:04:06 f6bvp-11 kernel:  F8000-F8FFF uncachable
Jul 20 22:04:06 f6bvp-11 kernel:  F9000-FFFFF write-through
Jul 20 22:04:06 f6bvp-11 kernel: MTRR variable ranges enabled:
Jul 20 22:04:06 f6bvp-11 kernel:  0 base 000000000 mask F80000000 write-back
Jul 20 22:04:06 f6bvp-11 kernel:  1 base 0D0000000 mask FF8000000 write-combining
Jul 20 22:04:06 f6bvp-11 kernel:  2 base 07FF00000 mask FFFF00000 uncachable
Jul 20 22:04:06 f6bvp-11 kernel:  3 disabled
Jul 20 22:04:06 f6bvp-11 kernel:  4 disabled
Jul 20 22:04:06 f6bvp-11 kernel:  5 disabled
Jul 20 22:04:06 f6bvp-11 kernel:  6 disabled
Jul 20 22:04:06 f6bvp-11 kernel:  7 disabled
Jul 20 22:04:06 f6bvp-11 kernel: x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
Jul 20 22:04:06 f6bvp-11 kernel: found SMP MP-table at [ffff8800000f39c0] f39c0
Jul 20 22:04:06 f6bvp-11 kernel: initial memory mapped : 0 - 20000000
Jul 20 22:04:06 f6bvp-11 kernel: Base memory trampoline at [ffff88000009a000] 9a000 size 20480
Jul 20 22:04:06 f6bvp-11 kernel: init_memory_mapping: 0000000000000000-000000007fee0000
Jul 20 22:04:06 f6bvp-11 kernel: 0000000000 - 007fe00000 page 2M
Jul 20 22:04:06 f6bvp-11 kernel: 007fe00000 - 007fee0000 page 4k
Jul 20 22:04:06 f6bvp-11 kernel: kernel direct mapping tables up to 7fee0000 @ 7fedc000-7fee0000
Jul 20 22:04:06 f6bvp-11 kernel: RAMDISK: 37ab4000 - 37ff0000
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: Local APIC address 0xfee00000
Jul 20 22:04:06 f6bvp-11 kernel: No NUMA configuration found
Jul 20 22:04:06 f6bvp-11 kernel: Faking a node at 0000000000000000-000000007fee0000
Jul 20 22:04:06 f6bvp-11 kernel: NUMA: Using 63 for the hash shift.
Jul 20 22:04:06 f6bvp-11 kernel: Initmem setup node 0 0000000000000000-000000007fee0000
Jul 20 22:04:06 f6bvp-11 kernel:  NODE_DATA [000000007fed7000 - 000000007fedbfff]
Jul 20 22:04:06 f6bvp-11 kernel: [ffffea0000000000-ffffea0001bfffff] PMD -> [ffff88007d600000-ffff88007f1fffff] on node 0
Jul 20 22:04:06 f6bvp-11 kernel: On node 0 totalpages: 523887
Jul 20 22:04:06 f6bvp-11 kernel:  DMA zone: 56 pages used for memmap
Jul 20 22:04:06 f6bvp-11 kernel:  DMA zone: 5 pages reserved
Jul 20 22:04:06 f6bvp-11 kernel:  DMA zone: 3922 pages, LIFO batch:0
Jul 20 22:04:06 f6bvp-11 kernel:  DMA32 zone: 7109 pages used for memmap
Jul 20 22:04:06 f6bvp-11 kernel:  DMA32 zone: 512795 pages, LIFO batch:31
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PM-Timer IO Port: 0x408
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: Local APIC address 0xfee00000
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] disabled)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: LAPIC (acpi_id[0x03] lapic_id[0x03] disabled)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: IOAPIC (id[0x04] address[0xfec00000] gsi_base[0])
Jul 20 22:04:06 f6bvp-11 kernel: IOAPIC[0]: apic_id 4, version 3, address 0xfec00000, GSI 0-23
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: IOAPIC (id[0x05] address[0xfecc0000] gsi_base[24])
Jul 20 22:04:06 f6bvp-11 kernel: IOAPIC[1]: apic_id 5, version 3, address 0xfecc0000, GSI 24-47
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: IRQ0 used by override.
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: IRQ2 used by override.
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: IRQ9 used by override.
Jul 20 22:04:06 f6bvp-11 kernel: Using ACPI (MADT) for SMP configuration information
Jul 20 22:04:06 f6bvp-11 kernel: SMP: Allowing 4 CPUs, 2 hotplug CPUs
Jul 20 22:04:06 f6bvp-11 kernel: nr_irqs_gsi: 64
Jul 20 22:04:06 f6bvp-11 kernel: PM: Registered nosave memory: 000000000009f000 - 00000000000a0000
Jul 20 22:04:06 f6bvp-11 kernel: PM: Registered nosave memory: 00000000000a0000 - 00000000000f0000
Jul 20 22:04:06 f6bvp-11 kernel: PM: Registered nosave memory: 00000000000f0000 - 0000000000100000
Jul 20 22:04:06 f6bvp-11 kernel: Allocating PCI resources starting at 7fef0000 (gap: 7fef0000:60110000)
Jul 20 22:04:06 f6bvp-11 kernel: Booting paravirtualized kernel on bare hardware
Jul 20 22:04:06 f6bvp-11 kernel: setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:4 nr_node_ids:1
Jul 20 22:04:06 f6bvp-11 kernel: PERCPU: Embedded 28 pages/cpu @ffff88007fc00000 s82240 r8192 d24256 u524288
Jul 20 22:04:06 f6bvp-11 kernel: pcpu-alloc: s82240 r8192 d24256 u524288 alloc=1*2097152
Jul 20 22:04:06 f6bvp-11 kernel: pcpu-alloc: [0] 0 1 2 3 
Jul 20 22:04:06 f6bvp-11 kernel: Kernel command line: BOOT_IMAGE=2.6.39.3 root=UUID=2a98cbcc-9db7-442c-a308-fc1a37dc693e pci=use_crs maxcpus=1 splash=silent resume=UUID=fbb4a76a-7d96-465a-bcf3-54b42027a836 vga=788
Jul 20 22:04:06 f6bvp-11 kernel: PID hash table entries: 4096 (order: 3, 32768 bytes)
Jul 20 22:04:06 f6bvp-11 kernel: Memory: 2053524k/2096000k available (3975k kernel code, 452k absent, 42024k reserved, 2039k data, 632k init)
Jul 20 22:04:06 f6bvp-11 kernel: SLUB: Genslabs=15, HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
Jul 20 22:04:06 f6bvp-11 kernel: Hierarchical RCU implementation.
Jul 20 22:04:06 f6bvp-11 kernel: 	RCU-based detection of stalled CPUs is disabled.
Jul 20 22:04:06 f6bvp-11 kernel: NR_IRQS:512
Jul 20 22:04:06 f6bvp-11 kernel: Console: colour dummy device 80x25
Jul 20 22:04:06 f6bvp-11 kernel: console [tty0] enabled
Jul 20 22:04:06 f6bvp-11 kernel: Calibrating delay loop (skipped), value calculated using timer frequency.. 4388.58 BogoMIPS (lpj=8777160)
Jul 20 22:04:06 f6bvp-11 kernel: pid_max: default: 32768 minimum: 301
Jul 20 22:04:06 f6bvp-11 kernel: Security Framework initialized
Jul 20 22:04:06 f6bvp-11 kernel: Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Jul 20 22:04:06 f6bvp-11 kernel: Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Jul 20 22:04:06 f6bvp-11 kernel: Mount-cache hash table entries: 256
Jul 20 22:04:06 f6bvp-11 kernel: Initializing cgroup subsys ns
Jul 20 22:04:06 f6bvp-11 kernel: Initializing cgroup subsys cpuacct
Jul 20 22:04:06 f6bvp-11 kernel: CPU: Physical Processor ID: 0
Jul 20 22:04:06 f6bvp-11 kernel: CPU: Processor Core ID: 0
Jul 20 22:04:06 f6bvp-11 kernel: mce: CPU supports 6 MCE banks
Jul 20 22:04:06 f6bvp-11 kernel: CPU0: Thermal monitoring enabled (TM1)
Jul 20 22:04:06 f6bvp-11 kernel: using mwait in idle threads.
Jul 20 22:04:06 f6bvp-11 kernel: SMP alternatives: switching to UP code
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: Core revision 20110316
Jul 20 22:04:06 f6bvp-11 kernel: Setting APIC routing to flat
Jul 20 22:04:06 f6bvp-11 kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
Jul 20 22:04:06 f6bvp-11 kernel: CPU0: Intel(R) Core(TM)2 Duo CPU     E4500  @ 2.20GHz stepping 0d
Jul 20 22:04:06 f6bvp-11 kernel: Performance Events: PEBS fmt0+, Core2 events, Intel PMU driver.
Jul 20 22:04:06 f6bvp-11 kernel: ... version:                2
Jul 20 22:04:06 f6bvp-11 kernel: ... bit width:              40
Jul 20 22:04:06 f6bvp-11 kernel: ... generic registers:      2
Jul 20 22:04:06 f6bvp-11 kernel: ... value mask:             000000ffffffffff
Jul 20 22:04:06 f6bvp-11 kernel: ... max period:             000000007fffffff
Jul 20 22:04:06 f6bvp-11 kernel: ... fixed-purpose events:   3
Jul 20 22:04:06 f6bvp-11 kernel: ... event mask:             0000000700000003
Jul 20 22:04:06 f6bvp-11 kernel: Brought up 1 CPUs
Jul 20 22:04:06 f6bvp-11 kernel: Total of 1 processors activated (4388.58 BogoMIPS).
Jul 20 22:04:06 f6bvp-11 kernel: PM: Registering ACPI NVS region at 7fee0000 (12288 bytes)
Jul 20 22:04:06 f6bvp-11 kernel: NET: Registered protocol family 16
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: bus type pci registered
Jul 20 22:04:06 f6bvp-11 kernel: PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
Jul 20 22:04:06 f6bvp-11 kernel: PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
Jul 20 22:04:06 f6bvp-11 kernel: PCI: Using configuration type 1 for base access
Jul 20 22:04:06 f6bvp-11 kernel: bio: create slab <bio-0> at 0
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: EC: Look up EC in DSDT
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: Interpreter enabled
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: (supports S0 S1 S4 S5)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: Using IOAPIC for interrupt routing
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: No dock devices found.
Jul 20 22:04:06 f6bvp-11 kernel: PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
Jul 20 22:04:06 f6bvp-11 kernel: pci_root PNP0A08:00: host bridge window [io  0x0000-0x0cf7]
Jul 20 22:04:06 f6bvp-11 kernel: pci_root PNP0A08:00: host bridge window [io  0x0d00-0xffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_root PNP0A08:00: host bridge window [mem 0x000a0000-0x000bffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_root PNP0A08:00: host bridge window [mem 0x000c0000-0x000dffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_root PNP0A08:00: host bridge window [mem 0x7ff00000-0xfebfffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:00.0: [1106:0327] type 0 class 0x000600
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:00.0: reg 10: [mem 0xd0000000-0xd7ffffff pref]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:00.1: [1106:1327] type 0 class 0x000600
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:00.2: [1106:2327] type 0 class 0x000600
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:00.3: [1106:3327] type 0 class 0x000600
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:00.4: [1106:4327] type 0 class 0x000600
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:00.5: [1106:5327] type 0 class 0x000800
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:00.6: [1106:6327] type 0 class 0x000600
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:00.7: [1106:7327] type 0 class 0x000600
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:01.0: [1106:b198] type 1 class 0x000604
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0: [1106:a327] type 1 class 0x000604
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0: PME# supported from D0 D3hot D3cold
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0: PME# disabled
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0: [1106:c327] type 1 class 0x000604
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0: PME# supported from D0 D3hot D3cold
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0: PME# disabled
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0b.0: [10ec:8139] type 0 class 0x000200
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0b.0: reg 10: [io  0xfc00-0xfcff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0b.0: reg 14: [mem 0xdffff000-0xdffff0ff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0b.0: supports D1 D2
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0b.0: PME# supported from D1 D2 D3hot D3cold
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0b.0: PME# disabled
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0f.0: [1106:3149] type 0 class 0x000101
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0f.0: reg 10: [io  0xf800-0xf807]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0f.0: reg 14: [io  0xf400-0xf403]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0f.0: reg 18: [io  0xf000-0xf007]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0f.0: reg 1c: [io  0xec00-0xec03]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0f.0: reg 20: [io  0xe800-0xe80f]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0f.0: reg 24: [io  0xe400-0xe4ff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0f.1: [1106:0571] type 0 class 0x000101
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:0f.1: reg 20: [io  0xe000-0xe00f]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.0: [1106:3038] type 0 class 0x000c03
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.0: reg 20: [io  0xdc00-0xdc1f]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.0: supports D1 D2
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.0: PME# supported from D0 D1 D2 D3hot D3cold
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.0: PME# disabled
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.1: [1106:3038] type 0 class 0x000c03
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.1: reg 20: [io  0xd800-0xd81f]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.1: supports D1 D2
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.1: PME# supported from D0 D1 D2 D3hot D3cold
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.1: PME# disabled
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.2: [1106:3038] type 0 class 0x000c03
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.2: reg 20: [io  0xd400-0xd41f]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.2: supports D1 D2
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.2: PME# supported from D0 D1 D2 D3hot D3cold
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.2: PME# disabled
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.3: [1106:3038] type 0 class 0x000c03
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.3: reg 20: [io  0xd000-0xd01f]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.3: supports D1 D2
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.3: PME# supported from D0 D1 D2 D3hot D3cold
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.3: PME# disabled
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.4: [1106:3104] type 0 class 0x000c03
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.4: reg 10: [mem 0xdfffe000-0xdfffe0ff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.4: supports D1 D2
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.4: PME# supported from D0 D1 D2 D3hot D3cold
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:10.4: PME# disabled
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:11.0: [1106:3227] type 0 class 0x000601
Jul 20 22:04:06 f6bvp-11 kernel: HPET not enabled in BIOS. You might try hpet=force boot option
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:11.5: [1106:3059] type 0 class 0x000401
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:11.5: reg 10: [io  0xcc00-0xccff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:11.5: supports D1 D2
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:01.0: PCI bridge to [bus 01-01]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:01.0:   bridge window [io  0x9000-0x9fff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:01.0:   bridge window [mem 0xdfc00000-0xdfcfffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:01.0:   bridge window [mem 0xdfb00000-0xdfbfffff pref]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:02:00.0: [10de:0392] type 0 class 0x000300
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:02:00.0: reg 10: [mem 0xdc000000-0xdcffffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:02:00.0: reg 14: [mem 0xc0000000-0xcfffffff 64bit pref]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:02:00.0: reg 1c: [mem 0xdd000000-0xddffffff 64bit]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:02:00.0: reg 24: [io  0xbc00-0xbc7f]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:02:00.0: reg 30: [mem 0x00000000-0x0001ffff pref]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:02:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0: PCI bridge to [bus 02-02]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0:   bridge window [io  0xb000-0xbfff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0:   bridge window [mem 0xdc000000-0xdeffffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0:   bridge window [mem 0xc0000000-0xcfffffff 64bit pref]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0: PCI bridge to [bus 03-03]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0:   bridge window [io  0xa000-0xafff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0:   bridge window [mem 0xdfe00000-0xdfefffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0:   bridge window [mem 0xdfd00000-0xdfdfffff 64bit pref]
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEXG._PRT]
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX0._PRT]
Jul 20 22:04:06 f6bvp-11 kernel: pci0000:00: Requesting ACPI _OSC control (0x1d)
Jul 20 22:04:06 f6bvp-11 kernel: Unable to assume _OSC PCIe control. Disabling ASPM
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 6 7 *10 11 12)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 6 7 10 *11 12)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 6 7 10 *11 12)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 6 7 10 11 12) *0, disabled.
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 6 7 10 11 12) *0, disabled.
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 6 7 10 11 12) *0
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [LNK0] (IRQs 3 4 6 7 10 11 12) *0, disabled.
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [LNK1] (IRQs 3 4 6 7 10 11 12) *5
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [ALKA] (IRQs *20)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [ALKB] (IRQs *21)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [ALKC] (IRQs *22)
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: PCI Interrupt Link [ALKD] (IRQs *23), disabled.
Jul 20 22:04:06 f6bvp-11 kernel: vgaarb: device added: PCI:0000:02:00.0,decodes=io+mem,owns=io+mem,locks=none
Jul 20 22:04:06 f6bvp-11 kernel: vgaarb: loaded
Jul 20 22:04:06 f6bvp-11 kernel: PCI: Using ACPI for IRQ routing
Jul 20 22:04:06 f6bvp-11 kernel: PCI: pci_cache_line_size set to 64 bytes
Jul 20 22:04:06 f6bvp-11 kernel: reserve RAM buffer: 000000000009f000 - 000000000009ffff 
Jul 20 22:04:06 f6bvp-11 kernel: reserve RAM buffer: 000000007fee0000 - 000000007fffffff 
Jul 20 22:04:06 f6bvp-11 kernel: NetLabel: Initializing
Jul 20 22:04:06 f6bvp-11 kernel: NetLabel:  domain hash size = 128
Jul 20 22:04:06 f6bvp-11 kernel: NetLabel:  protocols = UNLABELED CIPSOv4
Jul 20 22:04:06 f6bvp-11 kernel: NetLabel:  unlabeled traffic allowed by default
Jul 20 22:04:06 f6bvp-11 kernel: pnp: PnP ACPI init
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: bus type pnp registered
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:00: [bus 00-ff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:00: [io  0x0cf8-0x0cff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:00: [io  0x0000-0x0cf7 window]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:00: [io  0x0d00-0xffff window]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:00: [mem 0x000a0000-0x000bffff window]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:00: [mem 0x000c0000-0x000dffff window]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:00: [mem 0x7ff00000-0xfebfffff window]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:00: Plug and Play ACPI device, IDs PNP0a08 PNP0a03 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:01: [io  0x0400-0x047f]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:01: [io  0x0500-0x050f]
Jul 20 22:04:06 f6bvp-11 kernel: system 00:01: [io  0x0400-0x047f] has been reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:01: [io  0x0500-0x050f] has been reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x0010-0x001f]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x0022-0x003f]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x0044-0x005f]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x0062-0x0063]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x0065-0x006f]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x0074-0x007f]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x0091-0x0093]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x00a2-0x00bf]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x00e0-0x00ef]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x04d0-0x04d1]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x0290-0x0297]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:02: [io  0x0880-0x088f]
Jul 20 22:04:06 f6bvp-11 kernel: system 00:02: [io  0x04d0-0x04d1] has been reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:02: [io  0x0290-0x0297] has been reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:02: [io  0x0880-0x088f] has been reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:03: [dma 4]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:03: [io  0x0000-0x000f]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:03: [io  0x0080-0x0090]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:03: [io  0x0094-0x009f]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:03: [io  0x00c0-0x00df]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:03: Plug and Play ACPI device, IDs PNP0200 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:04: [io  0x0070-0x0073]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:04: [irq 8]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:04: Plug and Play ACPI device, IDs PNP0b00 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:05: [io  0x0061]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:05: Plug and Play ACPI device, IDs PNP0800 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:06: [io  0x00f0-0x00ff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:06: [irq 13]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:06: Plug and Play ACPI device, IDs PNP0c04 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:07: [io  0x03f0-0x03f5]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:07: [io  0x03f7]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:07: [irq 6]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:07: [dma 2]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:07: Plug and Play ACPI device, IDs PNP0700 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:08: [io  0x03f8-0x03ff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:08: [irq 4]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:08: Plug and Play ACPI device, IDs PNP0501 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:09: [io  0x02f8-0x02ff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:09: [irq 3]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:09: Plug and Play ACPI device, IDs PNP0501 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0a: [io  0x0378-0x037f]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0a: [io  0x0778-0x077b]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0a: [irq 7]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0a: Plug and Play ACPI device, IDs PNP0400 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0b: [irq 12]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0b: Plug and Play ACPI device, IDs PNP0f13 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0c: [io  0x0060]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0c: [io  0x0064]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0c: [irq 1]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0c: Plug and Play ACPI device, IDs PNP0303 PNP030b (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0d: [mem 0xe0000000-0xefffffff]
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0d: [mem 0xe0000000-0xefffffff] has been reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0d: Plug and Play ACPI device, IDs PNP0c02 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0e: [mem 0x000cec00-0x000cffff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0e: [mem 0x000f0000-0x000f7fff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0e: [mem 0x000f8000-0x000fbfff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0e: [mem 0x000fc000-0x000fffff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0e: [mem 0x7fee0000-0x7fefffff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0e: [mem 0xffff0000-0xffffffff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0e: [mem 0x00000000-0x0009ffff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0e: [mem 0x00100000-0x7fedffff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0e: [mem 0xfec00000-0xfec00fff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0e: [mem 0xfee00000-0xfee00fff]
Jul 20 22:04:06 f6bvp-11 kernel: pnp 00:0e: [mem 0xfff80000-0xfffeffff]
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: [mem 0x000cec00-0x000cffff] has been reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: [mem 0x000f0000-0x000f7fff] could not be reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: [mem 0x000f8000-0x000fbfff] could not be reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: [mem 0x000fc000-0x000fffff] could not be reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: [mem 0x7fee0000-0x7fefffff] could not be reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: [mem 0xffff0000-0xffffffff] has been reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: [mem 0x00000000-0x0009ffff] could not be reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: [mem 0x00100000-0x7fedffff] could not be reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: [mem 0xfec00000-0xfec00fff] could not be reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: [mem 0xfee00000-0xfee00fff] has been reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: [mem 0xfff80000-0xfffeffff] has been reserved
Jul 20 22:04:06 f6bvp-11 kernel: system 00:0e: Plug and Play ACPI device, IDs PNP0c01 (active)
Jul 20 22:04:06 f6bvp-11 kernel: pnp: PnP ACPI: found 15 devices
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: ACPI bus type pnp unregistered
Jul 20 22:04:06 f6bvp-11 kernel: Switching to clocksource acpi_pm
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:01.0: PCI bridge to [bus 01-01]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:01.0:   bridge window [io  0x9000-0x9fff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:01.0:   bridge window [mem 0xdfc00000-0xdfcfffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:01.0:   bridge window [mem 0xdfb00000-0xdfbfffff pref]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:02:00.0: BAR 6: assigned [mem 0xde000000-0xde01ffff pref]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0: PCI bridge to [bus 02-02]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0:   bridge window [io  0xb000-0xbfff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0:   bridge window [mem 0xdc000000-0xdeffffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0:   bridge window [mem 0xc0000000-0xcfffffff 64bit pref]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0: PCI bridge to [bus 03-03]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0:   bridge window [io  0xa000-0xafff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0:   bridge window [mem 0xdfe00000-0xdfefffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0:   bridge window [mem 0xdfd00000-0xdfdfffff 64bit pref]
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:01.0: setting latency timer to 64
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0: PCI INT A -> GSI 27 (level, low) -> IRQ 27
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:02.0: setting latency timer to 64
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0: PCI INT A -> GSI 31 (level, low) -> IRQ 31
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:03.0: setting latency timer to 64
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000dffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:00: resource 8 [mem 0x7ff00000-0xfebfffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:01: resource 0 [io  0x9000-0x9fff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:01: resource 1 [mem 0xdfc00000-0xdfcfffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:01: resource 2 [mem 0xdfb00000-0xdfbfffff pref]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:02: resource 0 [io  0xb000-0xbfff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:02: resource 1 [mem 0xdc000000-0xdeffffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:02: resource 2 [mem 0xc0000000-0xcfffffff 64bit pref]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:03: resource 0 [io  0xa000-0xafff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:03: resource 1 [mem 0xdfe00000-0xdfefffff]
Jul 20 22:04:06 f6bvp-11 kernel: pci_bus 0000:03: resource 2 [mem 0xdfd00000-0xdfdfffff 64bit pref]
Jul 20 22:04:06 f6bvp-11 kernel: NET: Registered protocol family 2
Jul 20 22:04:06 f6bvp-11 kernel: IP route cache hash table entries: 65536 (order: 7, 524288 bytes)
Jul 20 22:04:06 f6bvp-11 kernel: TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
Jul 20 22:04:06 f6bvp-11 kernel: Switched to NOHz mode on CPU #0
Jul 20 22:04:06 f6bvp-11 kernel: TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
Jul 20 22:04:06 f6bvp-11 kernel: TCP: Hash tables configured (established 262144 bind 65536)
Jul 20 22:04:06 f6bvp-11 kernel: TCP reno registered
Jul 20 22:04:06 f6bvp-11 kernel: UDP hash table entries: 1024 (order: 3, 32768 bytes)
Jul 20 22:04:06 f6bvp-11 kernel: UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
Jul 20 22:04:06 f6bvp-11 kernel: NET: Registered protocol family 1
Jul 20 22:04:06 f6bvp-11 kernel: RPC: Registered udp transport module.
Jul 20 22:04:06 f6bvp-11 kernel: RPC: Registered tcp transport module.
Jul 20 22:04:06 f6bvp-11 kernel: RPC: Registered tcp NFSv4.1 backchannel transport module.
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:01.0: disabling DAC on VIA PCI bridge
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:00:11.0: Bypassing VIA 8237 APIC De-Assert Message
Jul 20 22:04:06 f6bvp-11 kernel: pci 0000:02:00.0: Boot video device
Jul 20 22:04:06 f6bvp-11 kernel: PCI: CLS 32 bytes, default 64
Jul 20 22:04:06 f6bvp-11 kernel: Trying to unpack rootfs image as initramfs...
Jul 20 22:04:06 f6bvp-11 kernel: Freeing initrd memory: 5360k freed
Jul 20 22:04:06 f6bvp-11 kernel: HugeTLB registered 2 MB page size, pre-allocated 0 pages
Jul 20 22:04:06 f6bvp-11 kernel: Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Jul 20 22:04:06 f6bvp-11 kernel: msgmni has been set to 4021
Jul 20 22:04:06 f6bvp-11 kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
Jul 20 22:04:06 f6bvp-11 kernel: io scheduler noop registered
Jul 20 22:04:06 f6bvp-11 kernel: io scheduler deadline registered
Jul 20 22:04:06 f6bvp-11 kernel: io scheduler cfq registered (default)
Jul 20 22:04:06 f6bvp-11 kernel: pcieport 0000:00:02.0: setting latency timer to 64
Jul 20 22:04:06 f6bvp-11 kernel: pcieport 0000:00:02.0: irq 64 for MSI/MSI-X
Jul 20 22:04:06 f6bvp-11 kernel: pcieport 0000:00:03.0: setting latency timer to 64
Jul 20 22:04:06 f6bvp-11 kernel: pcieport 0000:00:03.0: irq 65 for MSI/MSI-X
Jul 20 22:04:06 f6bvp-11 kernel: vesafb: mode is 800x600x16, linelength=1600, pages=2
Jul 20 22:04:06 f6bvp-11 kernel: vesafb: scrolling: redraw
Jul 20 22:04:06 f6bvp-11 kernel: vesafb: Truecolor: size=0:5:6:5, shift=0:11:5:0
Jul 20 22:04:06 f6bvp-11 kernel: vesafb: framebuffer at 0xc0000000, mapped to 0xffffc90010980000, using 1875k, total 262144k
Jul 20 22:04:06 f6bvp-11 kernel: Console: switching to colour frame buffer device 100x37
Jul 20 22:04:06 f6bvp-11 kernel: fb0: VESA VGA frame buffer device
Jul 20 22:04:06 f6bvp-11 kernel: Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
Jul 20 22:04:06 f6bvp-11 kernel: serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
Jul 20 22:04:06 f6bvp-11 kernel: serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
Jul 20 22:04:06 f6bvp-11 kernel: 00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
Jul 20 22:04:06 f6bvp-11 kernel: 00:09: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
Jul 20 22:04:06 f6bvp-11 kernel: Linux agpgart interface v0.103
Jul 20 22:04:06 f6bvp-11 kernel: brd: module loaded
Jul 20 22:04:06 f6bvp-11 kernel: Uniform Multi-Platform E-IDE driver
Jul 20 22:04:06 f6bvp-11 kernel: i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
Jul 20 22:04:06 f6bvp-11 kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
Jul 20 22:04:06 f6bvp-11 kernel: serio: i8042 AUX port at 0x60,0x64 irq 12
Jul 20 22:04:06 f6bvp-11 kernel: mousedev: PS/2 mouse device common for all mice
Jul 20 22:04:06 f6bvp-11 kernel: cpuidle: using governor ladder
Jul 20 22:04:06 f6bvp-11 kernel: cpuidle: using governor menu
Jul 20 22:04:06 f6bvp-11 kernel: TCP cubic registered
Jul 20 22:04:06 f6bvp-11 kernel: Registering the dns_resolver key type
Jul 20 22:04:06 f6bvp-11 kernel: input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
Jul 20 22:04:06 f6bvp-11 kernel: Refined TSC clocksource calibration: 2194.500 MHz.
Jul 20 22:04:06 f6bvp-11 kernel: Switching to clocksource tsc
Jul 20 22:04:06 f6bvp-11 kernel: input: ImExPS/2 Logitech Wheel Mouse as /devices/platform/i8042/serio1/input/input1
Jul 20 22:04:06 f6bvp-11 kernel: registered taskstats version 1
Jul 20 22:04:06 f6bvp-11 kernel: Freeing unused kernel memory: 632k freed
Jul 20 22:04:06 f6bvp-11 kernel: SCSI subsystem initialized
Jul 20 22:04:06 f6bvp-11 kernel: libata version 3.00 loaded.
Jul 20 22:04:06 f6bvp-11 kernel: sata_via 0000:00:0f.0: version 2.6
Jul 20 22:04:06 f6bvp-11 kernel: sata_via 0000:00:0f.0: PCI INT B -> Link[ALKA] -> GSI 20 (level, low) -> IRQ 20
Jul 20 22:04:06 f6bvp-11 kernel: sata_via 0000:00:0f.0: routed to hard irq line 11
Jul 20 22:04:06 f6bvp-11 kernel: scsi0 : sata_via
Jul 20 22:04:06 f6bvp-11 kernel: scsi1 : sata_via
Jul 20 22:04:06 f6bvp-11 kernel: ata1: SATA max UDMA/133 cmd 0xf800 ctl 0xf400 bmdma 0xe800 irq 20
Jul 20 22:04:06 f6bvp-11 kernel: ata2: SATA max UDMA/133 cmd 0xf000 ctl 0xec00 bmdma 0xe808 irq 20
Jul 20 22:04:06 f6bvp-11 kernel: ata1: SATA link down 1.5 Gbps (SStatus 0 SControl 300)
Jul 20 22:04:06 f6bvp-11 kernel: ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
Jul 20 22:04:06 f6bvp-11 kernel: ata2.00: ATA-7: Hitachi HDT725032VLA360, V54OA7EA, max UDMA/133
Jul 20 22:04:06 f6bvp-11 kernel: ata2.00: 625142448 sectors, multi 16: LBA48 NCQ (depth 0/32)
Jul 20 22:04:06 f6bvp-11 kernel: ata2.00: configured for UDMA/133
Jul 20 22:04:06 f6bvp-11 kernel: scsi 1:0:0:0: Direct-Access     ATA      Hitachi HDT72503 V54O PQ: 0 ANSI: 5
Jul 20 22:04:06 f6bvp-11 kernel: sd 1:0:0:0: [sda] 625142448 512-byte logical blocks: (320 GB/298 GiB)
Jul 20 22:04:06 f6bvp-11 kernel: sd 1:0:0:0: [sda] Write Protect is off
Jul 20 22:04:06 f6bvp-11 kernel: sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
Jul 20 22:04:06 f6bvp-11 kernel: sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Jul 20 22:04:06 f6bvp-11 kernel: sda: sda1 sda2 < sda5 sda6 >
Jul 20 22:04:06 f6bvp-11 kernel: sd 1:0:0:0: [sda] Attached SCSI disk
Jul 20 22:04:06 f6bvp-11 kernel: pata_acpi 0000:00:0f.1: PCI INT A -> Link[ALKA] -> GSI 20 (level, low) -> IRQ 20
Jul 20 22:04:06 f6bvp-11 kernel: pata_acpi 0000:00:0f.1: PCI INT A disabled
Jul 20 22:04:06 f6bvp-11 kernel: pata_via 0000:00:0f.1: version 0.3.4
Jul 20 22:04:06 f6bvp-11 kernel: pata_via 0000:00:0f.1: PCI INT A -> Link[ALKA] -> GSI 20 (level, low) -> IRQ 20
Jul 20 22:04:06 f6bvp-11 kernel: scsi2 : pata_via
Jul 20 22:04:06 f6bvp-11 kernel: scsi3 : pata_via
Jul 20 22:04:06 f6bvp-11 kernel: ata3: PATA max UDMA/133 cmd 0x1f0 ctl 0x3f6 bmdma 0xe000 irq 14
Jul 20 22:04:06 f6bvp-11 kernel: ata4: PATA max UDMA/133 cmd 0x170 ctl 0x376 bmdma 0xe008 irq 15
Jul 20 22:04:06 f6bvp-11 kernel: ata3.00: ATAPI: TSSTcorpCD/DVDW TS-H552B, TS05, max UDMA/33
Jul 20 22:04:06 f6bvp-11 kernel: ata3.00: configured for UDMA/33
Jul 20 22:04:06 f6bvp-11 kernel: scsi 2:0:0:0: CD-ROM            TSSTcorp CD/DVDW TS-H552B TS05 PQ: 0 ANSI: 5
Jul 20 22:04:06 f6bvp-11 kernel: ata4.00: ATA-6: ST3120026A, 3.06, max UDMA/100
Jul 20 22:04:06 f6bvp-11 kernel: ata4.00: 234441648 sectors, multi 16: LBA48 
Jul 20 22:04:06 f6bvp-11 kernel: ata4.00: configured for UDMA/33
Jul 20 22:04:06 f6bvp-11 kernel: scsi 3:0:0:0: Direct-Access     ATA      ST3120026A       3.06 PQ: 0 ANSI: 5
Jul 20 22:04:06 f6bvp-11 kernel: sd 3:0:0:0: [sdb] 234441648 512-byte logical blocks: (120 GB/111 GiB)
Jul 20 22:04:06 f6bvp-11 kernel: sd 3:0:0:0: [sdb] Write Protect is off
Jul 20 22:04:06 f6bvp-11 kernel: sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
Jul 20 22:04:06 f6bvp-11 kernel: sd 3:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Jul 20 22:04:06 f6bvp-11 kernel: sdb: sdb1 sdb2 < sdb5 >
Jul 20 22:04:06 f6bvp-11 kernel: sd 3:0:0:0: [sdb] Attached SCSI disk
Jul 20 22:04:06 f6bvp-11 kernel: EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: acl
Jul 20 22:04:06 f6bvp-11 kernel: udev: starting version 153
Jul 20 22:04:06 f6bvp-11 kernel: agpgart: Detected VIA P4M890 chipset
Jul 20 22:04:06 f6bvp-11 kernel: agpgart-via 0000:00:00.0: AGP aperture is 128M @ 0xd0000000
Jul 20 22:04:06 f6bvp-11 kernel: input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input2
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: Power Button [PWRB]
Jul 20 22:04:06 f6bvp-11 kernel: input: Sleep Button as /devices/LNXSYSTM:00/device:00/PNP0C0E:00/input/input3
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: Sleep Button [SLPB]
Jul 20 22:04:06 f6bvp-11 kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: Power Button [PWRF]
Jul 20 22:04:06 f6bvp-11 kernel: rtc_cmos 00:04: RTC can wake from S4
Jul 20 22:04:06 f6bvp-11 kernel: rtc_cmos 00:04: rtc core: registered rtc_cmos as rtc0
Jul 20 22:04:06 f6bvp-11 kernel: rtc0: alarms up to one year, y3k, 242 bytes nvram
Jul 20 22:04:06 f6bvp-11 kernel: FDC 0 is a post-1991 82077
Jul 20 22:04:06 f6bvp-11 kernel: ACPI: acpi_idle registered with cpuidle
Jul 20 22:04:06 f6bvp-11 kernel: EXT4-fs (sda1): re-mounted. Opts: acl
Jul 20 22:04:06 f6bvp-11 kernel: EXT4-fs (sda6): mounted filesystem with ordered data mode. Opts: acl
Jul 20 22:04:06 f6bvp-11 kernel: EXT4-fs (sdb5): mounted filesystem with ordered data mode. Opts: (null)
Jul 20 22:04:06 f6bvp-11 kernel: Adding 4088504k swap on /dev/sda5.  Priority:-1 extents:1 across:4088504k 
Jul 20 22:04:07 f6bvp-11 kernel: [drm] Initialized drm 1.1.0 20060810
Jul 20 22:04:07 f6bvp-11 kernel: nouveau 0000:02:00.0: PCI INT A -> GSI 24 (level, low) -> IRQ 24
Jul 20 22:04:07 f6bvp-11 kernel: nouveau 0000:02:00.0: setting latency timer to 64
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Detected an NV40 generation card (0x04b200a2)
Jul 20 22:04:07 f6bvp-11 kernel: checking generic (c0000000 10000000) vs hw (c0000000 10000000)
Jul 20 22:04:07 f6bvp-11 kernel: fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing generic driver
Jul 20 22:04:07 f6bvp-11 kernel: Console: switching to colour dummy device 80x25
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PRAMIN
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: ... appears to be valid
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: BIT BIOS found
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Bios version 05.73.22.19
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: TMDS table version 1.1
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: BIT table 'd' not found
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Found Display Configuration Block version 3.0
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Raw DCB entry 0: 01000300 00000028
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Raw DCB entry 1: 03011312 00000000
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Raw DCB entry 2: 04011310 00000028
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Raw DCB entry 3: 020223f1 00c0c080
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: DCB connector table: VHER 0x30 5 10 2
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0:   0: 0x00001030: type 0x30 idx 0 tag 0x07
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset 0xDDCC
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset 0xE446
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset 0xEB09
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset 0xEC84
Jul 20 22:04:07 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset 0xEE72
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: 1 available performance level(s)
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: 0: memory 400MHz core 400MHz voltage 1100mV fanspeed 100%
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: c: memory 405MHz core 400MHz
Jul 20 22:04:08 f6bvp-11 kernel: nouveau 0000:02:00.0: PCI: Disallowing DAC for device
Jul 20 22:04:08 f6bvp-11 kernel: [TTM] Zone  kernel: Available graphics memory: 1029758 kiB.
Jul 20 22:04:08 f6bvp-11 kernel: [TTM] Initializing pool allocator.
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Detected 256MiB VRAM
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
Jul 20 22:04:08 f6bvp-11 kernel: [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
Jul 20 22:04:08 f6bvp-11 kernel: [drm] No driver support for vblank timestamp query.
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga encoder (output 0)
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on tmds encoder (output 1)
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga encoder (output 2)
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on TV encoder (output 3)
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: allocated 1280x1024 fb: 0x49000, bo ffff88007c039000
Jul 20 22:04:08 f6bvp-11 kernel: fbcon: nouveaufb (fb0) is primary device
Jul 20 22:04:08 f6bvp-11 kernel: Console: switching to colour frame buffer device 160x64
Jul 20 22:04:08 f6bvp-11 kernel: fb0: nouveaufb frame buffer device
Jul 20 22:04:08 f6bvp-11 kernel: drm: registered panic notifier
Jul 20 22:04:08 f6bvp-11 kernel: [drm] Initialized nouveau 0.0.16 20090420 for 0000:02:00.0 on minor 0
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Setting dpms mode 0 on vga encoder (output 0)
Jul 20 22:04:08 f6bvp-11 kernel: [drm] nouveau 0000:02:00.0: Output VGA-1 is running on CRTC 0 using output A
Jul 20 22:04:17 f6bvp-11 kernel: cdrom: Uniform CD-ROM driver Revision: 3.20
Jul 20 22:04:17 f6bvp-11 kernel: sr 2:0:0:0: Attached scsi CD-ROM sr0
Jul 20 22:04:17 f6bvp-11 kernel: sd 1:0:0:0: Attached scsi generic sg0 type 0
Jul 20 22:04:17 f6bvp-11 kernel: sr 2:0:0:0: Attached scsi generic sg1 type 5
Jul 20 22:04:17 f6bvp-11 kernel: sd 3:0:0:0: Attached scsi generic sg2 type 0
Jul 20 22:04:17 f6bvp-11 kernel: 8139too: 8139too Fast Ethernet driver 0.9.28
Jul 20 22:04:17 f6bvp-11 kernel: 8139too 0000:00:0b.0: PCI INT A -> GSI 21 (level, low) -> IRQ 21
Jul 20 22:04:17 f6bvp-11 kernel: 8139too 0000:00:0b.0: eth0: RealTek RTL8139 at 0xffffc90012c5c000, 00:16:17:b3:e9:6c, IRQ 21
Jul 20 22:04:17 f6bvp-11 kernel: 8139cp: 8139cp: 10/100 PCI Ethernet driver v1.3 (Mar 22, 2004)
Jul 20 22:04:18 f6bvp-11 kernel: VIA 82xx Audio 0000:00:11.5: PCI INT C -> Link[ALKC] -> GSI 22 (level, low) -> IRQ 22
Jul 20 22:04:18 f6bvp-11 kernel: VIA 82xx Audio 0000:00:11.5: setting latency timer to 64
Jul 20 22:04:19 f6bvp-11 kernel: NET: Registered protocol family 10
Jul 20 22:04:20 f6bvp-11 kernel: 8139too 0000:00:0b.0: eth0: link up, 100Mbps, full-duplex, lpa 0x45E1
Jul 20 22:04:20 f6bvp-11 kernel: NET: Registered protocol family 17
Jul 20 22:04:47 f6bvp-11 kernel: NET: Registered protocol family 3
Jul 20 22:04:47 f6bvp-11 kernel: mkiss: AX.25 Multikiss, Hans Albas PE1AYX
Jul 20 22:04:47 f6bvp-11 kernel: mkiss: ax0: crc mode is auto.
Jul 20 22:04:47 f6bvp-11 kernel: ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
Jul 20 22:04:51 f6bvp-11 kernel: mkiss: ax1: crc mode is auto.
Jul 20 22:04:51 f6bvp-11 kernel: ADDRCONF(NETDEV_CHANGE): ax1: link becomes ready
Jul 20 22:04:51 f6bvp-11 kernel: mkiss: ax2: crc mode is auto.
Jul 20 22:04:51 f6bvp-11 kernel: ADDRCONF(NETDEV_CHANGE): ax2: link becomes ready
Jul 20 22:04:59 f6bvp-11 kernel: NET: Registered protocol family 11
Jul 20 22:04:59 f6bvp-11 kernel: ROSE: socket is bound
Jul 20 22:04:59 f6bvp-11 kernel: mkiss: ax0: Trying crc-smack
Jul 20 22:05:02 f6bvp-11 kernel: mkiss: ax0: Trying crc-flexnet
Jul 20 22:05:02 f6bvp-11 kernel: mkiss: ax2: Trying crc-smack
Jul 20 22:05:05 f6bvp-11 kernel: mkiss: ax2: Trying crc-flexnet
Jul 20 22:05:13 f6bvp-11 kernel: netconsole: local port 6666
Jul 20 22:05:13 f6bvp-11 kernel: netconsole: local IP 192.168.0.68
Jul 20 22:05:13 f6bvp-11 kernel: netconsole: interface 'eth0'
Jul 20 22:05:13 f6bvp-11 kernel: netconsole: remote port 4444
Jul 20 22:05:13 f6bvp-11 kernel: netconsole: remote IP 192.168.0.64
Jul 20 22:05:13 f6bvp-11 kernel: netconsole: remote ethernet address 00:21:85:5e:a8:9e
Jul 20 22:05:13 f6bvp-11 kernel: console [netcon0] enabled
Jul 20 22:05:13 f6bvp-11 kernel: netconsole: network logging started
Jul 20 22:07:40 f6bvp-11 kernel: AX.25: sendto: Addresses built. Building packet.
Jul 20 22:07:40 f6bvp-11 kernel: AX.25: Appending user data
Jul 20 22:07:40 f6bvp-11 kernel: AX.25: Transmitting buffer
Jul 20 22:07:41 f6bvp-11 kernel: AX.25: sendto: Addresses built. Building packet.
Jul 20 22:07:41 f6bvp-11 kernel: AX.25: Appending user data
Jul 20 22:07:41 f6bvp-11 kernel: AX.25: Transmitting buffer

--------------000202030501000603090109--
