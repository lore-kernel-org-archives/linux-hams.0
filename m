From: Stephane Fillod <f8cfe@free.fr>
Subject: Re: Remote Receiver
Date: Sun, 18 Jan 2004 22:41:57 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040118214157.GZ1054@charybde.local>
References: <400A8D01.18370.BEFEDEA@localhost>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <400A8D01.18370.BEFEDEA@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim - KC4HW <jim@kc4hw.net>
Cc: linux-hams@vger.kernel.org

Hi Jim,

On Sun, Jan 18, 2004, Jim - KC4HW wrote:
> Anybody been working on an interface for a TenTec RX-320D.  
> 
> I would like to be able to interface it with my Linux Red Hat 7.1, kernel 
> 2.4.18 and have remote access when I travel away from my home 
> station.  

Hamlib has support for the RX-320. The tentec backend is still in beta
stage, but the code is LGPL'd and support is good.
Hamlib is a library, but has CLI and perl/tcl/python bindings.

Note: Hamlib provides remote control, but no audio streaming. Some idea
can be taken from the IRLP project, gnomemeeting, RealAudio and such.

Please have a look at http://hamlib.org, and send question/reports to
hamlib-developer@lists.sourceforge.net mailing list.

Thanks,
Stephane - F8CFE
