From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: gmfsk - fftw lib not found
Date: Tue, 5 Dec 2006 14:44:04 +1100
Message-ID: <20061205034404.GA15572@cloud.net.au>
References: <200612041412.46659.kb7no@sbcglobal.net> <20061205011020.GA12633@cloud.net.au> <200612041940.10406.kb7no@sbcglobal.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200612041940.10406.kb7no@sbcglobal.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Dec 04, 2006 at 07:40:10PM -0800, Jack Heller wrote:
> Thanks Hamish,
> 	I am working on getting the dev file.  A small confusion exists.  I will sort 
> out the apt-get commands and get this done.  Found some nice instructions, 
> decided to print them and had to stop and fill print cartridges.  Will 
> persevere.  Thanks a bunch -- Really want to see this work.

By the way Jack, gmfsk is included in Ubuntu and so there's no need to
compile it yourself (unless you want to).

apt-get install gmfsk

should do the trick as long as you have the "universe" section in your
sources.list. edgy has 0.7pre1.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
