From: Willie Hein WJ3G <wj3g@comcast.net>
Subject: [Fwd: Re: Quick node question]
Date: Thu, 20 Nov 2008 07:30:32 -0500
Message-ID: <49255868.7010304@comcast.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000206040906040304080501"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000206040906040304080501
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Here are the result of running strace. Hope someone can tell me what I'm
doing wrong.

Willie, WJ3G

--------------000206040906040304080501
Content-Type: message/rfc822;
 name="Re: Quick node question.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Re: Quick node question.eml"

X-Mozilla-Keys: 
Message-ID: <492552CB.2040900@comcast.net>
Date: Thu, 20 Nov 2008 07:06:35 -0500
From: Willie Hein WJ3G <wj3g@comcast.net>
User-Agent: Thunderbird 2.0.0.17 (X11/20080922)
MIME-Version: 1.0
To: John Ronan <jronan@tssg.org>
Subject: Re: Quick node question
References: <4924A66F.7080102@comcast.net> <E7D5057C-0038-417D-BF5D-3DD6D00C80B0@tssg.org>
In-Reply-To: <E7D5057C-0038-417D-BF5D-3DD6D00C80B0@tssg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi John,

Maybe you can translate this:

willie@wj3g:~> strace /usr/sbin/node > st_error
execve("/usr/sbin/node", ["/usr/sbin/node"], [/* 60 vars */]) = 0
brk(0)                                  = 0x805d000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=104547, ...}) = 0
mmap2(NULL, 104547, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7f30000
close(3)                                = 0
open("/usr/lib/libax25.so.0", O_RDONLY) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\220\36\0\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=34884, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7f2f000
mmap2(NULL, 37960, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0xb7f25000
fadvise64(3, 0, 37960, POSIX_FADV_WILLNEED) = 0
mmap2(0xb7f2d000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7) = 0xb7f2d000
close(3)                                = 0
open("/usr/lib/libax25io.so.0", O_RDONLY) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\220\t\0\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=9696, ...}) = 0
mmap2(NULL, 16516, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0xb7f20000
fadvise64(3, 0, 16516, POSIX_FADV_WILLNEED) = 0
mmap2(0xb7f22000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1) = 0xb7f22000
mmap2(0xb7f24000, 132, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb7f24000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0Pg\1\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1410320, ...}) = 0
mmap2(NULL, 1320528, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0xb7ddd000
fadvise64(3, 0, 1320528, POSIX_FADV_WILLNEED) = 0
mmap2(0xb7f1a000, 12288, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x13d) = 0xb7f1a000
mmap2(0xb7f1d000, 9808, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb7f1d000
close(3)                                = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7ddc000
set_thread_area({entry_number:-1 -> 6, base_addr:0xb7ddc6c0,
limit:1048575, seg_32bit:1, contents:0, read_exec_only:0,
limit_in_pages:1, seg_not_present:0, useable:1}) = 0
open("/dev/urandom", O_RDONLY)          = 3
read(3, "\tFD.", 4)                     = 4
close(3)                                = 0
mprotect(0xb7f1a000, 8192, PROT_READ)   = 0
mprotect(0xb7f65000, 4096, PROT_READ)   = 0
munmap(0xb7f30000, 104547)              = 0
rt_sigaction(SIGALRM, {0x804b880, [ALRM], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGTERM, {0x804b830, [TERM], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGPIPE, {SIG_IGN}, {SIG_DFL}, 8) = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_IP) = 3
ioctl(3, SIOCGIFCONF, {288, {{"lo", {AF_INET, inet_addr("127.0.0.1")}},
{"eth0", {AF_INET, inet_addr("68.81.136.25")}}, {"eth1", {AF_INET,
inet_addr("44.80.44.2")}}, {"eth2", {AF_INET,
inet_addr("192.168.0.1")}}, {"tunl0", {AF_INET,
inet_addr("44.80.44.1")}}, {"ax0", {AF_INET, inet_addr("44.80.44.2")}},
{"ax1", {AF_INET, inet_addr("44.80.44.2")}}, {"ax2", {AF_INET,
inet_addr("44.80.44.2")}}, {"ax3", {AF_INET,
inet_addr("44.80.44.2")}}}}) = 0
ioctl(3, SIOCGIFFLAGS, {ifr_name="eth0",
ifr_flags=IFF_UP|IFF_BROADCAST|IFF_NOTRAILERS|IFF_RUNNING|IFF_MULTICAST})
= 0
ioctl(3, SIOCGIFHWADDR, {ifr_name="eth0", ifr_hwaddr=00:08:9b:1e:67:5d}) = 0
ioctl(3, SIOCGIFFLAGS, {ifr_name="eth1",
ifr_flags=IFF_UP|IFF_BROADCAST|IFF_RUNNING|IFF_MULTICAST}) = 0
ioctl(3, SIOCGIFHWADDR, {ifr_name="eth1", ifr_hwaddr=00:50:da:61:ae:64}) = 0
ioctl(3, SIOCGIFFLAGS, {ifr_name="eth2",
ifr_flags=IFF_UP|IFF_BROADCAST|IFF_RUNNING|IFF_MULTICAST}) = 0
ioctl(3, SIOCGIFHWADDR, {ifr_name="eth2", ifr_hwaddr=00:01:03:21:51:8f}) = 0
ioctl(3, SIOCGIFFLAGS, {ifr_name="tunl0",
ifr_flags=IFF_UP|IFF_RUNNING|IFF_NOARP}) = 0
ioctl(3, SIOCGIFHWADDR, {ifr_name="tunl0",
ifr_hwaddr=00:00:00:00:51:8f}) = 0
ioctl(3, SIOCGIFFLAGS, {ifr_name="ax0",
ifr_flags=IFF_UP|IFF_BROADCAST|IFF_RUNNING}) = 0
ioctl(3, SIOCGIFHWADDR, {ifr_name="ax0", ifr_hwaddr=ae:94:66:8e:40:40}) = 0
brk(0)                                  = 0x805d000
brk(0x807e000)                          = 0x807e000
ioctl(3, SIOCGIFFLAGS, {ifr_name="ax1",
ifr_flags=IFF_UP|IFF_BROADCAST|IFF_RUNNING}) = 0
ioctl(3, SIOCGIFHWADDR, {ifr_name="ax1", ifr_hwaddr=ae:94:66:8e:40:40}) = 0
ioctl(3, SIOCGIFFLAGS, {ifr_name="ax2",
ifr_flags=IFF_UP|IFF_BROADCAST|IFF_RUNNING}) = 0
ioctl(3, SIOCGIFHWADDR, {ifr_name="ax2", ifr_hwaddr=ae:94:66:8e:40:40}) = 0
ioctl(3, SIOCGIFFLAGS, {ifr_name="ax3",
ifr_flags=IFF_UP|IFF_BROADCAST|IFF_RUNNING}) = 0
ioctl(3, SIOCGIFHWADDR, {ifr_name="ax3", ifr_hwaddr=ae:94:66:8e:40:40}) = 0
close(3)                                = 0
open("/etc/ax25/axports", O_RDONLY)     = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=329, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7f49000
read(3, "# /etc/ax25/axports\n#\n# The form"..., 4096) = 329
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0xb7f49000, 4096)                = 0
open("/etc/ax25/nrports", O_RDONLY)     = 3
socket(PF_INET, SOCK_DGRAM, IPPROTO_IP) = 4
fstat64(3, {st_mode=S_IFREG|0644, st_size=209, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7f49000
read(3, "# /etc/ax25/nrports\n#\n# The form"..., 4096) = 209
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0xb7f49000, 4096)                = 0
close(4)                                = 0
open("/etc/ax25/rsports", O_RDONLY)     = 3
socket(PF_INET, SOCK_DGRAM, IPPROTO_IP) = 4
fstat64(3, {st_mode=S_IFREG|0644, st_size=110, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7f49000
read(3, "# /etc/ax25/rsports\n#\n# The form"..., 4096) = 110
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0xb7f49000, 4096)                = 0
close(4)                                = 0
getpeername(1, 0xbff0bb28, [72])        = -1 ENOTSOCK (Socket operation
on non-socket)
getuid32()                              = 1000
open("/proc/net/ax25_calls", O_RDONLY)  = 3
fstat64(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7f49000
read(3, "", 1024)                       = 0
close(3)                                = 0
munmap(0xb7f49000, 4096)                = 0
time(NULL)                              = 1227182332
open("/etc/localtime", O_RDONLY)        = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=3519, ...}) = 0
fstat64(3, {st_mode=S_IFREG|0644, st_size=3519, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7f49000
read(3,
"TZif2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\4\0\0\0\4\0\0\0\0"..., 4096)
= 3519
_llseek(3, -24, [3495], SEEK_CUR)       = 0
read(3, "\nEST5EDT,M3.2.0,M11.1.0\n", 4096) = 24
close(3)                                = 0
munmap(0xb7f49000, 4096)                = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=3519, ...}) = 0
getpid()                                = 16855
socket(PF_FILE, SOCK_DGRAM, 0)          = 3
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
connect(3, {sa_family=AF_FILE, path="/dev/log"}, 110) = 0
send(3, "<187>Nov 20 06:58:52 node[16855]"..., 68, MSG_NOSIGNAL) = 68
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++


John Ronan wrote:
> Hmm,
>
> Lots of things. Does 'strace node' tell you anything useful?
>
> John
>
> On 19 Nov 2008, at 23:51, Willie Hein WJ3G wrote:
>
>> Greetings,
>>
>> What would cause node to seg fault other then not having the sticky
>> bit set?
>>
>> Willie, WJ3G
>>
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> -- 
> John Ronan <jronan@tssg.org>, +353-51-302938
> Telecommunications Software &  Systems Group,  http://www.tssg.org
>


--------------000206040906040304080501--
