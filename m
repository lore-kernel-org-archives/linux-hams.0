From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Debian 5.0
Date: Mon, 9 Mar 2009 13:11:50 -0700 (PDT)
Message-ID: <alpine.LNX.1.10.0903091305150.10297@wapiti2.we7u.net>
References: <49B4F318.1010106@xnet.co.nz>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <49B4F318.1010106@xnet.co.nz>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Peter Mallett <zl2bau@xnet.co.nz>
Cc: linux-hams@vger.kernel.org

On Mon, 9 Mar 2009, Peter Mallett wrote:

>        I have just installed Debian 5.0 and I noticed the processor usage is 
> higher than that of Debian 4.0.
>
> Currently Debian 5.0 is running at 24 percent and up to 100 percent when 
> playing a video using "Movie Player" and about 54 percent when using "vlc 
> player"
>
> The result on Debian 4.0 is only 6 percent even when playing a video.
>
> The computer is an AMD 2400+
>
> Any thoughts ?

*) Run "top" and see what the big CPU users are.  Perhaps you can
    uninstall or disable some daemons.

*) Perhaps some libraries changed and now take more CPU to do the
    same thing.

*) Have you configured your video driver for your particular card
    and monitor?  Is it set for higher resolution or more bits per
    pixel than before?  I usually set mine to 16-bit color which is
    two bytes per pixel.  Default is usually 24-bit (3 bytes/pixel)
    or 32-bit (4-bytes/pixel) color.

*) Have you installed a special video driver for your card or are
    you using the generic drivers?  I gain a substantial gain in
    speed and 3D mode when I use the proper driver.

*) Run "glxgears" before/after each change to see if frames/second
    is degrading or improving.

Note:  I don't run Debian, but your questions apply equally well to
any Linux distribution.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
