From: "Jeremy Utley" <jeremy@jutley.org>
Subject: RE: Kernel 2.4.20
Date: Thu, 24 Jul 2003 00:57:49 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <PEEBJGCPPGPJPGIFDLPJOEANCAAA.jeremy@jutley.org>
References: <200307241319.24240.djmunn@bigpond.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200307241319.24240.djmunn@bigpond.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org



> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org]On Behalf Of David Munn
>
>
>
> Hi All......have been putting Slackware 9.0 onto a 2ghz h/d
> for use with
> packet......i set it up with all the ax25 progs....libax25...ax25
> utils...ax25 tools  etc and then configured it to use my SB16
> soundcard on
> 4800 bd.....
> when i modprobe soundmodem i get a warning message that the
> driver could
> corrupt the kernel and also ...no licence....
>
> thought this might be a problem with the Slackware distro but
> also have this
> Kernel loaded on my Red Hat machine...have checked this one
> also and found
> the same Warning message when i ...modprobe soundmodem.....
>

Nothing to worry about - just some changes in the 2.4.20 kernel that
look for a flag in the kernel module to reflect what license it's
provided
under.  Because this flag is not present, modprobe throws up a warning
message - but the module should still work.

Jeremy

