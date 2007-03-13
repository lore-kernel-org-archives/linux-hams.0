From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: APRS - protocol analysis of
Date: Wed, 14 Mar 2007 00:03:08 +0200
Message-ID: <20070313220308.GH3883@mea-ext.zmailer.org>
References: <45F703F8.1070802@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <45F703F8.1070802@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On Tue, Mar 13, 2007 at 08:05:12PM +0000, Richard Stearn wrote:
> Greetings all
> 
> I am in the process of creating a wireshark dissector for APRS.  My
> primary information source to date has been the APRS 1.01 spec,
> supplemented by the 1.1 & 1.2 errata.
> 
> I note when analysing packet captures that many of the position,
> object & item packets do not comform to the specification.  Is this
> me misreading the specification or what?

  Sanctifying APRS by calling it "protocol" is a bit much, but
  there are published specifications, and then there are experience
  based implementations that work more often...

  The APRS is a collection of ad-hoc message encodings without
  any sort of coherent protocol-id at wrapping AX.25 header.
  Using "this is UI frame" tagging at AX.25 level does not embed
  any sort of data about the protocol inside it.  Even TCP/IP
  in AX.25 UI frame has a sort of protocol ID, but APRS does not.
  Nobody has bothered to specify one at day one, and now it is way
  too late..

  There are couple excellent perl engines to decode APRS positions
  including MICe compressed variants.


> Thoughts please.
> -- 
> Regards
> 	Richard

73 de Matti, OH2MQK
