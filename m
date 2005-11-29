From: Thomas Sailer <sailer@sailer.dynip.lugs.ch>
Subject: Re: Soundmodem installation problem
Date: Tue, 29 Nov 2005 09:13:51 +0100
Message-ID: <1133252031.5850.65.camel@unreal>
References: <438BE0FE.1090501@irock.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <438BE0FE.1090501@irock.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vk4akm@wia.org.au
Cc: linux-hams@vger.kernel.org

On Tue, 2005-11-29 at 15:02 +1000, vk4akm wrote:
> G'day Folks
> 
> This may seem an absolutely stupid question, but when I try to configure 
> the soundmodem on my recently installed Debian system
>  using the soundmodemconfig command I get an error message "Cannot load 
> courier".
> My understanding is that courier is something to do with mail, what has 
> this to do with the soundmodem?

grep is your friend ;-)

GdkFont *font = gdk_font_load("-*-courier-medium-r-normal-*-*-120-*-*-m-*-*-*");
if (!font) {
        g_printerr("Cannot load courier\n");
}

It tries to load the font named courier, and fails. Courier is
supposedly available everywhere...

> The soundmodemconfig internal diagnostics has "Cannot start audio IO" 
> error message.

For some reason it cannot start get the audio driver to do what it
wants. You need to provide more info, eg. what audio driver, soundmodem
version, strace etc.

Tom


