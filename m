From: Chuck Hast <wchast@gmail.com>
Subject: Re: Trying to get Ax25 running.
Date: Fri, 15 Oct 2004 19:52:12 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <620c90570410151952635eb635@mail.gmail.com>
References: <620c9057041015095771b236e0@mail.gmail.com>
	 <4170100F.F5F43579@free.fr> <1097864803.1290.14.camel@oh2bns.ampr.org>
	 <4323.192.168.0.2.1097865189.squirrel@192.168.0.2>
	 <1097866437.1290.30.camel@oh2bns.ampr.org>
	 <Pine.SUN.4.58.0410151221210.28043@eskimo.com>
	 <620c9057041015125535932b34@mail.gmail.com>
	 <620c90570410151618432401d1@mail.gmail.com>
	 <620c905704101518153ff636e@mail.gmail.com>
	 <200410160128.i9G1Sk2M028098@yagi.h-net.msu.edu>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200410160128.i9G1Sk2M028098@yagi.h-net.msu.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Fri, 15 Oct 2004 21:28:46 -0400, Dennis Boone <drb@msu.edu> wrote:
>  > Now if I can just get the BPQKISS part running (CRC kiss)
>  >
>  > echo -e "\r\033@K1\r" > /dev/ttyUSB0
>  > modprobe ax25; modprobe kiss; modprobe mkiss
>  > /usr/sbin/kissattach -i 44.1.1.1 /dev/ttyUSB0 kiss0
>  > /usr/sbin/kissparms -p kiss0 -r 254 -s 1 -l 10 -t 100
> 
> If I understand correctly, only the mkiss utility speaks frame
> check on kiss ports.  Even if you don't need multiple ports, you
> need to run mkiss to get your checksums.  That would mean doing
> the following with the above, following Tomi's suggestion from
> earlier:
> 
>         echo -e "\r\033@K1\r" > /dev/ttyUSB0
>         modprobe ax25; modprobe kiss; modprobe mkiss
>         /usr/sbin/kissattach -i 44.1.1.1 /dev/ptyz0 kiss0
>         /usr/sbin/kissparms -p kiss0 -r 254 -s 1 -l 10 -t 100
>         /usr/sbin/mkiss -c -l /dev/ttyUSB0 /dev/ttyz0
> 
> You may need the "-s baudrate" option to mkiss as well.
> 

You were right. That worked. I am noticing one thing, when I establish
a connection that goes through a digi or two, it looks like the
frame counters get screwed up not sure what is going on, but
what I see is the I frame is sent, the far end ask for a repeate
and off it goes again, it looks ike the far end is not getting the
right frame number. If I send a new line again, the previous
line is sent on to the target.
