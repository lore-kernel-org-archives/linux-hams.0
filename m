From: "David D. Hagood" <wowbagger@sktc.net>
Subject: Re: callsign limit
Date: Thu, 01 Jun 2006 07:04:02 -0500
Message-ID: <447ED7B2.3070701@sktc.net>
References: <200605310927.56706.vk3heg@iinet.net.au> <20060531093716.GA21395@cloud.net.au> <620c90570605310403o1e4b94bcgf4ab922ef26983e4@mail.gmail.com> <20060531111919.GA22980@cloud.net.au> <20060601014047.GB27504@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060601014047.GB27504@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Ralf Baechle DL5RB wrote:
> One of my crazier ideas to deal with the issue of the longer callsigns
> was using a hash value instead.  The probability of colissions is low but
> how to do the reverse mapping from hash to callsign ...
> 
>   Ralf
>

Since a callsign is always from the set [A-Z0-9] (36 chars, 5.2 bits of 
data per character for a naive encoding) could you not simple encode the 
callsign of an otherwise too-long call as 6 bits per character packed 
into the octets, with a specific leading character to indicate 
compression (e.g. '?') - yielding about 8 chars/call.

