From: =?iso-8859-1?Q?Thomas_M=F8rch?= <thomas@juletraesfoden.dk>
Subject: Re: aprsd setup
Date: Sun, 7 Nov 2004 21:18:16 +0100
Message-ID: <000501c4c506$ea6f87f0$6402a8c0@laptop>
References: <001301c4c469$d56f7c40$6402a8c0@laptop> <20041107014458.GA3069@cloud.net.au> <001601c4c4b2$36c995a0$6402a8c0@laptop> <20041107102025.GA5684@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=original"
To: linux-hams@vger.kernel.org

Hamish Moffatt wrote:
> On Sun, Nov 07, 2004 at 11:11:57AM +0100, Thomas M=F8rch wrote:
>
> They can't for connected traffic (as I understand), but it's no
> problem for unconnected/UI traffic. I don't believe you can specify
> different calls at all... though my memory is fading a bit in this
> area!

Ok I'll try to let it run both programs for a while and investigate the=
 logs
to see if it works :-)

>> I connect to my own server on port 1313 with uiview. My own server i=
s
>> connected to seccond.aprs.net on port 23, and to oz3acc.dyndns.org o=
n
>> port 1313.
>>
>> If I view the http status, it says that all is connected, even my
>> uiview.
>
> Does it show any packets counted?

It shows recieved packets from both internet hosts, that it is connecte=
d
to.. But 0 for my uiview client


>> Should I use another port for "user" connections with ui-view? (It's
>> a bit confusing with 10 different ports that does allmost the same,
>> but with a little
>> bit of difference for each of them, specialy when you are new to
>> aprs)
>
> I would suggest 14579 perhaps, 1313 is the link port used to connecte=
d
> aprsd IGATEs together only (if memory serves).

I have switched to 14579, but still no activity...

hmm.. wait a moment, just tried port 10151 (mainport with history), and=
 it
works. At least I get the history from the server.. So seems like that
problem is solved now..

Regards
Thomas



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
