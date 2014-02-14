From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Linpac on Raspberry Pi
Date: Fri, 14 Feb 2014 09:08:37 -0800
Message-ID: <52FE4D95.2020701@trinnet.net>
References: <52FDC2F9.2050804@exemail.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <52FDC2F9.2050804@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ray Wells <vk2tv@exemail.com.au>, Linux Hams <linux-hams@vger.kernel.org>


Hello Ray,

I'm actively working on (finally) releasing a new version of Linpac but 
Autoconf has been a challenge.  I received some great help from the 
Xastir folks but have a little more to go.  Anyway, I have your "vector" 
and other issues have already been solved with these new patches and I 
should be able to give you a hand.  I do plan on releasing a .debs in 
the future but until then, try this for non-RPM based systems:


# 0 - Your dependencies will be gcc, perl, ncurses-libs, libax25, and 
ax25mail-utils
#    All compiling details can be found here: 
http://www.trinityos.com/HAM/CentosDigitalModes/hampacketizing-centos.html#11.linpac

# 1 - I highly advise you do NOT compile things on your Rpi's SD card - 
it will wear it out.  Do all your compiling
# via an NFS mount or an attached USB hard drive , etc.

# 2 - Get the sources (please note that the Ncurses based Linpac is the 
one I've been focusing so far)
cd <your high-write cycle destination path>
wget 
http://downloads.sourceforge.net/project/linpac/LinPac-unstable/0.17pre3/LinPac-0.17pre3.tar.gz

# 3 - Uncompress Linpac
tar xzvf LinPac-0.17pre3.tar.gz

#4 - Get all the required patches
cd LinPac-0.17pre3
wget -r -l1 --no-parent --no-directories -Alinpac0* 
http://www.trinityos.com/HAM/CentosDigitalModes/usr/src/redhat/SOURCES/

#5 - Apply the patches
patch -p0 < linpac0-digi-length.diff
patch -p0 < linpac0-pcskprsnd.diff
patch -p0 < linpac0-compile-fixes.diff
patch -p0 < linpac0-compile-fixes2.diff

#6 - Configure and build it
./configure --prefix=/usr
make

The compiler is still throwing warnings but it builds ok on Centos6.5 
today.  I would appreciate any feedback on how to clean up the warnings 
as I'd like to get a 100% clean build before I post this new version on 
SF.net.

#7 - Configure it up by reading the included manual.html documentation 
and 
http://www.trinityos.com/HAM/CentosDigitalModes/hampacketizing-centos.html#11a.linpacconfig


PS.  I'm not on the Rpi list but if you would, please cross-post this 
response over there as well.  I'd love to get more users on Linpac and 
get some additional developers on board!


--David
KI6ZHD



> Over on the RPi list questions are being asked about a packet terminal 
> program for the RPi to satisfy a mild renewal of interest in connected 
> mode packet. As a one-time user of Linpac I decided to try to compile 
> it on the Pi but have run into problems with header files, with 
> vector.h being the one that is stumping further progress. I haven't so 
> far found a Debian package that provides vector.h. I've tried to 
> compile both 0.16 and 0.17-pre with similar results.
>
> I found an email in my archives from David Ranch, dated 21-09-12 in 
> which reference was made to someone running Linpac "with great 
> results". David is listed as the maintainer.
>
> Is anyone here, and specifically David, able to shed any light on the 
> problem?

