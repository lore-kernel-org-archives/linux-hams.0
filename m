From: Bent <bbagger@gmail.com>
Subject: Re: Which slave with Unix98 master-slave pseudo ttys?
Date: Sun, 18 Nov 2007 09:31:31 +0100
Message-ID: <2e19719f0711180031v29bd5c01l9d403d4afc28c238@mail.gmail.com>
References: <2e19719f0711171120q129dbd51s8c0aebe45b4e4273@mail.gmail.com>
	 <1195334226.4024.87.camel@unreal.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=VG35HhEM8/1nZt86ajbkO8QpCCayLAURvCxTztgBJPk=;
        b=mUBsPUUQz6idYJWLS5aqmumTC7/XFJ79V7ibuTU7rjavdjnVoulY/lNglJMS4QUIuvkQbcZYEqGlNPNqPEU6qHgJElswypuefrpz8bjP3/UuWE7W6UQjpfpFcu2aHo2+aJlpDpHeUAPDLWE0WYUQTafums0cqax7tfbHOLDNIX0=
In-Reply-To: <1195334226.4024.87.camel@unreal.localdomain>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org

Hi Tom

Thanks for the quick answer

2007/11/17, Thomas Sailer <t.sailer@alumni.ethz.ch>:
>
> In C you can use openpty
>
I did not express myself clearly enough in my first post. I have this
problem in connection with the use of mkiss and kissattach. With mkiss
I create one (or more) pseudo ttys:

/usr/local/sbin/mkiss -l -s 115200 /dev/usb/ttyUSB0 /dev/ptmx

This creates a master/slave pair which I want to connect to with kissattach:

/usr/sbin/kissattach $device??? asy 44.145.40.3

The question is "which device?" I have previously found it with:

device=`tail -n 5 /var/log/messages | grep slave | gawk -F\  '{print $10}'`

but apparently mkiss doesn't put the ID of the slave into the system
log any more.

I'm aware of it being possible in C, but I want to do it from the
command line. AT least I prefer that as my first resort. But perhaps I
should write that C program :-)

Best 73 de Bent/OZ6BL
