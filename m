From: folkert <folkert@vanheusden.com>
Subject: mkiss interface
Date: Fri, 29 Jan 2016 23:09:46 +0100
Message-ID: <20160129220946.GN24591@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

I'm trying to get AX.25 packets from the kernel and to send other AX.25
packets into it.
I would like to do so via the mkiss interface.

Am I right that the mkiss interface expects:
- 1 byte:
  - upper nibble: 
      0x20: flexnet crc
      0x80: smack crc
  - lower nibble:
      0x00: data frame
      0x01: tx delay
      [etc]
- x bytes: ax.25 packet
- 2 bytes CRC

And am I right that it this is the same for packets going into mkiss and
coming out of it?

Thanks!


Folkert van Heusden

-- 
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
