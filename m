From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: gmfsk - fftw lib not found
Date: Tue, 5 Dec 2006 12:10:20 +1100
Message-ID: <20061205011020.GA12633@cloud.net.au>
References: <200612041412.46659.kb7no@sbcglobal.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200612041412.46659.kb7no@sbcglobal.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Dec 04, 2006 at 02:12:46PM -0800, Jack Heller wrote:
> 	./configure fails with gmfsk 0.6
> 	error reads: fftw libraries not found

You need to install the development libraries for fftw. The package is
called fftw-dev in Debian and probably the same in Ubuntu.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
