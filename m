From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: YAM driver
Date: Sun, 30 Jan 2005 21:09:45 +0000
Message-ID: <20050130210945.GA5330@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I'm looking for test results with the YAM driver.  The CRC code in it
which is supposed to compute the CCITT CRC checksum is computing
something else thanks to missplaced parenthesis which raises the question
if this thing is working properly at all.  So, before I try to cook a
fix for something that I don't have the hw to test it on I'm interested
in actual test results for 2.6.

73 de DL5RB op Ralf
