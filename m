From: "Andrew Bates" <abates@omeganetserv.com>
Subject: Re: Odd soundmodem problem
Date: Tue, 14 Jan 2003 00:07:22 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <002001c2bb9b$ad699ce0$0201a8c0@wcomnet.com>
References: <200301132113.48039.phil@spiderweb.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil <phil@spiderweb.com.au>, linux-hams@vger.kernel.org

> Tx: fm VK4BVM-0 to QST-0 UI  pid=CC
> E.....@.@.%`.........w.w.z..100e 3 ipp://10.0.0.1/printers/Colour ""
"EPSON
> Stylus COLOR 680" "Epson Stylus Color 680, Foomatic + gimp-print".
>
> Tx: fm VK4BVM-0 to QST-0 UI  pid=CC
> E..x..@.@.%v.........w.w.d..300e 3 ipp://10.0.0.1/printers/Dot_Matrix ""
> "Dot_Matrix" "Epson LQ-570+, Foomatic + epson".

Looks like you might have samba transmitting on your ax25 ports.... might
try either shuting samba off or limiting what interfaces it has access to.

Andrew

