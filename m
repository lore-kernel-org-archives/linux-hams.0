From: chuck gelm <chuck@gelm.net>
Subject: ? software requirements: MT63lx version 0.5
Date: Thu, 15 Jul 2004 09:42:04 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40F689AC.8020606@gelm.net>
References: <1089653483.3378.50.camel@oh2bns.ampr.org> <40F35166.3080008@gelm.net> <20040713060149.GI1486@mea-ext.zmailer.org> <40F5F8CB.2010707@gelm.net> <20040715074739.GO1486@mea-ext.zmailer.org>
Reply-To: chuck@gelm.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040715074739.GO1486@mea-ext.zmailer.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matti Aarnio <matti.aarnio@zmailer.org>, Dave Platt <dplatt@radagast.org>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

MT63lx software requirements: ?

Matti Aarnio wrote:
> On Wed, Jul 14, 2004 at 11:23:55PM -0400, chuck gelm wrote:
> 
>>>On Mon, Jul 12, 2004 at 11:05:10PM -0400, chuck gelm wrote:
>>>
>>>>I have seen mention of this "MT63" every few weeks or months here on the
>>>>linux-hams mail list.  Where can I obtain a description of what MT63 is
>>>>and what hardware it requires?

  I meant to ask about the hardware requirements of the sound card
(computer interface) rather than the electrical requirements of the
SSB transceiver audio in/out.
Sorry.
gMFSK requires, seemingly, a generic sound card.

>>>
>>>>Chuck nc8q
>>
>>>73 de Matti, OH2MQK
>>
>>Thanks, Matti:
>>

> I do get a feeling, that you need some Elmer guidance from
> people who have done it already, preferrably at your nearest
> hamradio club.   With these interface issues it really doesn't
> matter, if the computer runs Linux or Windows.  Same interface
> for  serial port/audio card/radio  will work.
> 
> 
>> Thus,
>>I am still uncertain if I have or will obtain the necessary hardware.

  Thanks. I think that I have the necessary hardware to interface
from the sound card to the SSB transceiver.

  Now about the software requirements...

>> Also,
>>I didn't see any mention of kernel version or CPU speed or tools or...

> The 'mt63' standalone modem uses slightly less CPU power, than
> the one in  gmfsk -- text mode user interface is less CPU intensive,

> 
> See this page, and links onwards from there:
>   http://freshmeat.net/projects/gmfsk/

  Now I am asking for the software requirements of 'MT63'.
I am aware of the hardware requirements between the computer sound
card and the radio.  I believe that I do not need additional help
from the 'line in' and speaker output  <>  SSB transceiver, as my
existing interface should work.

  What I am looking for now is the software requirements of the
'standalone' application 'MT63'.

  So far, Matti and Dave have responded and they both mentioned
gMFSK.  So, I looked at gMFSK.  Here is what I found out about
gMSFK and this is along the same line as what I am looking for
with MT63.

gMSFK:
  It is alpha code (still in development)
  It requires X11.
  It requires Gnome libraries,
   but does not require the Gnome desktop environment.
  It is intended for Advanced End Users
  It is licensed under OSI:GNU:GPL
  It works with POSIX *nix and POSIX Linux.
  It requires FFTW v2.1.5 which is a developers' tool.
   (download link provided at freshmeat.org)
  It requires 'libgnome' and here is where things get crazy.
   From this point things start to sound like the Abbott and Costello
    "Who's on first?" routine.
   The description of 'libgnome' is
"GNOME 2 is a new desktop environment which is an extension to GNOME 1"
     (So, if 'libgnome' == 'GNOME 2'; why is it called 'libgnome'?)
    Does 'GNOME 2' contain 'GNOME 1' ?
    'GNOME 2' (? a.k.a. libgnome-2.0) is available for download.
     (links were provided from the freshmeat link sited by Matti.)
     How does one obtain 'Gnome 1' ?
    GNOME 2 requires 'GTK 2' and 'Object Activation Framework'
     How does one acquire 'GTK 2' ?
     How does one acquire 'Object Activation Framework' ?

So, I was looking for an answer somewhat along this theme:

gMFSK requires:
  X11
  Gnome liraries
  FFTW v2.1.5
  libgnome
  Gnome 2
  Gnome 1
  GTK 2
  Object Activation Framework	

What software does MT63lx version 0.5 require ?

Regards, Chuck nc8q




