From: Fabio IZ4AFW <iz4afw@libero.it>
Subject: Re: Need help with serial card + baycom
Date: Sun, 14 Nov 2004 22:26:09 +0100
Message-ID: <6.1.2.0.2.20041114221246.0283e520@popmail.libero.it>
References: <6.1.2.0.2.20041114202646.02842888@in.aliceposta.it>
 <20041114201758.87257.qmail@web60610.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20041114201758.87257.qmail@web60610.mail.yahoo.com>
References: <6.1.2.0.2.20041114202646.02842888@in.aliceposta.it>
 <20041114201758.87257.qmail@web60610.mail.yahoo.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jim Bayer <kc9aop@yahoo.com>, linux-hams@vger.kernel.org

At 21:17 14/11/2004, you wrote:
>Fabio,
>
>You may want to check out your /etc/modules.conf file to see if the 
>baycom_ser_fdx is included.
>If you run the command "modinfo baycom_ser_fdx" it will return all 
>possible parameters for the
>module.  Another debugging method is to do an insmod or modprobe of the 
>baycom_ser_fdx module at
>root's command prompt and see what it complains about.  Also if you run 
>dmesg and pipe it to less
>(or more) you may see what the problem was at the system init time.  ALso 
>a check of
>/var/log/messages may net some diagnostic error reports.

Jim,
  thanks for your reply and for your suggestions.
Actually I have already tried those steps, and the problem is that I have 
no error messages from the baycom_ser_fdx module!
All seems ok until I arrive at the ifconfig step, where I get those two 
"SIOCSIFFLAGS: No such device or address" error messages.
 From a deeper analysis, it seems the problem is related to opening the 
serial port device: when I use it on the mainboard's rs232 ports, I find a 
line in /var/log/messages something like (I haven't the PC here, I go by 
memory) "ser_fdx: device at address 0x3f8 irq 4"; when I use the PCI card, 
I should find something similar with the appropriately changed parameters 
(address 0xb408, irq 11), instead the line is not there. This is why I 
added the printk() calls into the source code, but it seems they're not 
called at all (I have no output in the /var/log/messages file).

Thanks,
Fabio IZ4AFW



