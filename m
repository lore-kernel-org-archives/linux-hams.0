From: Erik Jakobsen <erik_ja@mail.tele.dk>
Subject: Re: gMFSK ?
Date: Wed, 09 Jul 2008 08:38:19 +0200
Message-ID: <48745CDB.8030009@mail.tele.dk>
References: <4873C64E.2000105@mail.tele.dk> <20080708213400.GN8136@n0nb.us> <48744F4A.60705@mail.tele.dk> <courier.4874558A.00001E9A@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <courier.4874558A.00001E9A@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Platt <dplatt@radagast.org>
Cc: linux-hams@vger.kernel.org

Dave Platt wrote:
>
> I found that I was having problems a few years ago with a Kenwood
> TS-2000 under similar circumstances.  rigctl seemed to work OK, but
> hamlib-equipped applications couldn't read out or control the
> frequencies or modes.
>
> The problem turned out to be one of command turnaround time.  The
> TS-2000 requires some amount of "quiet time" after the port has been
> opened, and after it has sent the response to a command, before it's
> ready to receive / recognize / act on the next command.
>
> When you run rigctl, human reaction time and typing speed limitations
> provide far more than the required time.  When you run hamlib-equipped
> software, it will often issue commands with little or no delay
> between, and this tends to overwhelm the rig's microprocessor.  The
> net result is that commands are not recognized properly by the rig,
> and either elicit no response at all or a "Hunh?  Say what?" error of
> some sort.
>
> My recollection is that there is a usable workaround.  The rig
> definition tables in the hamlib drivers have a "post_write_delay"
> value which can be set to a suitable number of milliseconds, to slow
> down the software's issuing of back-to-back commands.
>
> I set the TS-2000 post-write delay to 50 milliseconds, and it made a
> world of difference.
>
> You may need to download the Hamlib source code, tweak the driver for
> the rig to include a suitable amount of delay, and rebuild the
> libraries.  If this fixes your problem, please submit a patch to the
> Hamlib maintainers so that it can be incorporated into the next release.
>
>
>   
Many tnx Dave for your fast reply :-)

I use openSUSE 11.0 and would uninstall hamlib.
Then there was nothing to do but also let fldigi leave its install.

After I installed hamlib, and the after again I would install the fldigi 
rpm again.
But it would also install the hamlib rpm.

Then I downloaded the fldigi tarball.

But it tells me:

# ./configure
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking for g++... no
checking for c++... no
checking for gpp... no
checking for aCC... no
checking for CC... no
checking for cxx... no
checking for cc++... no
checking for cl.exe... no
checking for FCC... no
checking for KCC... no
checking for RCC... no
checking for xlC_r... no
checking for xlC... no
checking for C++ compiler default output file name...
configure: error: C++ compiler cannot create executables
See `config.log' for more details.

What am I to do now

Erik OZ4KK
