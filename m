From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: Tracking down a Linux crash
Date: Wed, 16 Oct 2002 17:20:31 +0300 (EETDST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10210161715280.585-100000@saturn.trs.ntc.nokia.com>
References: <4049232.1034760354@WUSJA129861-8HP>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4049232.1034760354@WUSJA129861-8HP>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Ackermann N8UR <jra@febo.com>
Cc: linux-hams@vger.kernel.org

On Wed, 16 Oct 2002, John Ackermann N8UR wrote:

> I don't think it's heat as the crash sometimes occurs relatively quickly 
> after powerup, and other times after days of running.  The CPU is not being 
> overclocked, and has an original AMD heatsink/fan, plus there's a fan on 
> the case.  However, I'm not monitoring CPU temperature in the system (don't 
> have that software installed yet) so I can't say for sure what the temp is.

Have you tried beating your system hard with something like Cerberus
(search google with key words "cerberus" and "ctcs") with the system
running in text mode? Cerberus was the only program to reliably report
memory failures on my new box half a year ago. All the others (including
memtest86) showed no errors, but still I had occasionally lockups and
programs crashing. A new memory module fixed everything.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

