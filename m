From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Re gmfsk compile
Date: Sun, 8 Jan 2006 13:15:37 +1100
Message-ID: <20060108021537.GA16068@cloud.net.au>
References: <43C02C48.6020409@bigpond.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <43C02C48.6020409@bigpond.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-hams List <linux-hams@vger.kernel.org>

On Sun, Jan 08, 2006 at 07:02:00AM +1000, David wrote:
> Hi All.......Tomi has stolen some of my thunder.......with Mandriva 
> Linux 2006...you should use 0.7pre1......BUT make sure you have all the 

I'll go you one better; here's a patch you can apply to 0.6 to make it
compile on gcc 4.0. We use this on Debian.

diff -urN ../tmp-orig/gmfsk-0.6/src/mt63/dsp.h ./src/mt63/dsp.h
--- ../tmp-orig/gmfsk-0.6/src/mt63/dsp.h	2004-07-08 19:21:26.000000000 +0200
+++ ./src/mt63/dsp.h	2004-10-01 11:42:42.678361264 +0200
@@ -555,15 +555,15 @@
  inline void LowPass2(typeInp Inp, LowPass2elem &Elem,
 		typeW W1, typeW W2, typeW W5)
 { double Sum, Diff;
-  Sum=Elem.Mid+Elem.Out; Diff=Elem.Mid-Elem.Out; Elem.Mid+=W2*Inp-W1*Sum; Out+=W5*Diff; }
+  Sum=Elem.Mid+Elem.Out; Diff=Elem.Mid-Elem.Out; Elem.Mid+=W2*Inp-W1*Sum; Elem.Out+=W5*Diff; }
 
 template <class typeInp>
  inline void LowPass2(typeInp Inp, LowPass2elem &Elem, LowPass2weight &Weight)
 { double Sum, Diff;
   Sum=Elem.Mid+Elem.Out;
   Diff=Elem.Mid-Elem.Out;
-  Elem.Mid+=Weight.W2*Inp-Weigth.W1*Sum;
-  Out+=Weight.W5*Diff; }
+  Elem.Mid+=Weight.W2*Inp-Weight.W1*Sum;
+  Elem.Out+=Weight.W5*Diff; }
 
 /*
 inline void LowPass2(float Inp, double &Mid, double &Out,


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
