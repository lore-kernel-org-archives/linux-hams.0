From: John Ronan <jronan@tssg.org>
Subject: Re: Soundmodem (userspace) problems
Date: Fri, 11 Nov 2005 16:47:33 +0000
Message-ID: <F0E3DA51-9AB4-485B-8FAF-FB2699F0B6F0@tssg.org>
References: <20051110111910.12671.qmail@web25514.mail.ukl.yahoo.com> <78C35DA8-4647-4C01-8E71-4D1937319A8A@tssg.org> <32890.83.73.68.20.1131726366.squirrel@www.amsat.dk>
Mime-Version: 1.0 (Apple Message framework v746.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <32890.83.73.68.20.1131726366.squirrel@www.amsat.dk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: oz6bl@amsat.dk
Cc: Vittorio Vallero <ik1rac@yahoo.it>, linux-hams@vger.kernel.org

Currently, All I can tell you is that I'm using (I've forgotten what  
the different versions were)


oot@ns1:/var/log/squid# cat /proc/version
Linux version 2.6.11.8 (root@ns1) (gcc version 3.3.4 (Debian  
1:3.3.4-6sarge1)) #1 Tue May 10 21:23:46 IST 2005
root@ns1:/var/log/squid#

root@ns1:/usr/sbin# dpkg --list soundmodem
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half- 
installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err:  
uppercase=bad)
||/ Name           Version        Description
+++-==============-==============- 
============================================
ii  soundmodem     0.9-2          Sound Card Amateur Packet Radio Modems

root@ns1:~# axparms -version
axparms: 0.0.8
root@ns1:~#

0000:00:10.0 Multimedia audio controller: Creative Labs SB Live!  
EMU10k1 (rev 07)
0000:00:10.1 Input device controller: Creative Labs SB Live! MIDI/ 
Game Port (rev 07)
0000:00:11.0 Multimedia audio controller: Ensoniq ES1371  
[AudioPCI-97] (rev 06)

I'm using the Enzoniq for APRS 1k2 and 9k6 receive (PCSAT2).  I could  
not get the volume levels correct on the SB live.

I hope this helps.

Regards
John



On 11 Nov 2005, at 16:26, oz6bl@amsat.dk wrote:

> Hi John
>
> John Ronan wrote:
>>
>> I found this happening to me before, completely inexplicably.  It was
>> something to do with the version of the kernel and the version of
>> soundmodem.
>>
>> I think I upgraded both and the problem went away.
>>
>
> Out of curiosity (I experience the same problems as Vittorio): what  
> did
> you upgrade and from which version to which version?
>
> Best 73 de Bent/OZ6BL

--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



