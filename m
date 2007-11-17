From: Bent <bbagger@gmail.com>
Subject: Which slave with Unix98 master-slave pseudo ttys?
Date: Sat, 17 Nov 2007 20:20:52 +0100
Message-ID: <2e19719f0711171120q129dbd51s8c0aebe45b4e4273@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=VXUJVAithSvzg3mu8+gQXzRtIecZ1CJdXiTxHVN3fec=;
        b=SZj/yE4svMRBZtLfctddslpcyH6+WMBZl230CXc7gODtzqJi4zE7gyyQBrCcv3SrrlI0GFDLO2ls/Rl22PXSvOmj1/C+qckEkiKVtwVG3T3Isvc7b8xCbf2QfY5Bu1Wb6be7HzCki4kf76m4cxQHBFzXfMYDl9G8nCXRvQ28PxY=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi

How do you find out which slave to use when you have created a Unix98
pseudo tty on /dev/ptmx?

I have searched high and low and not found much. The script by
Bernard, F6BVP (http://f6bvp.free.fr/logiciels/Unix98-pseudo-tty/pseudo_tty.sh)
apparently assumes that the slaves are called 0 and 1, but what do you
do when some other program may have created its own set(s) of pseudo
ttys? In that case your slaves can be at any number, say 9 and 10. Do
you do ls -l on /dev/pts and use he newest? or how do you find *your*
slave?

73 de Bent/OZ6BL
