From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Linux kernel 2.6.1-rc1 and USCC>4/ISA
Date: Sun, 4 Jan 2004 18:08:45 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040104180845.C5056@jeroen.pe1rxq.ampr.org>
References: <3FF6A1CA.9060003@geofizyka.pl> <20040103174125.A211@jeroen.pe1rxq.ampr.org> <3FF6F7C8.9000006@geofizyka.pl> <20040103202602.C211@jeroen.pe1rxq.ampr.org> <3FF7271D.2070103@geofizyka.pl> <20040104172838.A5056@jeroen.pe1rxq.ampr.org> <3FF842A1.7070300@geofizyka.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3FF842A1.7070300@geofizyka.pl>; from sp2ong@geofizyka.pl on Sun, Jan 04, 2004 at 17:43:13 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sp2ong@geofizyka.pl
Cc: Jeroen Vreeken <pe1rxq@amsat.org>, linux-hams@vger.kernel.org

On 2004.01.04 17:43:13 +0100 sp2ong@geofizyka.pl wrote:
> 
> Yes, I have applied these patches because without them I can't init USCC 
> card. After recompile new kernel 2.6.1.-rc1 with patches I can init USCC 
> card but in log I have some warnings about timer.

That's what the second patch is for :)
It should talk the warnings away.

Jeroen

