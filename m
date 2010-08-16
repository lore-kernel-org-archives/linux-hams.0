From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: Re: Looking for Packet Radio Software
Date: Mon, 16 Aug 2010 13:31:46 -0400
Message-ID: <4C697602.3010301@w1nr.net>
References: <000001cb3d62$c36ad940$4a408bc0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000001cb3d62$c36ad940$4a408bc0$@com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: john paterson <jpaterjr@gmail.com>
Cc: linux-hams@vger.kernel.org

I am not up on the latest Ubuntu package management but try adding this
repository and browsing through the packages available for native Linux
packet software rather than the "wine" method.

http://download.opensuse.org/repositories/hamradio:/debian/xUbuntu_10.04/

If they are the same packages they build for openSUSE then you will find
a number of programs that utilize the built in AX.25 stack in the kernel.

Mike, W1NR


On 08/16/2010 12:47 PM, john paterson wrote:
> Hi, all...
>
> I just joined the mailing list. I have looked through a lot of the archives
> and not found the information I am looking for, so I will try here. I have a
> computer running Ubuntu 10.04 and would like to use it for packet radio. I
> have tried Airmail and Outpost Packet Manager, both in Wine, but neither
> works well. Airmail works for one interchange then apparently messes up the
> the TNC (a KPC3), so that I have to reset the TNC to use it again on
> Windows. Outpost PM seems to communicate with the TNC OK, in the serial
> terminal, but never shows outgoing or incoming characters in the terminal
> window, and does not properly communicate with the TNC when trying to
> send/receive from the packet manager.
>
> Can anyone help me with the proper setup for Airmail or Outpost PM, or
> suggest other terminal software for packet operation with a KPC3 TNC?
>
> Thanks in advance..
>
> 73 de John, KC5LAA
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   

