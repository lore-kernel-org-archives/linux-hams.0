From: John Ronan <jronan@tssg.org>
Subject: Re: Linux NetRom Node Question
Date: Sun, 4 Oct 2009 20:32:21 +0100
Message-ID: <B9E98351-9E60-413B-99DD-B74CB02B6DB1@tssg.org>
References: <200910041146.35375.jjgpg@cet.com>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200910041146.35375.jjgpg@cet.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Jeremiah <jjgpg@cet.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi,

I don't use netrom as it was causing segfaults at one stage and as no  
one around here uses netrom anymore I stopped.

however just out of curiosity I had a look

firstly
modprobe netrom
then
root@ns1:~# cat /etc/ax25/nrports
# /etc/ax25/nrports
#
# The format of this file is:
#
# name callsign alias paclen description
#
netrom  EI7IG-14 #TMRE  235     Switch Port
netnod  EI7IG-1  TMRE   235     Node
root@ns1:~# nrattach -i 44.155.6.12 -m 236 netrom
NET/ROM port netrom bound to device nr0
root@ns1:~# ifconfig nr0
nr0       Link encap:AMPR NET/ROM  HWaddr EI7IG-14
           inet addr:44.155.6.12  Mask:255.0.0.0
           UP RUNNING NOARP  MTU:236  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

root@ns1:~#

Regards
de John
EI7IG

On 4 Oct 2009, at 19:46, Jeremiah wrote:

> Hello all,
>
> I am still working on setting up our RMS to send out NetRom  
> Broadcasts. I have
> added a "dummy" entry into the nrports file for connection outbound  
> from the
> node. I also corrected the entry for the RMS. Running nrattach it  
> comes back
> with "NET/ROM port winl2k bound to device nr0", but it never shows  
> up when I
> run ifconfig. There are no errors in the system logs when I run  
> nrattach.
> Does anyone have an example nrports file they would be willing to  
> share? I'm
> a bit stuck on this because the nr0 interface does not come up and  
> the system
> gives me no errors in /var/log/messages.
>
>
>
> Thanks
>
> Jeremiah
> KD7DMP
>
> nrports-------------
> # /etc/ax25/nrports
> #
> # The format of this file is:
> #
> # name callsign alias paclen description
> #
> switch  WR7VHF-14       #WINL2k 235     dummy for the RMS
> winl2k  WR7VHF-10       WINL2K  235     RMS
>
> nrbroadcast------------
> # /etc/ax25/nrbroadcast
> #
> # The format of this file is:
> #
> # ax25_name min_obs def_qual worst_qual verbose
> #
> pk96    5       250     100     0
>
> axports-----------
> # /etc/ax25/axports
> #
> # The format of this file is:
> #
> # name callsign speed paclen window description
> #
> pk96    wr7vhf          19200   255     4       BackBone Port
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



