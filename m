From: Rodolfo Brasnarof <rodob@datafull.com>
Subject: Re: Making a loop device
Date: Mon, 13 Dec 2004 13:32:58 -0300
Message-ID: <20041213133258.50aed634.rodob@datafull.com>
References: <41B99C8A.79AE2A6F@pi4cc.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <41B99C8A.79AE2A6F@pi4cc.nl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Fri, 10 Dec 2004 13:54:34 +0100
Peter wrote:

> Hi
> 
> Setting up a new system here but it has 1 com port on it.
> Normaal I use 2 comports to make a loopback
> 
> There must be a way to make a pseudo device and make a loop with them
> But I can remember (and with google) how to setup

You can use a pair of linked pseudo ttys, such as /dev/ptyp0 (master)
and/dev/ttyp0 (slave). You must always open master side firt.

Here is an example of how to use pseudottys to link jnos to the linux
kernel via slip.

http://www.tldp.org/HOWTO/AX25-HOWTO/x2141.html#AEN2300
