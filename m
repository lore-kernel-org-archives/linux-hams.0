From: Jason Flynn G7OCD <jason.flynn@btinternet.com>
Subject: Re: Using Kenwood D7 with Linux AX.25
Date: Mon, 05 Aug 2002 07:39:04 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D4E1D88.1050904@btinternet.com>
References: <310796010.1028327096@[192.168.1.4]> <3D4E100E.4020702@merck.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Milan <milank@merck.cz>
Cc: linux-hams@vger.kernel.org

Milan wrote:

> last week, I bought the TH-D7E(G) with the new firmware (v. 2).
> I succeeded to configure it with mkiss and kissattach (no success with 
> kissattach alone), RX and TX functional on 9k6.

For a short while.... Depends what you're sending. Try some IP... you
might be lucky with a telnet for a bit but after the TCP seq number
rolls around a bit then it will lock up. Try an FTP with plenty of
KISS octets with the top bit set and it will lock much sooner..

> Small problem - it just receives two frames at once, the third one is 
> rejected.

Sounds about right..

Look people, just give up on this... IT DONT WORK ! and as
M Taylor wrote, go read my previous post on why.

	73
		Jason

