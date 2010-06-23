From: folkert <folkert@vanheusden.com>
Subject: need to do funky stuff with baycom_ser_hdx-module to be able to
	bring network device up
Date: Wed, 23 Jun 2010 14:02:42 +0200
Message-ID: <20100623120241.GJ15838@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: t.sailer@alumni.ethz.ch
Cc: linux-hams@vger.kernel.org

Hi,

It seems I need to rmmod/modprobe the baycom_ser_hdx module after I set
the hdlc settings to be able to bring up ip on the device. Is this a
known problem? 


Folkert van Heusden

-- 
Ever wonder what is out there? Any alien races? Then please support
the seti@home project: setiathome.ssl.berkeley.edu
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
