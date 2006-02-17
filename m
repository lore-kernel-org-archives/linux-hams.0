From: Doug <appld@sasktel.net>
Subject: Kernel recompiling
Date: Thu, 16 Feb 2006 23:52:03 -0600
Message-ID: <6.1.2.0.2.20060216235145.03123a98@mail.sasktel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Well I am still trying to compile my own kernel. Getting close
I think. Using RH Enterprise 3 on a PII 400, Compaq.
Using kernel 2.4.21-9EL

After using make menuconfig etc and saving the configuration. I
ran make dep, make clean, make bzImage and then make install.
No error reports.
However, when I boot to the new Custom kernel I get the following
errors:

Mounting root file system
Mount error 19 mounting ext3
pivotroot: pivot_root(/sysroot,/sysroot/initrd) failed :2
Freeing unused kernel memory: 164k freed
Kernel panic: No init found.
Try passing init= option to kernel


And there it sits.Initrd img file for the custom and regular
kernel are in the boot directory. The custom file is 87.3k
and the regular is 161.3k.

The only thing being added to the custom file are some of
the Ham Radio stuff like ax25, netrom etc. Those were the
only additions made.

When running make menuconfig, when I get to the yam line
and want to exit and save I seem to go around in circles.
A few times, I used the double escape code to get out.
Not sure what the proper procedures are. I have half
a dozen or so HOW TO documents and they are all very
similar. I also have RH Enterprise Linux 3 Administration
guide Appendix A, Building a Custom Kernel. Still no cigar!!

 From what you see above, what am I doing wrong??

Thanks

Doug VE5DA 


