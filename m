From: Guido Trentalancia <iz6rdb@trentalancia.com>
Subject: Re: ax25-tools 0.0.10rc2 won't compile
Date: Thu, 10 Feb 2011 17:20:42 +0100
Message-ID: <1297354842.5039.6.camel@tesla.lan>
References: <AANLkTi=pyfVjOmvbbuXKtErQD6yYFw=+wAgYGAsnM06u@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=pyfVjOmvbbuXKtErQD6yYFw=+wAgYGAsnM06u@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Barrett <vk6fun@gmail.com>
Cc: linux-hams@vger.kernel.org

Hello Peter !

I think you don't need to compile anything in the hdlcutil/fl
subdirectory. Only the hdlcutil subdirectory needs to be compiled.

If I force compilation in hdlcutil/fl I get similar errors, but my
Makefiles by default won't compile anything there...

Manually edit the Makefile in hdlcutil to avoid compilation of the fl
subdirectory. It's probably a good temporary fix.

73,

Guido IZ6RDB

On Thu, 10/02/2011 at 17.51 +0800, Peter Barrett wrote:
> trying to compile with puppeee 504 (gcc 4.2.2, make 3.81) can anyone help me?
> 
> here is the show-stopper (actually there is a big page of similar
> undefined references):
> 
> /root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:379:
> undefined reference to `Fl_Valuator::step(double)'
> /root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:380:
> undefined reference to `Fl_Slider::bounds(double, double)'
> /root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:381:
> undefined reference to `Fl_Valuator::value(double)'
> collect2: ld returned 1 exit status
> make[3]: *** [xfsmmixer] Error 1
> make[3]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2/hdlcutil'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2'
> make: *** [all] Error 2
> 
> 73devk6fun
> pete
> north baandee
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


