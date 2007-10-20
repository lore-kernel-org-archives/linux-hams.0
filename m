From: Erik Jakobsen <erik_ja@mail.tele.dk>
Subject: Re: TNC3
Date: Sat, 20 Oct 2007 11:42:29 +0200
Message-ID: <4719CD85.9010108@mail.tele.dk>
References: <4718F3B1.1020401@pi4cc.nl> <4719CDDB.3030604@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4719CDDB.3030604@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Bernard Pidoux wrote:
> Hi Peter,
>
>
> Your info is absolutely right.
>
> However, you should put your TNC into kiss mode manually i.e. using a
> terminal program to instruct it to change into kiss mode (see the
> TNC3S manual).
>
> Communicating with the terminal program through serial port with TNC
> is only possible if AX25 driver is NOT loaded.
>
> Then the order of operation is :
>
> Enter into your terminal program.
> Choose the appropriate port and speed.
> Reboot your TNC3S in order to make it detect your serial port speed
> when pressing ENTER key (autobaud routine when TNC powerer up).
>
> Type the commands :
>
> INTFACE TERM  and press return
>
> At this point you can monitor incoming traffic on both ports.
>
>
> INTFACE KISS and press return
> RESET        and press return
>
>
> Now your TNC is in kiss mode and you cannot communicate any more via
> the terminal program. You will only see garbage on the screen.
>
> You can now load the AX25 mkiss driver and continue with AX25
> applications.
>
>
> Note ; since I did not perform these commands for years (I left my
> TNC2 in KISS mode forever) I may have forgotten the syntax) I do not
> remember the name of Linux simple serial communication program...
>
> 73 de Bernard, f6bvp
>
>
> Peter wrote:
>> Hi
>>
>> I'am looking for support to get a TNC3S with 2 modem working
>> With standard kissattach I got modem 1 on the air.
>>
>> In the ax25 how-to I found:
>> If you have a dual port tnc and it is connected to
>> your /dev/ttyS0 serial device at 9600 bps,
>> the command:
>> /usr/sbin/mkiss -s 9600 /dev/ttyS0 /dev/ptyp0 /dev/ptyp1
>> /usr/sbin/kissattach /dev/ttyp0 port1
>> /usr/sbin/kissattach /dev/ttyp1 port2
>>
>> But none of the modem do work
>> Who has a TNC3S running ?
>>
>> Peter
>> PC2A
>> -
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
minicom is the program :-)
