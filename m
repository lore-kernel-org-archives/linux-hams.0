From: =?iso-8859-1?Q?Thomas_M=F8rch?= <thomas@juletraesfoden.dk>
Subject: Re: aprsd setup
Date: Sun, 7 Nov 2004 11:11:57 +0100
Message-ID: <001601c4c4b2$36c995a0$6402a8c0@laptop>
References: <001301c4c469$d56f7c40$6402a8c0@laptop> <20041107014458.GA3069@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-hams@vger.kernel.org

Hamish Moffatt wrote:
> On Sun, Nov 07, 2004 at 02:33:49AM +0100, Thomas - OZ2AFO wrote:
>> How would one do the right setup of both aprsdigi AND aprsd on the
>> same PC? (If that's needed to do both my jobs)
>
> You can run both just fine. Just run them. This requires that you are
> using the linux kernel's AX.25 with an appropriate device such as a
> TNC in KISS mode etc. (aprsdigi always requires that, while aprsd can
> use kernel AX.25 or drive the TNC (NOT in KISS mode) directly.)

Kernel ax25 is already running, and with aprsd! What confuses me, is that
apparently both aprsd and aprsdigi  uses the port "default" call (the one
from axports), as their source call. I can not specify different calls (or 
ssid's)
for the different programs. As I understand two programs can not use
the same ssid / call? Or can they?

>
> Are you connecting to it on the right port?
>
> Does the web status page say anything interesting? You can access it
> at http://[your server]:14501/

I connect to my own server on port 1313 with uiview. My own server is
connected to seccond.aprs.net on port 23, and to oz3acc.dyndns.org on
port 1313.

If I view the http status, it says that all is connected, even my uiview.

Should I use another port for "user" connections with ui-view? (It's a bit
confusing with 10 different ports that does allmost the same, but with a 
little
bit of difference for each of them, specialy when you are new to aprs)

/ Thomas 


