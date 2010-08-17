From: Bernard F6BVP <f6bvp@free.fr>
Subject: Re: netstat caused a SIGSEGV
Date: Tue, 17 Aug 2010 14:37:56 +0200
Message-ID: <4C6A82A4.4080804@free.fr>
References: <4C6944CD.1070003@free.fr> <20100816160046.GA3741@neskaya.eckenfels.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20100816160046.GA3741@neskaya.eckenfels.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Bernd Eckenfels <bernd-10@eckenfels.net>
Cc: linux-hams@vger.kernel.org, ecki@users.berlios.de, philb@users.berlios.de

Hi Bernd,

Actually, rose->state is determined by a state machine with
only defined ROSE_STATE_0 to ROSE_STATE_5.
So, there is no risk for an extraneous state to be selected.
The error was mine, when I first duplicated NetRom code to introduce
ROSE protocol in netstat.
The two submitted patch are complementary and should be both applied.
Thank you for considering my proposal.

Bernard



Le 16/08/2010 18:00, Bernd Eckenfels a =E9crit :
> On Mon, Aug 16, 2010 at 04:01:49PM +0200, Bernard F6BVP wrote:
>   =20
>> The present patch corrects this bug by initializing rose_state[]
>> correctly according to linux/include/net/rose.h
>>     =20
> Thanks, can you please also add a "unknown state" option in case the =
kernel
> adds new states?  Will integrate that to upstream CVS later this week=
=2E
>
> Greetings
> Bernd
>   =20
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
