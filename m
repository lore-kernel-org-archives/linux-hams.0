From: John Ronan <jronan@tssg.org>
Subject: Re: Help testing authenticate-but-not-encrypt OpenSSH patch
Date: Thu, 17 Jan 2008 09:52:00 +0000
Message-ID: <37D41A15-45D6-48CF-B3ED-66232707FDB7@tssg.org>
References: <Pine.SUN.4.58.0801162028010.11956@eskimo.com>
Mime-Version: 1.0 (Apple Message framework v753)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0801162028010.11956@eskimo.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: "Curt Mills, WE7U" <archer@eskimo.com>
Cc: All things digital and fun <seatcp@wetnet.net>, linux-hams@vger.kernel.org


Hi Curt,

Thanks for the work...

Let me get some other stuff off my plate today and I'll get to look  
at it.. I have two linux laptops with wireshark and wireless  
interfaces that I can use to test with.

Regards
de John
EI7IG

On 17 Jan 2008, at 04:34, Curt, WE7U wrote:

>
> Anyone still run TCP/IP over AX.25, or know how to sniff ethernet on
> fast LAN's?  I spent a few hours separating out the
> authenticate-but-don't-encrypt portion from the HPN patch for
> OpenSSH.
>
> If you can compile from sources then it's easy to apply the patch.
> I need to know if it works as expected:  Authenticates without being
> in the clear, but transfers data in the clear.  Sniffing the packets
> is a must to make sure it's doing things right.
>
> Any takers?
>
> The plan is to submit this back to the OpenSSH developers and hope
> for the best.  If the patch can get integrated into the main release
> then we may have an FCC-approved way to use SSH/SCP over ham radio
> back in all the Linux distributions soon.
>
> --
> Curt, WE7U: <www.eskimo.com/~archer/>     XASTIR: <www.xastir.org>
>   "Lotto:  A tax on people who are bad at math." -- unknown
> "Windows:  Microsoft's tax on computer illiterates." -- WE7U
> The world DOES revolve around me:  I picked the coordinate system!
> -
> To unsubscribe from this list: send the line "unsubscribe linux- 
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



