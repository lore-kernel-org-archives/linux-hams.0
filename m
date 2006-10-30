From: Al Bolduc <a.bolduc@comcast.net>
Subject: Re: gmfsk
Date: Mon, 30 Oct 2006 17:47:27 -0500 (EST)
Message-ID: <Pine.LNX.4.62.0610301743440.25026@mars.local.net>
References: <4544D1A7.3010103@blueyonder.co.uk>  <20061029213157.GA25286@cloud.net.au>
 <45452E68.9060601@blueyonder.co.uk>  <454636E0.6090009@blueyonder.co.uk> 
 <20061030213843.GB25496@cloud.net.au> <1162246448.5345.5.camel@oh2bns.ampr.org>
Reply-To: Al Bolduc <a.bolduc@comcast.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1162246448.5345.5.camel@oh2bns.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen <oh2bns@sral.fi>
Cc: Hamish Moffatt <hamish@cloud.net.au>, linux-hams@vger.kernel.org

On Tue, 31 Oct 2006, Tomi Manninen wrote:

>
> This is a good suggestion. I've heard lots of complaints about the
> sample rate conversion stuff in ALSA.
>

I have luck with alsa using the following script

#!/bin/sh
#
#       Configure alsa oss emulation for soundapps
#

#	Configuration

PLAYBACK=/proc/asound/card0/pcm0p/oss
CAPTURE=/proc/asound/card0/pcm0p/oss
SOUNDAPPS="qsstv twpsk gpsk31 multimon p3dtelem xdemorse xdemorse-fft"

#       Check if root is performing the operation

id | grep "(root)" > /dev/null
if [ "$?" != "0" ]
then
         echo "You must be root or super-user to run $0."
         exit 1
fi

#	Erase current configuration

echo "erase" > $PLAYBACK
echo "erase" > $CAPTURE

#	Configure

for app in $SOUNDAPPS
do
 	echo "$app 0 0 direct" > $PLAYBACK
 	echo "$app 0 0 direct" > $CAPTURE
done
#cat $PLAYBACK
#cat $CAPTURE

--

Al - ka1as

#  Al Bolduc - a.bolduc@comcast.net - ka1as@amsat.org
