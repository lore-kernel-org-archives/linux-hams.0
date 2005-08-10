From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Announcing Perl module for parsing APRS packets
Date: Wed, 10 Aug 2005 08:56:19 -0700 (PDT)
Message-ID: <Pine.SUN.4.58.0508100852220.1839@eskimo.com>
References: <8ea83f405080514263ae2ec3d@mail.gmail.com>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <8ea83f405080514263ae2ec3d@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Laughlin <jeff.laughlin@gmail.com>
Cc: Linux-Hams@vger.kernel.org

On Fri, 5 Aug 2005, Jeff Laughlin wrote:

> I've written a Perl module, Ham::APRS::Parser, for parsing APRS
> packets, and I've released it under the GPL. You can find it here:
> http://aprs.n1ywb.com/Ham-APRS-Parser-0.01/
>
> It takes the packet string, parses it, and returns a hash with the
> data in a consistent and easy to process format. Currently it reliably
> returns position, from and to calls, digi-path, symbols, and Mic-E
> status reports from normal position reports, compressed position
> reports, and Mic-E position reports. More work is needed to fully
> implement the APRS protocol.

Have you considered tracking down the Perl code that Ian (the APRS
spec editor) created which decodes packets?  That was quite
complete and fully decoded everything similar to the "listen"
command.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
