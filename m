From: Robert Thoelen <kd1zd@rtcubed.org>
Subject: Re: Problems with nrattach
Date: Wed, 14 Apr 2010 07:02:05 -0400
Message-ID: <i2r83d6fb251004140402tc77d8cfcl80a02038758859a5@mail.gmail.com>
References: <g2n83d6fb251004131859w55f96e8cga36a794e5b3cbc0f@mail.gmail.com>
	 <20100414091632.GR7246@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20100414091632.GR7246@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: linux-hams@vger.kernel.org

Ok, thanks guys!  I'll get the source from CVS and rebuild.

On Wed, Apr 14, 2010 at 5:16 AM, Thomas Osterried
<thomas@x-berg.in-berlin.de> wrote:
> Hello,
>
> the problem is already fixed in the CVS upstream version.
> Sorry again for the inconvenience. I introduced this problem a while =
ago.
>
> 73,
> =A0 =A0 =A0 =A0- Thomas =A0dl9sau
>
> On 2010-04-13 21:59:13 -0400, Robert Thoelen <kd1zd@rtcubed.org>
> wrote in <g2n83d6fb251004131859w55f96e8cga36a794e5b3cbc0f@mail.gmail.=
com>:
>> I'm having problems with nrattach and kernel 2.6.18.
>>
>> I have done a modprobe netrom, and an lsmod shows the netrom module
>> linked to the ax25 module.
>>
>> My nrports and nrbroadcast files are set up.
>>
>> When I run nrattach, it says the nr0 port is assigned, but nothing
>> shows up in the ifconfig list. =A0Also, re-running nrattach shows it
>> trying to attach to nr0, indicating that the previous command did no=
t
>> work.
>>
>> I can't find any other error messages which would point me to what i=
s
>> going wrong.
>>
>> I'm using ax25-tools-0.0-10-rc2, and libax25-0.0.12-rc2.
>>
>> Any suggestions on what could be going wrong?
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
