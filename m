From: linux@lightfox.demon.co.uk (Gareth Rowlands)
Subject: Re: Getting a ROSE address?
Date: Thu, 31 Oct 2002 21:08:43 GMT
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021031.210843.93@lightfox.demon.co.uk>
References: <067a01c28016$38bafe90$bdc15882@msa014>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <067a01c28016$38bafe90$bdc15882@msa014>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nfiler@cs.man.ac.uk, linux-hams@vger.kernel.org

On Wed, 30 Oct 2002 13:14:04 -0000, nfiler@cs.man.ac.uk said:

> I have searched but failed to find how to obtain the 10 digit ROSE
> address for my machine.

> Do I just generate a random number - I know the first 4
> digits (the DNIC) need to be locally allocated.

If I've got it right - ROSE was done on DNIC and phone numbers

The first four digits (DNIC) for the UK is 2340

The last six digits should made up of your three digit 'area'
code then three digit 'exchange' code.

From the phone numbers in your sig block, I guess your last
six digits are 161 - from the Manchester all-figure area STD
code 0161, and the 275 from your local exchange making your
ROSE address:

2340161275

I guess it goes to ashes out in the shires.

73, Gareth.

Reference: "The ROSE X.25 Packet Switch" Thomas A.Moulton W2VY
           ARRL 8th Computer Networking Conference

