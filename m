From: John Coppens <john@jcoppens.com>
Subject: Re: Norm Frequency beacon ?
Date: Thu, 27 May 2004 18:51:39 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040527185139.19c2100b.john@jcoppens.com>
References: <20040527181010.31462.qmail@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040527181010.31462.qmail@radagast.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Platt <dplatt@radagast.org>
Cc: linux hams news group <linux-hams@vger.kernel.org>

On 27 May 2004 18:10:10 -0000
"Dave Platt" <dplatt@radagast.org> wrote:

> > NMEA perhaps? Given a long enough calibration period this might well
> > be precise enough... Does anyone know the timing of the NMEA output?
> > Is it aligned to the PPS?
> 
> That seems to depend on the GPS receiver in question.  As far as I can
> tell, there's no requirement that it be well-synchronized, and on one
> simple GPS board I bought a few years ago there's no dependable
> synchronization.

Surely not... I have used GPS for experiments with G3PLX's chirp project
and finally gave up trying to get the NMEA output reliably related to the
PPS pulses. Your luck may vary, mine was a Trimble GPS. I understand the
PPS is hardware generated, and the NMEA depends on the algorithms.

You may have much better results with the TSIP protocol, which can be sent
much more frequently (times/sec). I understand that the relationship
TSIP/PPS is more reliable too. I thought that this protocol was
Trimble-only, but I've read somewhere other manufacturers also support it.

I finally identify the PPS pulse using the PC's clock - which is sync'd to
the internet using the 'chronyd' daemon.

John
