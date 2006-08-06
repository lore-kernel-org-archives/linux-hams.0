From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: AX25 on SUSE 10.0
Date: Sun, 6 Aug 2006 14:40:43 -0400
Message-ID: <620c90570608061140l1af032adofa6ef27d6d0a046f@mail.gmail.com>
References: <3107.24.17.80.88.1154885072.squirrel@www.jnos.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3107.24.17.80.88.1154885072.squirrel@www.jnos.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "wa7nwp@jnos.org" <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

On 8/6/06, wa7nwp@jnos.org <wa7nwp@jnos.org> wrote:
>
> We tried to turn on AX25 in a SuSE 10.0 system yesterday.  It was an
> educational experience.
>
> Suse no longer directly supports or includes the AX25 packages.
>
> AX25 is indirectly supported as a 'project' by one of the SUSE folk.
>
> That AX25 project is missing one little piece 'libax25.so'
>
> Even if that all worked, it's using kernel 2.6.13 which I believe is
> broken for MKISS.
>
> Do anybody have AX25 working on a recent SUSE system?   Is there a
> cookbook checklist of how to install and get it going?
>
> Is there any Linux distributions today that are AX25 ready without any
> futzing around?  It appears the system we were working on is going to go
> with XP-Pro since it's so much easier to set up and use.
>

What are you trying to do with it? If it is being used a a network device or
BBS, I can not see where XP is any gain, but I guess it it is some sort of
terminal device that the public has access to then I guess it probably would
look better with XP. You need to move to SuSE 10.1 in order to get the
kernel that works correctly I believe. I am moving my machines to 10.1
so as to be able to play with it.

Here in Florida we are working on a Knoppix version that will be quite
near plug and play for setting up our FPAC switches. It will install all
of the AX25 stuff along with the fpac and netrom stuff. There will also
be fbb on there for those who are running a bbs and want that facility.

Here is the latest, it is a 2.4 kernel, Charlie is working on a 2.6 kernel
release, and I think it is almost done. There was I think a script problem
with the fpac install.
------------------------------------------------------------ From
k4gbb -----------------------------------------------

It is available now @ ftp://n4zkf.com./fadca
The file name is FADCA-1.7.4.iso (approx 500Mb)
This will be the last version with the 2.4.27 Kernel.

The next version will be based on Knoppix 10.01, with the 2.6.17 kernel.
The preliminary work has already been done, but not tested.

<<Charlie>>
     k4gbb
------------------------------------------------------------ End k4gbb
-------------------------------------------------

Since this has come out he has been working on the script problem
and I believe he is almost done, or maybe done with it. So 2.6 maybe
ready by now.


-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
