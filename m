From: ggb112 <gerard.borg@anu.edu.au>
Subject: mkiss serial errors
Date: Wed, 19 Jan 2005 10:17:09 +1100
Message-ID: <41ED98F5.8080702@anu.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi all

I am trying to run mkiss directly over a serial wireless link and I plan 
to do FEC to fix up the lost bits. With
78% packet loss I only have a BER of .1%.. so it should be doable. I am 
using the inbuilt flex CRC to detect
packet errors. Packets are of arbitrary length up to mtu=150 and consist 
of 10 bit frames with 8 data bits
as is usual for mkiss. If there are no lost serial frames then I could 
probably do FEC.

However I notice that often  if there is a CRC error then the packet has 
1 or 2 less bytes than was trasnmitted. These
must have been dropped somewhere and I suspect that it was by the serial 
port receiving the data. However mkiss does not
seem to report serial errors.

To be specific, the snippet of code responsible for reporting serial 
errors in mkiss.c is as follows
(see ax25_receive_buf  inside mkiss.c)

        /* Read the characters out of the buffer */
        while (count--) {
                if (fp != NULL && *fp++) {
                        if (!test_and_set_bit(AXF_ERROR, &ax->flags))
                                ax->rx_errors++;
                        cp++;
                        continue;
                }

                kiss_unesc(ax, *cp++);
        }

The if(fp!=NULL && *fp++) statement is never satisfied. Here fp is a 
point to a pointer of serial error flags from tty_io.c .

I cannot understand from the man page for test_and_clear_bit how this 
all works. BTW this snippet of code is identical to that in slip.c


Does anyone know how to make this code report serial errors or if not: 
extract serial errors from mkiss or the kernel

Many thanks

Gerard Borg

