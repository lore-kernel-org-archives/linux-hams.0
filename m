From: Adi Linden <adil@adis.on.ca>
Subject: Re: ax25 support in aprsd
Date: Mon, 26 Jan 2004 22:44:28 -0600 (CST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0401262237430.11381-100000@mobile.adis.ca>
References: <401677D8.2498.30119B@localhost>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <401677D8.2498.30119B@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Williams <vk5zty@bigpond.com>
Cc: linux-hams@vger.kernel.org

If I understand this correct, I can connect to a filtered port on my 
upstream (so to speak) and only receive the packets that pass through the 
filter and still send all my traffic heard on RF to the APRS-IS?

I am still unsure about all the aprsd ports and which port(s) I need to 
connect to to get my packets to the APRS-IS. In my aprsd.conf I have:

    #
    Server second.aprs.net 23 hub-sr
    Server first.aprs.net 23 hub-sr
    Server third.aprs.net 10152 hub-sr
    Server fourth.aprs.net 23 hub-sr
    #

This worked but I really don't know why this work. It did result in a fair 
amount traffic (unnecessary traffic).

Adi

