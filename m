From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Success! TWO questions remain
Date: Thu, 12 Dec 2002 22:54:30 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212122248330.4719-100000@oh2bns.ampr.org>
References: <200212120934.49608.n7ipb@koster.seatcp.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200212120934.49608.n7ipb@koster.seatcp.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, 12 Dec 2002, Ken Koster wrote:

> SSH does do encryption and optionally can do compression as well.  From
> the SSH man page " It (ssh) is intended to replace rlogin and rsh, and 
> provide secure encrypted communications between two untrusted hosts over an 
> insecure network."

SSH at least used to have a cipher option "none" that disables all 
encryption. It might require recompiling as the option is typically 
disabled to protect people who don't understand what it means...

I have used it many times combined with RSA authentication and compression 
and I always felt safe about not breaking the rules here in Finland. Of 
course I might have been wrong all the time... :)

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

