From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: callsign limit
Date: Wed, 31 May 2006 19:37:16 +1000
Message-ID: <20060531093716.GA21395@cloud.net.au>
References: <200605310927.56706.vk3heg@iinet.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200605310927.56706.vk3heg@iinet.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, May 31, 2006 at 09:27:56AM +0000, stephen wrote:
> When I enter in vk3fdcs at the bbs prompt I get this error: 
> 
> VK3HEG BBS>eu vk3fdcs 
> *** Error : The callsign is missing. 
> 
> The windows remote linux program will let me add the vk3fdcs callsign, but 
> when listing the users the ending 's' is cut off/missing. 
> 
> Is it posable to set call sign lengths in fbb or is this going to require a 
> re-compile/editing of the source code?

Good question. AX.25 callsigns are at most 6 characters long, so you
won't be able to use those callsigns on the air.

Foundation licensees aren't allowed on packet btw.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
