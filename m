From: Nate Bargmann <n0nb@networksplus.net>
Subject: Re: Announcing Perl module for parsing APRS packets
Date: Tue, 9 Aug 2005 20:30:41 -0500
Message-ID: <20050810013041.GC3204@mail.networksplus.net>
References: <8ea83f405080514263ae2ec3d@mail.gmail.com> <62046.80.3.246.170.1123622205.squirrel@www.otcgaming.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <62046.80.3.246.170.1123622205.squirrel@www.otcgaming.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

> > Hello,
> >
> > I've written a Perl module, Ham::APRS::Parser, for parsing APRS
> > packets, and I've released it under the GPL. You can find it here:
> > http://aprs.n1ywb.com/Ham-APRS-Parser-0.01/
> >
> > It takes the packet string, parses it, and returns a hash with the
> > data in a consistent and easy to process format. Currently it reliably
> > returns position, from and to calls, digi-path, symbols, and Mic-E
> > status reports from normal position reports, compressed position
> > reports, and Mic-E position reports. More work is needed to fully
> > implement the APRS protocol.

Perhaps it can be included in CPAN?

73, de Nate >>

-- 
 Wireless | Amateur Radio Station N0NB          |  Successfully Microsoft
  Amateur radio exams; ham radio; Linux info @  | free since January 1998.
             http://www.qsl.net/n0nb/           |  "Debian, the choice of
             My Kawasaki KZ-650 SR @            |     a GNU generation!"
        http://www.networksplus.net/n0nb/       |   http://www.debian.org
