From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: ANNOUNCE: gMFSK v0.5
Date: Sat, 19 Apr 2003 21:58:04 +0300 (EEST)
Sender: linux-hams-owner@localhost
Message-ID: <Pine.LNX.4.44.0304192044470.6051-100000@oh2bns.ampr.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi all,

I just uploaded gMFSK v0.5 to hes.iki.fi:

  http://hes.iki.fi/pub/ham/unix/linux/hfmodems/

There you will find a tar.gz source package, a source RPM and a binary
i386 RPM for Red Hat 8.0.

I release this version now not because it's ready but because if I don't
release it now, I will never release it. It's up to you to find all the
bugs. :-)

This is a rather extensive re-write as I have switched to using GTK+ 2 /
Gnome 2. Consequently there are still some unimplemented features compared
to v0.4.1.

The most important new features are the port to GTK+ 2 / Gnome 2 and the 
new modems: MFSK8, (Q)PSK31, MT63 and FeldHell. FeldHell is RX only for 
now. I have previously written a Hellscreiber program for GTK+ 1.x but 
never released it. Now I need to figure out how to do the character 
rendering for TX in GTK+ 2.

PSK31 and MT63 borrow a lot from other peoples code so they should work 
pretty well. However MT63 has no support for the extended features in 
Nino's program or MixW. MFSK8 seems to work but is pretty much untested.

Bear in mind that this is very much work in progress. All bug reports,
feature requests and contributed code is welcome, though I reserve the
right to select what will make it to the next release... :)

Last but not least there is the name issue. The program is not anymore a 
collection of various M-ary FSK modems, there are PSK, OFDM and Fuzzy 
modes as well. So the name is not the best one anymore. Suggestions for a 
new name are welcome!

Now, share and enjoy!

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

