From: "Ruben Navarro Huedo" <eb5esx@eb5esx.ampr.org>
Subject: Re: Netrom...broadcast to 2 ports.
Date: Thu, 11 Mar 2004 15:12:44 +0100 (CET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <7584.194.140.66.170.1079014364.squirrel@palotes.com>
References: <60881.194.140.66.170.1079010208.squirrel@palotes.com>
    <53569.212.209.129.2.1079010416.squirrel@www.ax25.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <53569.212.209.129.2.1079010416.squirrel@www.ax25.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pontus Falk <pfalk@ax25.org>
Cc: linux-hams@vger.kernel.org

This is my axports:

# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
439500  EA5RKE-10       19200   236     3       439.500
144975  EA5RKE-11       19200   236     3       144.975
xnet    EA5RKE-12       38400   236     7       Xnet
nos     EA5RKE-13       38400   236     7       Nos


I want broadcast to nos and xnet, but if i add another line below the one
of nos , it is ignored.
Pontus Falk dijo:
> Hi!
>
> What does you axports look like?
>
> //Pontus
>
>> Hello friends:
>> I am trying to broadcast netrom frames to two ax25 ports using netromd.
>>
>> # /etc/ax25/nrports
>> #
>> # The format of this file is:
>> #
>> # name callsign alias paclen description
>> #
>> netrom  EA5RKE-3 RKENOD 235     Puerto Netrom
>>
>> # /etc/ax25/nrbroadcast
>> #
>> # The format of this file is:
>> #
>> # ax25_name min_obs def_qual worst_qual verbose
>> #
>> nos     1       200     100     1
>>
>> If i add another port in nrbroadcast, only broadcasts to the first port.
>>
>> Using Debian/woody:
>> linux:/etc/ax25# dpkg -l | grep ax25
>> ii  ax25-apps      0.0.6-1        Applications for AX25
>> ii  ax25-tools     0.0.8-2        AX-25 Tools
>> ii  libax25        0.0.10-1       ax25 libraries for hamradio
>> applications
>> ii  libax25-dev    0.0.10-1       ax25 library development files
>> linux:/etc/ax25#
>>
>> Any help?
>>
>> Thank's.
>>
>>
>>
>> --
>> Ruben Navarro Huedo
>> eb5esx (arroba) eb5esx.ampr.org
>> http://www.cabodesantapola.org
>> -
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>
> --
> Best regards,
>
> Pontus Falk
>


-- 
Ruben Navarro Huedo
eb5esx (arroba) eb5esx.ampr.org
http://www.cabodesantapola.org
