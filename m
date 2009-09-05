From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: AX25 help site
Date: Sat, 5 Sep 2009 19:04:00 +0300
Message-ID: <20090905160400.GH3807@mea-ext.zmailer.org>
References: <9923fd660908310727o354e03dqaf90abe05b4ea800@mail.gmail.com> <1251842807.8971.1.camel@w8iss-desktop> <4A9DA743.9090101@radagast.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A9DA743.9090101@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Platt <dplatt@radagast.org>
Cc: w8iss <w8iss@wideopenwest.com>, Linux-Hams <linux-hams@vger.kernel.org>

On Tue, Sep 01, 2009 at 03:59:15PM -0700, Dave Platt wrote:
...
>     The soundmodem will transmit the required
> number of complete bytes, padding out the last encoded byte with
> zero bits, before it encodes and sends the FLAG which starts the next
> packet.  As a result, a back-to-back packet transmission looks like
> 
>    FLAG-packet1-FLAG-zeros-FLAG-packet2-FLAG

The modulation leader (synch-up) is best sent as all zeros,
but inter-packet gaps should be subsequent FLAGs.
Of course a real receiver notes that "a back to back frame,
but it has bad CRC, discard it."

   zeros - FLAG - packet1 - FLAG (- FLAG ...) packet2 - FLAG - FLAG...

And by the way, things are not at byte-boundaries after transmission,
but they should be back again after HDLC de-stuffing.


I do think that soundmodem as it is now is over-engineered on configuration
department and very much lacking in documentation -- so much so that it is
extremely hard to use without that gui-tool (like when embedding it...)
My reasoning:  If you need GUI to configure something, and it is not some
grapics thing, then you are doing something wrong!

It really calls for heavy investment on configuration simplicity of
soundmodem.

73 de Matti, OH2MQK
