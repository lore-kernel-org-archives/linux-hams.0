From: Ladislav Vaiz <spam@nagano.cz>
Subject: Re: conversd-saupp
Date: Tue, 20 Sep 2011 10:13:10 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1109201006490.25239@nagano.cz>
References: <1990DAF0-D2C0-4DFF-89F2-E3099F8A7010@xs4all.nl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1990DAF0-D2C0-4DFF-89F2-E3099F8A7010@xs4all.nl>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Ben Stienstra <b.stienstra@xs4all.nl>
Cc: linux-hams@vger.kernel.org

Hi Ben,
try to force channel number with convers argument -c. As far as
I remember, channel 0 is disabled for security reason. Don't ask me why, 
I'm not convers guru :-)

73 Lada, OK1ZIA


On Mon, 19 Sep 2011, Ben Stienstra wrote:

> Dear all,
>
> I'm setting up a saupp conversd server and got it running, almost... When i connect with the 'convers' client from the localhost, it works. But, when i connect via AX.25 i only get the "channel 0 has been removed" message, and nothing else. It just waits and disconnect after a long wait. Maybe someone can help me with it.
>
> Please see the output below.
>
> c vhf pd0b-13
> Trying...  The escape character is: CTRL-T
> *** connected to PD0B-13
> *
> * Access to channel 0 has been removed from this server.
> *
>
> *** reconnected to PD0B-2
>
>
> I have tried everything from axconv (ax25d) to the ax25 listener and rawconvers, all give the same output on AX.25. I have no errors in the log. The line below is the only evidence from the connect:
>
> Sep 19 23:28:00 voyage conversd[2118]: Incoming connection from PD0B-15 to ax25:pd0b-13,pd0b-1
>
>
> Best regards,
> Ben
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
