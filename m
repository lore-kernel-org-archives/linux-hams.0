From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Gcc 4.0 and signedness warnings
Date: Sun, 04 Dec 2005 20:16:01 +0100
Message-ID: <43934071.3050104@ccr.jussieu.fr>
References: <438B674E.7030100@sm6tpn.mine.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <438B674E.7030100@sm6tpn.mine.nu>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi,

With gcc 4.0 there are a number of new warnings when compiling libax25, 
ax25-apps or ax25-tools.

One of the most frequent is about signedness for char declarations
instead of unsigned char for example.

Here is a warning example :
warning: pointer targets in passing argument 1 of 'strcpy' differ in 
signedness

Did someone worked on modifiying the above ax25 packages source code in 
order to remove those warnings ?

73 de Bernard, f6bvp
http://f6bvp.org

