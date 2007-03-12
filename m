From: "Stephen Brown Jr" <stephen.brown75@gmail.com>
Subject: Problems using MKISS
Date: Sun, 11 Mar 2007 20:05:33 -0400
Message-ID: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        b=Q4J7MJSfAWNEukLkl9eRSAH68s559ns/AfZAGB0ZqHQn/nTOHvIHHsbB1JTba9FV2EfLzozBS6N3HeE0QRMxhKGBPO9OClG5BWNgzboF+vxboe6WyLAv8jpNtmg2tVs+Rl15KSvOmWDNgZVgghQn+ObaWcm3eMiMAyKq3wD6+6E=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I am trying to share a KISS tnc on a serial port for APRS and MKISS
seems to be the way to do it, but I can't get it work for whatever
reason. I have two machines, Im using AXIP to carry traffic back and
forth between them. Here is my setup:

Debian linux "Sarge" 3.1 using stock 2.4 kernel (this the box the TNC
is located on)
KISS mode TNC on /dev/ttyS4, AX25 and MKISS modules loaded and working
Ran mkiss -s 9600 /dev/ttyS4 /dev/ptyp0, then ran kissattach
/dev/ttyp0 aprs 192.168.1.6, port successfully binds to ax0

I have ax25ipd setup to go to my other machine using udp, port 415. I
am able to pass AX.25 traffic between both machines no problem, but
when I start up ax25ipd on the box with the tnc on it, I got this:

fetching tty device parameters: Invalid argument

I was following section 6.1.1.1 of this as a guide in setting this up
(the MKISS section):

http://www.faqs.org/docs/Linux-HOWTO/AX25-HOWTO.html

Should this work as intended? In the end I want a bidrectional AXIP
link between the two machines that will share the TNC.

Stephen
N1VLV
