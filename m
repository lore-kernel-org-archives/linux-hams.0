From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Re: Soundmodem Not Decoding Real Packets
Date: Fri, 1 Jul 2005 10:34:12 -0700
Message-ID: <40764501050701103468d58aec@mail.gmail.com>
References: <loom.20050701T095736-780@post.gmane.org>
	 <46479.194.154.200.89.1120206709.squirrel@mail.lx2gt.lu>
Reply-To: Jonathan Lassoff <jlassoff@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <46479.194.154.200.89.1120206709.squirrel@mail.lx2gt.lu>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luc Langehegermann <luc2@lx2gt.lu>, linux-hams@vger.kernel.org

On 7/1/05, Luc Langehegermann <luc2@lx2gt.lu> wrote:
> Hello Jonathan,
> 
> > I've been trying to get Tom Sailer's soundmodem to decode AX.25 packets.
> > I've
> > been able to see the audio coming in from the radio and from other
> > machines
> > transmitting packets through a cable. The only problem is that the DCD can
> > be
> > too sensitive and turn on when there is nothing but just inducted noise in
> > the
> > cable from somewhere. The noise in normal, and the level is very, very
> > low. But,
> > the problem is that soundmodem tries its best to try and decode the noise.
> > But
> > when a real packet comes down the line, it tries but fails to decode it
> > properly. I think that I have an issue with audio levels, but I'm open to
> > being
> > wrong. Does anyone on list have any good ideas of things to try?
> >
> 
> I had a similar issue in the past, which can occur if you use the ALSA
> soundcard drivers. If you use ALSA for your hardware, are you sure to also
> use the new soundmodem, which supports it directly? The problem could be,
> that your sound driver does sample rate conversion, which can be the
> reason for not decoding packets.
> 
> Luc
> 
I tried the decoding with both ALSA and direct OSS, but it still
doesn't seem to work properly either way. I'm using soundmodem-0.9

Jonathan (KG6THI)
