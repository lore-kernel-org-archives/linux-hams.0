From: Jonathan Naylor <jonathan.naylor@ggaweb.ch>
Subject: Re: Predict 2.1.5
Date: Sat, 20 Apr 2002 20:31:58 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <0204202031580G.00773@g4klx>
References: <0204201920200F.00773@g4klx> <20020420182156.NNEM19810.fep04-svc.mail.telepac.pt@there>
Reply-To: g4klx@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020420182156.NNEM19810.fep04-svc.mail.telepac.pt@there>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Claudio Martins <ctpm@mega.ist.utl.pt>, linux-hams@vger.kernel.org

On Saturday 20 April 2002 20:17, Claudio Martins wrote:
>    Predict 2.1.5 displays doppler on 2m and 70cm, but it can also
> supply the doppler shift value normalized to 100MHz if used as a
> tracking server. Start predict with -s switch (predict -s). It will
> go into multi-sat mode and listen on udp port 1210. Doppler queries
> to the predict server will be answered with 100MHz normalized
> doppler.  There are sourcecode examples of how to do this in the
> tarball.

I know how to calculate doppler shifts, my point is that to be really 
useful to an operator they should not need to calculate it by hand. The 
program should do this sort of thing for you. It is this level of 
functionality that makes or breaks a program.

>  cheers
>
>  Claudio
>  CT3KD

Jonathan  HB9DRD/G4KLX
