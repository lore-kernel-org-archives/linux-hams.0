From: Riley Williams <rhw@MemAlpha.Co.UK>
Subject: Re: KISS Mode
Date: Mon, 23 Feb 2004 16:21:48 +0000 (GMT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0402231619330.16431-100000@Consulate.MemAlpha.Co.UK>
References: <E6B40EBA0E7B31449C3C565C8ED2F2A00130E42A@spsrvr04.sp.gruposimoldes.pt>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <E6B40EBA0E7B31449C3C565C8ED2F2A00130E42A@spsrvr04.sp.gruposimoldes.pt>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cristiano Tavares - SP <Cristiano.Tavares@simoldesplasticos.pt>
Cc: Linux Ham Radio <linux-hams@vger.kernel.org>

Hi Cristiano.

> Is there any program that makes the tnc pass to kiss using the shell,
> just like KISSER was used in DOS?

Can't printf be used to do that? Assuming your TNC was on what DOS calls 
COM1 you'd use...

	printf 'KISS\r\n' > /dev/ttyS0

...to put it in KISS mode, wouldn't you?

Best wishes from Riley G7GOD / KB8PPG.

