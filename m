From: w9ya <w9ya@amsat.org>
Subject: Re: ax25ipd
Date: Tue, 27 Aug 2002 09:50:31 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200208270950.31042.w9ya@amsat.org>
References: <Pine.LNX.4.33.0208252223370.730-100000@n1uan.ampr.org> <200208262147.08027.w9ya@amsat.org> <20020827120547.GA17396@silly.cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020827120547.GA17396@silly.cloud.net.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hamish Moffatt <hamish@cloud.net.au>, linux-hams@vger.kernel.org

On Tuesday 27 August 2002 12:05 pm, Hamish Moffatt wrote:
> On Mon, Aug 26, 2002 at 09:47:08PM +0000, w9ya wrote:
> > As far as I can tell, /usr/local has been "depreciated" into the
> > "old-timers" pile. It is not a useful directory for this according to the
> > FHS and LSB.
>
> The distributions (Red Hat, Debian, SuSE, Mandrake etc) shouldn't put
> anything in /usr/local, but if you are installing something outside of
> the packaging system then /usr/local is the recommended place.
>
> Hamish

Yes, and no. If your packaging system installs source, then it shouldn't go 
into ./usr/local. The quote above was followed by another paragraph in the 
original message that specifically indicated this.

Historically /usr/local was a way for Sun to not have user installed software 
conflict with the "authorized" software and upgrades that Sun was 
distributing with their *nix boxes. It solved a problem for them in that 
Sun's files weren't being overwitten (or worse) any longer and allowed their 
users to continue installing software. HP had a somehwt similar convention in 
the way they used /opt.

Curiously, the FHS document;
http://www.pathname.com/fhs/2.2/fhs-4.9.html#FN23
mentions that the purpose of /usr/local is to protect the "locally installed" 
software "from being overwritten". (The document uses the word "safe".)

Bob
w9ya
