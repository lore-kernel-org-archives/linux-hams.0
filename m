From: Collin Hockey <hockeyc@umich.edu>
Subject: Re: mkiss in ubuntu kernels?
Date: Thu, 10 Sep 2009 22:48:41 -0400
Message-ID: <3013ad3b0909101948w7bec17bbg71d7124afa9667ff@mail.gmail.com>
References: <3013ad3b0909101544p7eed537fudd5fb92a681a4d44@mail.gmail.com>
	 <92FB22CE-A35E-42D3-9623-2E0C5178E5F0@columbia.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=nfENYu6XUda76AGr0hzlbbiL/QaCiBlMRzTKzRE5c+4=;
        b=JDO7d07HxT+bPJcE7enG8aBKBG/YTCBQTBLF/w96IfKy+5NmNHu8ek+NuwmWuiGVfl
         jhnaP0it3VEYD/tiBpLm81efLdYtnR9tuMo28w1nr+XNzNDslftYeFhRWsf7wZCGL2BA
         dLTMJ77HaPOjom+1yZw0QckopOIICZY05Aw/Q=
In-Reply-To: <92FB22CE-A35E-42D3-9623-2E0C5178E5F0@columbia.edu>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alan Crosswell <alan@columbia.edu>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

I was looking at the information in the mkiss man page
(http://linux.die.net/man/8/mkiss), it seems to claim to be the one
attached to the physical serial port, routing KISS frames through two
or more pseudo ttys whose slave ends are attached with kissattach to
separate ax.25 network interfaces.

Am I really confused?

On Thu, Sep 10, 2009 at 10:39 PM, Alan Crosswell <alan@columbia.edu> wr=
ote:
> You only kissattach once; =A0if the TNC supports mkiss then the port =
is
> encoded in the kiss header for each packet.
> /a
>
>
> On Sep 10, 2009, at 6:44 PM, Collin Hockey <hockeyc@umich.edu> wrote:
>
>> Hi everyone, and thanks in advance for any help.
>>
>> I've been working for the past several days on getting a Kantronics
>> 9612 paired with an iCom IC-910 for packet communication over KISS
>> working using the linux AX.25 stack. I have successfully set up
>> kissattach and related utilities to be able to send data back and
>> forth at 1200 baud.
>>
>> I also need to communicate at 9600 baud. For the Kantronics TNC, thi=
s
>> requires talking to the radio over Port 2. My current understanding =
is
>> that packet routing is done using parts of the KISS protocol and tha=
t
>> this is achieved by using mkiss to split the physical serial port in=
to
>> two pseudo ttys, which I can then use kissattach on separately to ta=
lk
>> to each port.
>>
>> All of the documentation I have been able to find though assumes the
>> old style psuedo-tty setup, where master and slave pairs are numbere=
d,
>> and plenty are pre-loaded by the kernel for use by user programs.
>> However, at least in my kernel (2.6.28), the client program is
>> supposed to request the single pseudo-tty master file, and the kerne=
l
>> creates a new slave for each connection. There tends to be a pile of
>> these in my pseudo-tty slave directory, so I never know which one to
>> connect to. We do need to automate and script most of these
>> connections, so I do need to reliably be able to tell which slave tt=
y
>> I need to connect to.
>>
>> Hopefully I've explained the problem well enough to be understood, a=
nd
>> I would appreciate any help or suggestions you might have.
>>
>> Thanks again,
>> Collin Hockey
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
