From: David Ranch <linux-hams@trinnet.net>
Subject: Re: soundmodem
Date: Thu, 27 Feb 2014 09:08:50 -0800
Message-ID: <530F7122.9090207@trinnet.net>
References: <20140227163306.GH30054@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20140227163306.GH30054@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Folkert,

While Soundmodem is the old standby software TNC for LInux, there are 
better solutions out there now.  The one I've been recommending with 
significantly better decodes is a new entry called Dire Wolf from WB2OSZ:

    http://home.comcast.net/~wb2osz/site/

If you download the new beta source archive ( 
http://home.comcast.net/~wb2osz/Version%201.0/direwolf-1.0-src.zip ), 
open up the zip, look in the User-Guide and check out Chapter 10.  In 
there, it gives a table of Dire wolf's # of decodes compared to all 
kinds of TNCs including Soundmodem and safe to say, it blows away 
Soundmodem due to it's multiple off frequency decoders, multi-bit error 
correction, etc..  There is also a version for the Raspberry Pi as well!

Back to your original problem, I suspect your issue is in the Linux 
sound system.  Are you using PulseAudio?   Did you run pavucontrol and 
route the audio from Soundmodem to your desired soundcard?

--David
KI6ZHD
