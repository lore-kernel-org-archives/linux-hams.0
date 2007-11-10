From: "Phil" <phillor@telstra.com>
Subject: Re: Soundmedem-.10 file not uncompressing
Date: Sun, 11 Nov 2007 03:19:42 +1000
Message-ID: <000a01c823be$39735fc0$035fa30a@MOTORHOME>
References: <000f01c822ce$311842a0$4642a30a@MOTORHOME> <2e19719f0711100023p78762ce7t41abd4cb3fd4cbd7@mail.gmail.com> <fc22d18f0711100039lcb7dfedv6a540f3561a533c7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-hams@vger.kernel.org

----- Original Message ----- 
From: "Frank Brickle" <brickle@pobox.com>
To: "Bent" <bbagger@gmail.com>
Cc: "Phil" <phillor@telstra.com>; <linux-hams@vger.kernel.org>
Sent: Saturday, November 10, 2007 6:39 PM
Subject: Re: Soundmedem-.10 file not uncompressing


> Did you use the command
>    tar zxvf  name-of-your-gzipped-tarball


Hello again,

Thank you for the replies to my question.

tar -zxvf soundmodem-0.10.tar.gz failed but tar -zxvf soundmodem-0.7.tar.gz
uncompressed without a problem, so I thought that the file
soundmodem-0.10.tar.gz must be faulty in some way. The solution was to first
gunzip soundmodem-0.10.tar.gz and then pass the result to tar, as was
suggested.

Because I cannot get recent versions of Mandriva to generate a /dev/ttyUSB0
device for my PCMCIA modem I'm forced to use Windows for Internet access (an
extremely frustrating situation). Perhaps Windows somehow corrupted  this
particular tar.gz file?

Regards,
Phil.



