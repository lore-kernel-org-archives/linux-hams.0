From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Loading packages
Date: Thu, 18 Mar 2004 20:49:09 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040318204909.A31775@pull.privacy.nb.ca>
References: <5.1.0.14.2.20040317204718.04da6200@mail.sasktel.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5.1.0.14.2.20040317204718.04da6200@mail.sasktel.net>; from appld@sasktel.net on Wed, Mar 17, 2004 at 08:48:08PM -0600
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug <appld@sasktel.net>
Cc: linux-hams@vger.kernel.org

On Wed, Mar 17, 2004 at 08:48:08PM -0600, Doug wrote:
> I am running FC-1 with kernel 2.4.22.2174.nptl. When I tried to load a 
> couple of
> development packages, the system told me it could not find libxml2. I tried to
> load it from the cd, and then the system said that the package was already in
> the system is was newer then the one I was trying to load. In other words,  it

If the error message when trying to install the development packages
did not mention a specific version of libxml2, I suspect the problem is that 
it really wants libxml2-devel installed not a version mismatch of libxml2.

-ve3tix
