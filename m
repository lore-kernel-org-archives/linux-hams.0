From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Success! TWO questions remain
Date: Fri, 13 Dec 2002 08:44:25 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021212214425.GA12823@silly.cloud.net.au>
References: <3DF8AA6B.6000303@voicenet.com> <Pine.LNX.4.33.0212120924130.1291-100000@wapiti.tc.fluke.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0212120924130.1291-100000@wapiti.tc.fluke.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, Dec 12, 2002 at 09:27:40AM -0800, Curt Mills, WE7U wrote:
> On Thu, 12 Dec 2002, Margaret Leber wrote:
> > Hamish Moffatt wrote:
> > > Better solution: use SSH. You can have public key authentication (no
> > > cleartext passwords) without any encryption or compression.
> >
> > Is encrypting even a password permitted outside of control of space
> > stations?
> 
> As I understand it, it's allowed in the U.S. for authentication
> purposes (passwords), but not for hiding the rest of the text.
> Can't speak for other countries rules.

With SSH set up for a private and public key pair, you aren't even
exchanging encrypted passwords. 

The remote machine has your public key, and you have your private key. 
The remote machine gives you something to encrypt using the private key 
and send back to it (a challenge). If you don't have the private key it 
is impossible to meet its challenge. If somebody else had the private
key they could provide the proper response too.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
