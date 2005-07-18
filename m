From: oz6bl@amsat.dk
Subject: How to 'connect' two ax25 ports?
Date: Mon, 18 Jul 2005 11:54:11 -0000 (UTC)
Message-ID: <32786.83.73.68.20.1121687651.squirrel@www.amsat.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi

For various reasons I would like to use another radio connected to another
PC to transmit to the satellites GO-32 and AO-51. It is no problem to get
the frames to be transmitted to be sent to the other PC using ax25idp for
this.

My problems arise on the PC connected to the transmitter. Here I have to
find a method to get all data arriving on one port (as defined in
/etc/ax25/axports) to be sent out on another port. Perhaps this picture
illustrates the situation (best read using a monospaced font);

           -----------------
           |               |
           |  APPLIC ???   |
           |               |
axports -> | axip      asy |
           |---------------|
           |        |      |
           | ax25id | kiss |
           |        |      |
           -----------------
                |      |
    ethernet    |      |        -------
  ------>-------        --->----| TNC |

The data from the originating PC arrives over the ethernet and are
presented to applications as incoming data on port 'axip'. This data
should be sent to the TNC on port 'asy'

I havn't run across anything in the AX.25-HOWTO that could help me  -
except  writing my own program...

Any suggestions?

Best 73 de Bent/OZ6BL
