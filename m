From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: Odd soundmodem problem
Date: Tue, 14 Jan 2003 13:31:39 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200301141331.39794.vk3bvp@qsl.net>
References: <200301132113.48039.phil@spiderweb.com.au>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200301132113.48039.phil@spiderweb.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Mon, 13 Jan 2003 22:43, Phil wrote:
> Hello All,

> Can anyone offer a suggestion as to why the following text is transmitted
> every thirty seconds? Also, receive no longer works and the PTT function
> doesn't work either.

I've never tried using a soundcard for ax25 in Linux, so can't help with those 
problems.

>
> The configuration hasn't changed, however in the mean time I have updated
> the system to Mandrake 9.0 and that may be the cause.
>
> Tx: fm VK4BVM-0 to QST-0 UI  pid=CC
> E.....@.@.%`.........w.w.z..100e 3 ipp://10.0.0.1/printers/Colour "" "EPSON
> Stylus COLOR 680" "Epson Stylus Color 680, Foomatic + gimp-print".
>
> Tx: fm VK4BVM-0 to QST-0 UI  pid=CC
> E..x..@.@.%v.........w.w.d..300e 3 ipp://10.0.0.1/printers/Dot_Matrix ""
> "Dot_Matrix" "Epson LQ-570+, Foomatic + epson".

Samba broadcasts. It's telling the rest of the network that you have shared 
printers available. The first match at 
http://www.google.com/linux?q=samba+broadcast+ax25&hl=en&lr=&ie=ISO-8859-1
tells you how to stop it.

-- 
Shane Deering   vk3bvp@qsl.net 	vk3bvp@vk3bvp.#sev.vic.aus.oc
http://www.qsl.net/vk3bvp/		Up 2 hours and 13 minutes 
Sent with KMail v1.4.1 on Tue Jan 14 13:18:30 EST 2003

