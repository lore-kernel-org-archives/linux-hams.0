From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Trying to get Ax25 running.
Date: Fri, 15 Oct 2004 12:22:43 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.SUN.4.58.0410151221210.28043@eskimo.com>
References: <620c9057041015095771b236e0@mail.gmail.com> 
 <620c9057041013094421cbf279@mail.gmail.com>  <20041014025505.66938.qmail@web40824.mail.yahoo.com>
  <620c9057041014060070eeccf6@mail.gmail.com>  <200410141313.i9EDDoah001022@yagi.h-net.msu.edu>
  <200410151737.i9FHbiZW031272@yagi.h-net.msu.edu>  <4170100F.F5F43579@free.fr>
 <1097864803.1290.14.camel@oh2bns.ampr.org>  <4323.192.168.0.2.1097865189.squirrel@192.168.0.2>
 <1097866437.1290.30.camel@oh2bns.ampr.org>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1097866437.1290.30.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen <oh2bns@sral.fi>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On Fri, 15 Oct 2004, Tomi Manninen wrote:

> It's because of the way pseudo-tty's work. If the process on the slave
> side dies for any reason, the master side is unaffected. If the
> process on the master side dies, the slave side dies too. So, you want
> to put the more stable process on the master side.
>
> It's next to impossible for kissattach to die due to any error
> (unless there is a problem with the kernel and then you are screwed
> anyway). So therefore I'd put it on the master side. Also if you think
> of maintenance work, it's more probable that you need to restart
> the mkiss process if you do any rearranging of reconfiguring in
> your system. Again, that is a reason to put mkiss on the slave side.
>
> That said, this is not something that will impact the performance
> of your system. It can make handling certain error and configuring
> situations easier. On the other hand, if one uses the windows
> method of system administartion, ie. reboot after any change, then
> it doesn't make much difference one way or the other... :)

You should get the above text put into the AX.25-HOWTO.  That's a
useful tidbit that I had never heard before.  I would imagine that
would be quite useful.

--
Curt, WE7U			         http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
