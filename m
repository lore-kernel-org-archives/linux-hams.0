From: Thomas Sailer <sailer@scs.ch>
Subject: Re: user soundmodem problems on Inspiron 8200 i810 chipset...
Date: Wed, 10 Mar 2004 18:44:43 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <404F540B.3050309@scs.ch>
References: <20040309022333.GA4377@braddock.com> <1078861838.2336.1.camel@law3lz8h11.lib.loc.gov> <20040309213542.GA27566@braddock.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040309213542.GA27566@braddock.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: braddock@braddock.com
Cc: Linux-Hams@vger.kernel.org

braddock@braddock.com wrote:

> http://braddock.com/soundmodem.png
>

Looks like alsa tries to do sample rate conversion, but
"somewhat" imperfectly. Sigh. Does anyone know how to convince
ALSA to not do any sample rate conversion in their OSS emulation?

In the long run soundmodem probably should just use alsa natively.

Tom

