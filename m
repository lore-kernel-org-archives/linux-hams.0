From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Tue, 30 Jul 2002 12:38:51 +0300 (EETDST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10207301220190.2883-100000@saturn.trs.ntc.nokia.com>
References: <3D464AF2.8040506@btinternet.com>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3D464AF2.8040506@btinternet.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Flynn G7OCD <jason.flynn@btinternet.com>
Cc: linux-hams@vger.kernel.org

On Tue, 30 Jul 2002, Jason Flynn G7OCD wrote:

>   I'm aware fully of the reasons behind this, but when you are running
> a system with 13 AX25 ports you start running out of SSIDs for your
> services. I've had to start naming services with names that aren't
> valid callsigns like 'MARTCONV' and 'SDGBBS' because before long I'm
> going to have used all the SSIDs for ports...

Yep, this is definitely a problem.

We should try to get rid of the need for an unique callsign-ssid for each
AX.25 interface. In fact it might be possible already (with SO_BINDTODEV).

However I still strongly believe that we need (want) a separate callsign
for the L3 traffic. Ultimately it might be possible to use one callsign
for all L3 protocol traffic (NET/ROM, ROSE, IP). Then a typical system
could run with a minimum of two callsigns.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

