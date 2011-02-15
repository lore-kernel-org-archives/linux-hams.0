From: Jim Kusznir <jkusznir@gmail.com>
Subject: Re: Linux Packet Interface Hardware
Date: Tue, 15 Feb 2011 10:36:07 -0800
Message-ID: <AANLkTikbcO_xwus28QgzSVV+m8vzRwyRqnjPXYi8x7Nu@mail.gmail.com>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
	<20100616012452.GN898@mea-ext.zmailer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type:content-transfer-encoding;
        bh=0ynWDajkEaJ7A+OIOqkHZ+pnsEJyB/pf8eT1nE2+Hq4=;
        b=a2OS1bQGAWjhGLH2ArOJzVgfk556ckCBQAAfCvcZGDfofk+yGdd1Ps6K7XRxuZroCZ
         5BT8SX5TtWqXESnT5UaAaVWOwQpf/ejLQ7D4g8LjEU2/w7Ac11mRcHWf/s3JbTfDK5xb
         U+wTm6QZX/LlrJ3zf6jtJdvzvm9ZxYzLQdEbI=
In-Reply-To: <20100616012452.GN898@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matti Aarnio <matti.aarnio@zmailer.org>, linux-hams@vger.kernel.org

Hi all:

A while has passed since this message went out originally, but I now
have a student interested in perusing this as an embedded systems
class project.  As we looked more into this, we found a deficit of
information in some important areas, namely the actual modulation
technique.  Before actually proposing this project, the student wants
to make sure its actually something within his relm of doing, and the
biggest questions at the moment are the requirements for actually
encoding the data into AFSK/FSK signals.  Are there any good
references on that?  Does someone also have handy the specification of
the BPQether spec?

He's looking at using a PIC product for the implementation that
actually has an ethernet port on it rather than the USB ether device,
but there is still flexibility in that.  Any other input on this would
be appreciated.

--Jim, K7LL

On Tue, Jun 15, 2010 at 6:24 PM, Matti Aarnio <matti.aarnio@zmailer.org=
> wrote:
> On Tue, Jun 15, 2010 at 04:43:45PM -0700, Jim Kusznir wrote:
>>
>> Hi all:
>>
>> I'm in the process of designing some kinda-embedded applications tha=
t
>> will need to employ packet "compatibility layers" to allow access of
>> packet radios.
>>
>> In one application, I'm proposing relacing a node stack with a linux
>> box, some interface (subject of this e-mail), and the existing radio=
s
>> with their audio (discriminator if appropriate), tx line, squelch
>> line, etc. =A0Other applications may not be as demanding as the node=
s,
>> but similar. =A0In essence, I'm looking for a device to connect to t=
he
>> equivalent of the 6-pin mini-din connector used for "data" on most
>> modern radios and linux.
>>
>> I'm familiar with the state of the art back in the late '90's. =A0I =
also
>> realize that not a lot has necessarily changed since then....
>> However, I suspect something may have.
>>
>> the solution should be capable of running several different packet
>> interfaces, and at 9600 or 1200 baud. =A0These interfaces should tur=
n
>> into linux axX interfaces.
>
> I would suggest making it an USB device with "BPQether" type of inter=
face.
> At USB level it would look like a _generic_ ( =3D no extra drivers )
> ethernet, but it would understand only BPQether type of packets, and
> therefore would not get to transmit just anything that system happens
> to send on its way.
>
> There would be need for unique serial numbers ( =3D "mac address" ) f=
or
> the devices. =A0Anything would be good as long as first byte of MAC
> address has its lowest bit clear (the multicast indicator)
> (Even prefix "BPQ" =3D 0x42, 0x50, 0x51 )
>
> See =A0"man bpqparams" for the control interface.
>
> To implement a control command channel, like to set ptt delays, etc.
> that could be an AX.25 frame with destination call of 'NOCALL' (the
> classical misconfiguration token) and an UI frame with control data.
> Speed would be fixed, but nothing prevents having multiple virtual
> ethernet interfaces in same USB device, each with their own speeds.
>
> As a bonus, this same hardware could be plugged on Windows as well
> without any special drivers. =A0If the settings are correct, then on
> windows a BPQ32 suite will be able to drive it too - and you get
> even more people interested in that device.
>
>> Thanks!
>> --Jim, K7LL
>
> 73 de Matti, OH2MQK
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
