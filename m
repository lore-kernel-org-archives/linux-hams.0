From: Jonathan Naylor <jonathan@mechserv.demon.co.uk>
Subject: LinWSJT Development News
Date: Wed, 1 Jan 2003 17:09:00 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <R2XVxXAsCyE+EwBG@mechserv.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Happy 2003 to you all

During the Christmas holiday I've taken the opportunity to do some more 
work on the LinWSJT package, unfortunately without access to a suitable 
Linux machine to test it all on :-( Being away from my home PC has been 
an advantage though, I've been forced to sit down and think some 
problems through and hopefully come up with some answers that are either 
new or more elegant/efficient than I had thought/programmed previously. 
This has been helped by having access to a real DSP book, of the dead 
wood variety.

So what have I done (in no particular order) ?

1. Replaced the complex number magnitude calculator with a considerably 
more efficient algorithm from www.dspguru.com which does not use a 
square root function. This could be a huge speed improvement for JT44 
and FSK441 processing. I will do some speed tests and post the answers.

2. Worked out a method for decoding FSK441. This should not suffer from 
the problems encountered in WSJT (the original one) where a long, strong 
burst is not decoded properly. If this works then expect the LinWSJT 
FSK441 implementation to follow quickly, but not quick enough for the 
Quadrantids shower. Sorry folks.

3. Calculated the correct co-efficients to implement a correlator in the 
JT44 text decoding which should have the effect of removing the false 
triggering due to "birdies" without affecting sensitivity.

4. Discovered the algorithm for normalising the output of a correlator 
so that the output is always in the range -1 to 1 thereby removing 
effects due to varying input amplitudes. This improves the "sync 
quality" value in JT44 and opens the way to my FSK441 implementation.

5. Code clean-ups and commenting in the DSP code which is the most 
important and interesting part.

I have a question for the DSP Gurus out there, imagine a FFT which is 
decoding a tone from a normal SSB receiver with white noise audible 
also. If I take the value of an FFT bin which I know not to contain any 
signal data (or maybe an average of a number of such bins) and use that 
as a noise reference, lets call this a value of N. If I now take the 
value of the bin containing the desired signal and it has a value, lets 
call it M. Is it then true to say that that the (S + N) / N ratio of the 
signal is 10 * log10(M / N) in the bandwidth of the bins ?

I do not regain access to my home PC until next week and then I'll have 
the fun of reading through the 1000s of e-mails that promise to make me 
rich quickly and increase the size of my member by 35%. If anyone has 
e-mailed me during the last few weeks (except to this e-mail address) 
then please accept my apologies for not replying, I have not had access 
to my normal e-mail accounts.

I also did some work on UKW Tools but that consisted of a couple of bug 
fixes.

My time for development and operating will be reduced in the near future 
as I pack my equipment up for shipping back to the UK, but I have a 
window of a few weeks that should allow me to get the LinWSJT 
enhancements integrated and debugged hopefully.

Have fun

Jonathan  G4KLX
