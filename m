From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: SOLVED (Re: PROBLEM: gMFSK v0.5 locks up.)
Date: Thu, 11 Sep 2003 09:51:15 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F602973.1080405@pi8zaa.ampr.org>
References: <Pine.LNX.4.44.0307130006090.20867-100000@sys09.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0307130006090.20867-100000@sys09.localnet>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Edson Pereira wrote:

>Arno,
>
>With strace, check if the program is hanging on a system call (read,
>write, ioctl more precisely). I have found this problem few times with OSS
>Free. Most recently with a laptop the problem was resolved using alsa.
>
>73,
>
>-- Edson, 7n4ncl
>  
>

Purpose of this mail is mainly to help others with similar problems. 
They can find the solution when searching the linux-hams archive.

The problem was indeed solved when I use ALSA.

Thanks Tomi and Edson for your help.

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org


