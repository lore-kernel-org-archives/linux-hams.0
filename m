From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: Re: PROBLEM: gMFSK v0.5 locks up.
Date: Sun, 13 Jul 2003 22:15:02 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F11BDC6.2080306@pi8zaa.ampr.org>
References: <Pine.LNX.4.44.0304192044470.6051-100000@oh2bns.ampr.org>	<20030420023708.GA22988@silly.cloud.net.au>	<3F0F1E43.9030500@pi8zaa.ampr.org> <200307112325.24591.ailic@gmx.net>	<3F0F3126.8030403@pi8zaa.ampr.org>  <3F0FC0FD.5060307@pi8zaa.ampr.org> <1058027447.1273.58.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1058027447.1273.58.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Tomi Manninen wrote:

>On Sat, 2003-07-12 at 11:04, Arno Verhoeven wrote:
>
>  
>
>>Until now I didn't get it to produce any sound yet. (sound works on that 
>>system. Other applications can use the sound card)
>>    
>>
>
>Are you getting any sound input? I mean does the waterfall show any 
>noise?
>

No, nothing shows up.

>>1. click the "Abort transmission immediately" button.
>>2. click the "Mode" pull-down menu and try to select another mode.
>>    
>>
>
>This would indicate that the current RX thread is stuck somewhere
>(and the rest of the program is waiting for it to complete). It could
>be a blocked open() or read(). Are you sure no-one else is having the
>sound card open?
>

I have no other program running that would use the sound card. Th elock
ups also occur when I use a simple windowmanger like twm.
(trying to avoid kde's sound server from interfering...)

>Edson's idea is also good. Knowing where exactly it is stuck is
>valuable information.
>

This is the last bit of output from strace after I try to select another
mode.

ead(3, "\7\4b\23i\v@\1:\0\0\0002\0 \0034\0 \3f\2X\0!\0\3\0\20\0"..., 32) = 32
read(3, "\7\3b\23i\v@\1:\0\0\0004\0 \3\0\0\0\0f\2X\0\37\0\1\0\20"..., 32) = 32
read(3, "\22\0d\23\216\1 \3\216\1 \3\0\16\217\10\216\1 \3\0\0\0"..., 32) = 32
read(3, "\10\3e\23i\v@\1:\0\0\0\37\0 \3\0\0\0\0f\2X\0I\0D\0\20\0"..., 32) = 32
read(3, "\7\4e\23i\v@\1:\0\0\0002\0 \0034\0 \3f\2X\0!\0\3\0\20\0"..., 32) = 32
read(3, "\7\3e\23i\v@\1:\0\0\0004\0 \3\0\0\0\0f\2X\0\37\0\1\0\20"..., 32) = 32
read(3, "\t\3f\23\4\0 \3\2\364\377\277\37I\f\10\310\22`\10\3002"..., 32) = 32
read(3, "\1\2g\23\0\0\0\0\4\0 \3\0\0\0\0\0\0\0\0\1\0\0\0\0\327\332"..., 32) = 32
rt_sigprocmask(SIG_SETMASK, NULL, [RTMIN], 8) = 0
rt_sigsuspend([]

>Oh, does the CPU load increase when gmfsk is locked up?
>  
>

No, the CPU load doesn't go up.


-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org



