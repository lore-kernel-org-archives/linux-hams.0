From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: user soundmodem problems on Inspiron 8200 i810 chipset...
Date: Thu, 11 Mar 2004 11:30:03 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1078997403.1276.11.camel@oh2bns.ampr.org>
References: <20040310193645.GA3882@braddock.com>
	 <20040310215616.19500.qmail@radagast.org>
	 <20040310234111.GA19788@braddock.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040310234111.GA19788@braddock.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Thu, 2004-03-11 at 01:41, braddock@braddock.com wrote:

> So, if someone tells me how to modify the period and buffer sizes in
> soundmodem, I'll experiment and see if I can make the problem go away.

It's the ioctl(SNDCTL_DSP_SETFRAGMENT) call in soundcard/audioio.c.
This is from the OSS Programmers Guide (pp. 97-98):

  int arg = 0xMMMMSSSS;
  ioctl(audio_fd, SNDCTL_DSP_SETFRAGMENT, &arg);

  The argument to this call is an integer encoded as 0xMMMMSSSS 
  (in hex). The 16 least significant bits determine the fragment 
  size. The size is 2^SSSS. For example SSSS=0008 gives fragment 
  size of 256 bytes (2^8). The minimum is 16 bytes (SSSS=4) and 
  the maximum is total_buffer_size/2. Some devices or processor
  architectures may require larger fragments - in this case the
  requested fragment size is automatically increased.

  ...

  The 16 most significant bits (MMMM) determine the maximum number 
  of fragments. By default, the driver computes this based on 
  available buffer space. The minimum value is 2 and the maximum 
  depends on the total buffer space available for the device. Set
  MMMM=0x7fff if you don't want to limit the number of fragments.

I don't think changing the fragment size is a solution though as it
affects the real-time preformance of soundmodem...

-- 
Tomi Manninen / OH2BNS / KP20ME04

