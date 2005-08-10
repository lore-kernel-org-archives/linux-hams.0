From: chuck gelm <chuck@gelm.net>
Subject: Re: Newbie: the easiest way to connect two PCs via HF radio
Date: Wed, 10 Aug 2005 06:53:44 -0400
Message-ID: <42F9DCB8.2080207@gelm.net>
References: <140.105.16.64.784501121.1123491712@webmail.katamail.com> <42F7C9B3.9060308@gelm.net> <140.105.16.64.424532175.1123577360@webmail.katamail.com>
Reply-To: chuck@gelm.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <140.105.16.64.424532175.1123577360@webmail.katamail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: "liva@katamail.com" <liva@katamail.com>

liva@katamail.com wrote:
 >>Does your scheme work if you bypass the radio portion?
 >>
 >>PC - HF modem - <> - HF modem - PC
 >>
 >
 > No, it doesn't, it's exactly the same. Using minicom, I'm only able to exchange files with 
ascii, but not with zmodem, xmodem, ymodem or kermit. I tried with ssh over slip, but it's too slow 
(the ping works in 10-17 seconds).

Is each PC/minicom/modem 8 bits?
Is each PC/modem matching in flow control
  (it should be hardware flow control for binary transfers) ?
Is 'clover' an 8 bit character set?

HTH, Chuck

