From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: soundmodem on laptop.. receive working, xmit not working.
Date: Fri, 23 Jan 2004 13:01:00 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1074855660.1306.3.camel@oh2bns.ampr.org>
References: <20040122205731.5638d4df.washer@trlp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040122205731.5638d4df.washer@trlp.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Washer <washer@trlp.com>
Cc: linux-hams@vger.kernel.org

On Fri, 2004-01-23 at 06:57, James Washer wrote:

>     <chaccess txdelay="400" slottime="100" ppersist="40" fulldup="1" txtail="10"/>
>     <audio type="soundcard" device="/dev/dsp" halfdup="1"/>

Not sure if this is related to your problem but you have the fulldup/ 
halfdup settings wrong. For channel access you probably want 
fulldup=0 (ie. don't transmit if channel is busy) and for audio you
want halfdup=0. Half duplex audio io is probably a bad idea as it
can increase the rx/tx turnaround time.

-- 
Tomi Manninen / OH2BNS / KP20ME04

