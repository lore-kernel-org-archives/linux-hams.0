From: "Robert Jenkins" <raj@jrw.co.uk>
Subject: RE: Status of AX.25 in 2.5 / 2.6
Date: Mon, 29 Jul 2002 18:45:20 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <000001c23727$b5a18970$e239832c@jrws2>
References: <Pine.HPX.4.10.10207291757180.25868-100000@saturn.trs.ntc.nokia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.HPX.4.10.10207291757180.25868-100000@saturn.trs.ntc.nokia.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tpm@prkele.tky.hut.fi, linux-hams@vger.kernel.org

Hi Tomi,

Thanks for the info on callsign useage and the netrom 'oddities'.

I must admit that I'm not that well up on the details of netrom
encapsulation.

My only thought re. the problem you mention with the SABM frame not
having a protocol ID is that surely this applies equally to IP via ax25
etc.? 

Is there no mechanism here that can be duplicated for Netrom? 
(And apologies in advance if I'm talking total rubbish :)




Ps. One mod to the utils which I'm in the process of implementing
myself, if it is of interest to anyone else:

An addition to mheardd / mheard, in combination with the 'distance.c'
code from DigiNed by Henk, PE1DNN, to give distance & bearing to any
station with recognisable location info in it's beacon.

This is a feature I saw in a demo of the Dos PZT Node software by Paula,
G8PZT. I thought it was a rather neat idea & worth adding to the Linux
utils.


Regards,

Robert Jenkins, G8TBF.




