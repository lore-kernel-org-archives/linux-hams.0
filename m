From: chuck gelm <chuck@gelm.net>
Subject: Re: Newbie: the easiest way to connect two PCs via HF radio
Date: Wed, 10 Aug 2005 09:21:50 -0400
Message-ID: <42F9FF6E.5060804@gelm.net>
References: <140.105.16.64.784501121.1123491712@webmail.katamail.com> <42F7C9B3.9060308@gelm.net> <140.105.16.64.424532175.1123577360@webmail.katamail.com> <42F9DCB8.2080207@gelm.net> <140.105.16.64.911782711.1123677477@webmail.katamail.com>
Reply-To: chuck@gelm.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <140.105.16.64.911782711.1123677477@webmail.katamail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: "liva@katamail.com" <liva@katamail.com>

liva@katamail.com wrote:
>>Is each PC/minicom/modem 8 bits?
>>Is each PC/modem matching in flow control
>>  (it should be hardware flow control for binary transfers) ?
>>Is 'clover' an 8 bit character set?
>>
>>HTH, Chuck
>>
> 
> The serial port setup in minicom in both the PCs is:
> &#9474; A -    Serial Device      : /dev/ttyS0  
> &#9474; B - Lockfile Location     : /var/lock                                
> &#9474; C -   Callin Program      :                                           
> &#9474; D -  Callout Program      :
> &#9474; E -    Bps/Par/Bits       : 9600 8N1                                 
> &#9474; F - Hardware Flow Control : No      
> &#9474; G - Software Flow Control : No  		
> 
> I tried with "Hardware Flow Control: Yes", too, and changing setting E and G.
> CLOVER transmissions are "transparent", sending all 8 data bits.
> Thanks again for your help,
> Marco

Dear Marco:

  IMHO, you must have hardware flow control for binary file transfers.
Although, if you can transfer ASCII files without overflow errors,
  binary file transfers would not have overflow errors either :-|

Both the PC (minicom) and the clover modem parameters must match.
Both must be using hardware flow control.
You did not mention the parameters of the modem(s).
Do the clover modems use hardware flow control?

Does the clover modem(s) come with software capable of binary file transfers?

http://64.233.167.104/search?q=cache:Zp8M4oTOy3sJ:www.halcomm.com/docs/e2004.pdf+clover+file+transfer&hl=en

HTH, Chuck



