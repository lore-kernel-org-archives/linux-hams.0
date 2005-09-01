From: jmario <jmario@fast.net>
Subject: Re: Any good satelite prediction/tracking software for Linux?
Date: Thu, 01 Sep 2005 14:52:58 -0400
Message-ID: <43174E0A.1040809@fast.net>
References: <20050831155124.48ed44e3.washer@trlp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050831155124.48ed44e3.washer@trlp.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: James Washer <washer@trlp.com>

James Washer wrote:

>Any help will be appreciated.
>-
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>
I use Predict and Gsat ( http://csourcesearch.net/package/predict/2.2.2/ 
) for most
things.  Predict does what its name implies, it predicts satellite 
passes  - and it is
very flexible.  Its display can be either X11 or curses based , your 
choice.  It can
also act as a satellite position server for use with other programs like 
Gsat.  Gsat,
a utility usually packaged with Predict,  provides a map of the earth on 
which it plots
the track of a single satellite - it also has an az-el display as a 
selectable option.  Predict
serves me as an both an interactive what is happening now tool and also, 
with a the
help of cron driven shell scripts, produces my daily list of satellite 
passes that I track
and record.  Kind of lets me make my own custom version of Heavens-Above.com

Also of potential use is  Xephem ( www.clearskyinstitute.com/*xephem*/  
). Xephem is targeted
at astronomer types (one of my other interests).  From a ham viewpoint 
Xephem's
ability to display multiple orbits of multiple satellites at user 
selected time intervals
(including the past without your having to futz with the system clock) 
on multiple
types of earth views is great.  Also neat is the ability to track and 
plot earth tracks of
other celestial objects such as the moon .  No I'm not (presently) into 
EME but it is
interesting to plot and listen to things like the moon passing thru the 
radar fence which
stretches across the southern USA ( 
www.itr-datanet.com/~*pe1itr*/*navspasur*.html ).  The radar
fence (Texas transmitter) is on 216.98mhz and has an ERP of a little 
over six gigawatts
(yes, that is 6.3e9 watts) - sort of the ultimate moon-bounce site.

All of these programs (Predict, Gsat, Xephem) are available at no cost 
although there is
a  more complete  and precompiled version of Xephem available at cost 
from the author.
All of these programs play nicely together and with X11 and over my 
local networks
(wired and wireless) using ssh.

I have no connection of any type with the folks who provide these 
programs (other than
being a satisfied customer).

Regards,
    Joe   K3FMA

