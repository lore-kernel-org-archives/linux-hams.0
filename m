From: Dan Jacobson <jidanni@jidanni.org>
Subject: Re: handheld computer + linux + a ham radio?
Date: Sat, 18 Sep 2004 07:42:05 +0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <87mzzoihte.fsf@jidanni.org>
References: <20040917002331.28901.qmail@radagast.org>
Reply-To: linux-hams@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

These replies belong here, not just in my mailbox:

Dave Platt <dplatt@radagast.org> sent me:

Depends on the CPU horsepower and the availability of a sound-card
interface, I think.

With the equivalent of a 200 MHz Pentium (in terms of effective
CPU cycles) and a 16-bit sound card interface, it's pretty easy
to use the sound card and CPU as a pseudo-DSP to do PSK31, AX.25
packet at 1200 baud (with TCP/IP on top, if you wish), RTTY,
and probably most of the other low-to-medium-speed digital modes.
Add a GPS receiver of some sort and you can easily do APRS.

Controlling the radio is also a real possibility, using e.g.
hamlib and its various front-end packages.

hg2ecz@ha5kfu.hu sent me:

Hi!

Which type is your handheld computer?

I want to buy in future a good handheld, but I dont know, which give me
good audio input. Because all handheld are good audio output (see mp3
listening is popular), but the A/D is oft not so good.
I want try HAM digital modes with Yaesu FT-817 from hill, and it is good,
if this "pack" is lighter as 2 kg. :)
A notebook is 2-4 kg, the FT817 is 1 kg.

Important for me:
   - OS: Linux (or POSIX compatible - it's important)
   - I need development packages (for example: cross compiler, which I can
run in my normal PC, and I can here compile program for handheld.
   - The sound interface must good (not only D/A, also I want good A/D).

Can you some typ advise?

Thanks,
   Zsolt, hg2ecz

I reply:
Hamlib: didn't get too far on the desktop with my Kenwood TH-F7E.
Maybe if I just limit my goals to
> Merely check frequency tables
then I can get the cheapest monochrome handheld and use the
$ apt-cache search palm
stuff to download the tables.
