From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: soundmodem / "SIOCSIFFLAGS no such device"
Date: Fri, 21 Feb 2003 08:50:08 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030220215008.GA1876@silly.cloud.net.au>
References: <b2veij$79l$1@main.gmane.org> <20030220120526.GA28160@silly.cloud.net.au> <b33hmu$nsm$1@main.gmane.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b33hmu$nsm$1@main.gmane.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, Feb 20, 2003 at 10:41:11PM +0100, linux-hams-owner@vger.kernel.org wrote:
> > > ifconfig sm0 hw ax25 X1ABC up
> >
> > Should also assign a dummy IP address.
> So, I typed :
> ifconfig sm0 hw ax25 X870 192.3.1.2
> ===>>> SIOCSIFFLAGS: No such device

Check the messages from the kernel with 'dmesg'. It may give you some
extra information - is it the sound card it can't find or is it the
serial port etc.

> > Is your sound card SB-compatible?
> How can I know that, please ?

Google?

> Maybe I rmmod'ed too many modules ?

Unlikely.

> > You could also try the user-space (non kernel) soundmodem driver. It
> > uses your existing sound card drivers although not all cards are
> supported.
> Great ! Where is it ? What is its name ?

http://www.baycom.org/~tom/ham/soundmodem/


73
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
