From: chuck gelm <chuck@gelm.net>
Subject: Re: Newbie: the easiest way to connect two PCs via HF radio
Date: Mon, 08 Aug 2005 17:08:03 -0400
Message-ID: <42F7C9B3.9060308@gelm.net>
References: <140.105.16.64.784501121.1123491712@webmail.katamail.com>
Reply-To: chuck@gelm.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <140.105.16.64.784501121.1123491712@webmail.katamail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "liva@katamail.com" <liva@katamail.com>
Cc: linux-hams@vger.kernel.org

liva@katamail.com wrote:
> I have to connect two PCs in this way:
> PC - HF modem - HF radio - cable with load - HF radio - HF modem - PC
> 
> The PCs work with Ubuntu 4.10, the HF modems are Halcomm DSP4100, the radios ICOM IC-707. Which is the easiest-to-use opensource free software to make the link works? I want only to be able to exchange files, I tried with minicom, SSH, and something else, but nothing works... Thank you for your help,
> Marco Liva
> 
> ________________________________________________________________________
> Cerchi un laboratorio fotografico aperto 24 ore su 24?
> Stampa le tue foto digitali su Kataweb e le ricevi a domicilio in 48 ore.
> http://www.kataweb.it/foto

Dear Marco Liva:

IMHO, 'ftp[d]',
  if you configure networking in the two PCs and
  the 'HF Modems' can be configured as network devices
else
  'xastir'
  but this may not be 'easy'. ;-)

Does your scheme work if you bypass the radio portion?

PC - HF modem - <> - HF modem - PC

HTH, Chuck

