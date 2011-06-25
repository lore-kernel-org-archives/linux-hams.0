From: f6bvp <f6bvp@free.fr>
Subject: New F6FBB BBS version 7.05c05
Date: Sat, 25 Jun 2011 15:16:18 +0200
Message-ID: <4E05DFA2.50800@free.fr>
References: <1435072589.76970.1308874445407.JavaMail.root@sz0020a.emeryville.ca.mail.comcast.net> <4E04175A.4000401@bigpond.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E04175A.4000401@bigpond.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Hi,

Here is a new version of F6FBB BBS with a few changes described in=20
CHANGES file :

7.05c5 (F6BVP)
- Charley K4GBB asked "With todays RTC clocks and NTP servers is there=20
still a need to freeze the Housekeeping
   process because the last check failed ?". Corrected. epurmess no mor=
e=20
checks the date of epurmess.res.
- "Official libax25" introduced a new feature in ax25_ntoa() function=20
removing SSID 0 in callsigns when present.
   This has been a major source of AX.25 application programs dysfuncti=
ons.
   A new local function _ax25_ntoa() is used by FBB to avoid such issue=
s.

KNOWN BUGS under investigation

- Barry VK2AAB reported that he has a 300bd HF partner who does not wan=
t=20
7+ files.
   However he found that "J 0" in forward file does not work. 7+ files=20
should not be sent.

Meanwhile sysops are encouraged to use "J 2" parameter that will limit=20
7+ file forward to personal data.

http://f6bvp.free.fr/logiciels/BBS-f6fbb/xd705c05-src.tar.bz2

73 de Bernard, f6bvp


Le 24/06/2011 06:49, Barry a =E9crit :
> Hello Paul,
>                  Yes 5c04 is OK I am runnig it now.
>
> Barry VK2AAB
>
> Paul Brown wrote:
>> Hello Bernard,
>>
>> I was going to set up another computer with xdfbb, but I see the
>> source for xd705b is no longer available. Is xd705c04 the best sourc=
e
>> to use right now?
>>
>> Thank you
>>
>> 73, Paul - N6RME
>>
>> ----- "f6bvp" <f6bvp@free.fr> wrote:
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
