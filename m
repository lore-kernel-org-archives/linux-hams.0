From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: Sequencing of USB Serial ports
Date: Mon, 5 Jun 2006 10:24:00 -0400
Message-ID: <620c90570606050724o391f2c7dyb4f4a5fdc696fd03@mail.gmail.com>
References: <620c90570606041713s638711e4oe0fdb48667836ae7@mail.gmail.com>
	 <Pine.LNX.4.63.0606051528320.10547@nagano.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0606051528320.10547@nagano.cz>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ladislav Vaiz <spam@nagano.cz>
Cc: linux-hams <linux-hams@vger.kernel.org>

On 6/5/06, Ladislav Vaiz <spam@nagano.cz> wrote:
> Hi Chuck,
> recommended way is to use udev. Informations about ttyUSBx are in file in
> /proc/tty/driver/something (I don't remember exact filename).
> 73 Lada OK1ZIA
>

Well, so far it all points to the udev, we are running the 2.4 kernel on these
switches, will have to see how hard it will be to move to 2.6 which is what
I believe udev is used under.

-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
