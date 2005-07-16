From: Chuck Hast <wchast@gmail.com>
Subject: Listen root only
Date: Fri, 15 Jul 2005 21:02:41 -0400
Message-ID: <620c9057050715180279131307@mail.gmail.com>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

Folks,
I am trying to get listen to be viewable by other users than root. I have
checked the permissions on listen and all appears OK, but when I
try to run it as a common user, I get a failure.

Here is the error message:
kp4djt@fpac-dev:~$ listen
socket: Operation not permitted
kp4djt@fpac-dev:~$

If I do a strace here is what I get

All above the top of the capture appears the same as the strace under
root:

read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0x40018000, 4096)                = 0
close(4)                                = 0
socket(PF_PACKET, SOCK_PACKET, 512)     = -1 EPERM (Operation not permitted)
dup(2)                                  = 3
fcntl64(3, F_GETFL)                     = 0x8002 (flags O_RDWR|O_LARGEFILE)
fstat64(3, {st_mode=S_IFCHR|0620, st_rdev=makedev(3, 1), ...}) = 0
ioctl(3, SNDCTL_TMR_TIMEBASE, {B38400 opost isig icanon echo ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x40018000
_llseek(3, 0, 0xbffff580, SEEK_CUR)     = -1 ESPIPE (Illegal seek)
write(3, "socket: Operation not permitted\n", 32socket: Operation not permitted
) = 32
close(3)                                = 0
munmap(0x40018000, 4096)                = 0
exit_group(1)                           = ?
kp4djt@fpac-dev:~$


The problem appears to be with the socket part, but am not sure how to
deal with it.

-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
