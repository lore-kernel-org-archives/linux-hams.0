From: Jonathan Naylor <jonathan.naylor@ggaweb.ch>
Subject: Re: [Moon-Net] JT44 on Linux
Date: Tue, 20 Aug 2002 23:06:37 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <02082023063710.00798@g4klx>
References: <0208152233020B.00798@g4klx>
Reply-To: g4klx@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0208152233020B.00798@g4klx>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: moon-net@nlsa.com
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi All

A little status report on the progress of JT44 for Linux.

What does it do now:
Transmits JT44 and FSK441 (WSJT decode is perfect)
Has timing control for both modes
Can use soundcards in 16-bit or 8-bit mode
Can read/write WAV files in 16-bit or 8-bit formats
Can use the serial, parallel or no ports for TX switching

What doesn't it do at the moment:
No receive capability for either mode
No GUI (will probably use KDE/Qt)

The development is being done slowly as I am learning at the same time. 
The receive side is much more complex that the transmit side since (at 
least for JT44) you have time and frequency correlation which is not 
trivial, I am hoping Bob K1JT can provide pointers to how he did it in 
his WSJT program.

I had to change my tone generation from an IFFT to a Numerically 
Controlled Oscillator because the symbol length is not a power of 2. 
However the NCO is probably more efficient in terms of CPU and is 
performing well. I have started on the JT44 receive, I have a sliding 
FFT which is producing lots of data and its quite interesting to see 
the symbols appearing in the "bins".

My plan is to have two programs, one for JT44 and one for FSK441, with 
priority being given to JT44. In the GUI I will probably not include 
the information about Sun and Moon positions as there are other 
programs which do that better. I am going to follow the UNIX principle 
of one program for one task, even if I have to write the adjunct 
programs.

My plans are intitally to have a simple text based user interface until 
such time as I am happy with the operation of the underlying signal 
processing. The GUI will probably be written in KDE/Qt as that has 
native C++ bindings.

The whole thing is written in C++ and I am taking time to provide a 
good framework for doing further development of new weak signal 
protocols. A case that comes to mind is a protocol that is more 
suitable for EME on frequencies higher than 1296 MHz where the 
scintillation causes frequency spreading which can make the JT44 signal 
spread over more than one receiving bin. Something more akin to slowed 
down FSK441 with fewer tones and greater spacing is possibly more 
suited to that task. The test of the framework was that I was able to 
implement FSK441 transmit about one hour after I had JT44 transmit 
working.

This is a lot of fun to work on, and a learning experience. I hope that 
the lack of replies about JT44 on Linux is more to do with their having 
been an EME conference this weekend rather than no-one being 
interested. As previously stated all of my work is under the GPL and is 
free to have and to modify. If anyone is interested in having it, drop 
me a line. In theory you could use Linux JT44 transmit and Windows 
receive, I can't wait to hear of the first QSO off the moon with it !

My priority is to work on JT44 and then FSK441 later. After listening 
to the monkey house on 144.370 MHz during the Persieds, I am not sure 
we need more operators on FSK441 in Europe, but as a technical 
challenge it is very interesting.

73 to all

Jonathan  HB9DRD/G4KLX
