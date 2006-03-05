From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Error compiling gmfsk
Date: Sun, 5 Mar 2006 12:58:33 +1100
Message-ID: <20060305015833.GA5261@cloud.net.au>
References: <73DDFD02-BF11-4AE3-922D-56A19AD410EE@oz.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <73DDFD02-BF11-4AE3-922D-56A19AD410EE@oz.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sat, Mar 04, 2006 at 04:24:23PM -0800, Bob Nielsen wrote:
> I tried to compile gmfsk using the latest hamlib, but get the  
> following error:

> dsp.h: In function 'void LowPass2(typeInp, LowPass2elem&, typeW,  
> typeW, typeW)':
> dsp.h:558: error: 'Out' was not declared in this scope
[..]

Here's the patch that Debian uses for this. The error is due to the
newer g++ which is stricter.

The 0.7pre1 release of gmfsk does not need this patch.

Hamish

--- gmfsk-0.6.orig/src/mt63/dsp.h
+++ gmfsk-0.6/src/mt63/dsp.h
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

-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
