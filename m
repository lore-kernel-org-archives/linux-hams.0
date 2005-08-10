From: "liva@katamail.com" <liva@katamail.com>
Subject: Re: Newbie: the easiest way to connect two PCs via HF radio
Date: Wed, 10 Aug 2005 12:37:57 +0000
Message-ID: <140.105.16.64.911782711.1123677477@webmail.katamail.com>
References: <140.105.16.64.784501121.1123491712@webmail.katamail.com>
 <42F7C9B3.9060308@gelm.net>
 <140.105.16.64.424532175.1123577360@webmail.katamail.com>
 <42F9DCB8.2080207@gelm.net>
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42F9DCB8.2080207@gelm.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: chuck@gelm.net
Cc: linux-hams@vger.kernel.org

> Is each PC/minicom/modem 8 bits?
> Is each PC/modem matching in flow control
>   (it should be hardware flow control for binary transfers) ?
> Is 'clover' an 8 bit character set?
> 
> HTH, Chuck
> 
The serial port setup in minicom in both the PCs is:
&#9474; A -    Serial Device      : /dev/ttyS0  
&#9474; B - Lockfile Location     : /var/lock                                
&#9474; C -   Callin Program      :                                           
&#9474; D -  Callout Program      :
&#9474; E -    Bps/Par/Bits       : 9600 8N1                                 
&#9474; F - Hardware Flow Control : No      
&#9474; G - Software Flow Control : No  		

I tried with "Hardware Flow Control: Yes", too, and changing setting E and G.
CLOVER transmissions are "transparent", sending all 8 data bits.
Thanks again for your help,
Marco

________________________________________________________________________
Cerchi un laboratorio fotografico aperto 24 ore su 24?
Stampa le tue foto digitali su Kataweb e le ricevi a domicilio in 48 ore.
http://www.kataweb.it/foto


