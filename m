From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: kernel 2.4.23 problem
Date: Thu, 1 Jan 2004 23:13:18 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040101231318.A19167@pull.privacy.nb.ca>
References: <3FF444C3.9040306@schonfeld.eu.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3FF444C3.9040306@schonfeld.eu.org>; from tony-no-spam@schonfeld.eu.org on Thu, Jan 01, 2004 at 05:03:15PM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Schonfeld <tony@schonfeld.eu.org>
Cc: linux-hams@vger.kernel.org

On Thu, Jan 01, 2004 at 05:03:15PM +0100, Tony Schonfeld wrote:
> 
> Since i've upgrade kernel 2.4.22 to 2.4.23 my system is unstable
> under debian sid like this message:
 
> Without ax25 running, everything is fine.
> 
> i' haven't check 2.4.23 without ax25 but 2.4.22 run fine here.
 
> Do you know the fix for this problem ?
> the only way is it upgrade to kernel 2.6 ?

The best long term fix is to upgrade to 2.6.0 (or newer), as the 2.6.x
kernel has numerous bug fixes. No offense to 9a4gl but as far as I know
his patch does not fix everything that Ralf and Joeron (sp?) have been
working on. 

The reason it is flakey under 2.4.x (for some people) is that some
basic or fundemental assumptions changed between 2.2.x and 2.4.x and
at the time no one made the necessary changes to AX.25 and the device
drivers. So some people will be bit by these bugs while others get
luckily and don't see them (faster, more complex setups, especially
gateways seem to be affected the most).

I believe that Debian 3.0 'testing' or 'unstable' both support the  2.6.x
kernel. (RedHat Linux 9 + module-init-util, or Fedora core 1 also support
2.6 AFAIK)

There is a 2.6.0 HOWTO at <http://www.kerneltrap.com/>

Hope that helps,

-ve3tix (ex. ve1mct)
