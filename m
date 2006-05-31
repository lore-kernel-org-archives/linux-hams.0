From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: callsign limit
Date: Wed, 31 May 2006 07:03:50 -0400
Message-ID: <620c90570605310403o1e4b94bcgf4ab922ef26983e4@mail.gmail.com>
References: <200605310927.56706.vk3heg@iinet.net.au>
	 <20060531093716.GA21395@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060531093716.GA21395@cloud.net.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

On 5/31/06, Hamish Moffatt <hamish@cloud.net.au> wrote:
> On Wed, May 31, 2006 at 09:27:56AM +0000, stephen wrote:
> > When I enter in vk3fdcs at the bbs prompt I get this error:
> >
> > VK3HEG BBS>eu vk3fdcs
> > *** Error : The callsign is missing.
> >
> > The windows remote linux program will let me add the vk3fdcs callsign, but
> > when listing the users the ending 's' is cut off/missing.
> >
> > Is it posable to set call sign lengths in fbb or is this going to require a
> > re-compile/editing of the source code?
>
> Good question. AX.25 callsigns are at most 6 characters long, so you
> won't be able to use those callsigns on the air.
>
> Foundation licensees aren't allowed on packet btw.
>
>
> Hamish

I believe (I maybe taking one in the wind but so far my digging around the
web would show this correct) that the ITU format for amateur calls is a max-
imum of 6 alpha-numerics, the first 1 - 2 chars are the national ID, 3rd is
usually a digit and the last 3 are the unique ID of the station, AX25 only
allows for a 6 char call. So you are going to have a problem there.

This of course does not set a minimum size as long as the national info is
displayed, so in this country (USA a K4A is possible, I believe in AUS,
you can have say a VK2A) calls as short as 2X1 are possible.



-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
