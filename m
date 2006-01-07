From: richard <richard.bown@blueyonder.co.uk>
Subject: gmfsk compile
Date: Sat, 07 Jan 2006 14:10:50 +0000
Message-ID: <43BFCBEA.7090009@blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi guys
can anyone throw some light on this compile failure.
gcc-4.0.1, kernel-2.6.12-14mdk, mandriva 2006CE, FFTW 2.1.5 and fftw3( needed for other apps)
gmsk-0.6,hamlibs 1.2.4 + devel

dsp.h: In function 'void LowPass2(typeInp, LowPass2elem&, typeW, typeW, typeW)':
dsp.h:558: error: 'Out' was not declared in this scope
dsp.h: In function 'void LowPass2(typeInp, LowPass2elem&, LowPass2weight&)':
dsp.h:565: error: 'Weigth' was not declared in this scope
dsp.h:566: error: 'Out' was not declared in this scope
make[3]: *** [dsp.o] Error 1
make[3]: Leaving directory `/home/richard/HamApps/gmfsk-0.6/src/mt63'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/richard/HamApps/gmfsk-0.6/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/richard/HamApps/gmfsk-0.6'
make: *** [all] Error 2


tnx
Richard g8jvm
