From: Bill Vodall <wa7nwp@gmail.com>
Subject: Re: AX25 and related software's future in Debian
Date: Fri, 4 May 2012 10:50:41 -0700
Message-ID: <CAPSBm51RHEn7ch_A9CDrtUymZtnOJgnkCq_a=F3auq8A_6XFfg@mail.gmail.com>
References: <20120504151424.GC24655@flying-gecko.net>
	<E1SQLMS-00025Q-Iq@mail.kostecke.net>
	<20120504165706.GD24655@flying-gecko.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=ogkZyeNgjlVIiM+a/WHdhsRalvJ1khSFdUFnlQNm82Q=;
        b=WFRrzWuhe4YzswegKmUH0wxBlKRne3wsQq4GLB2/E0XdBdo9rUfrgVpL9o0lhiGDbi
         291vjrPLYQVizY2pQOqU+AG4zUPSdwoNn77A3HBZlLxdL0fgMdr0Ic22V+QxzMFLSPVs
         9ZMC0qLdPJMRJHjz0jrUcc5EpcC/kHWBZQucWO+QozIB1IMD1ebBhG07ePATsMd0V9Bk
         VgqszNPk1bRtgN+d9XmDrLc/gmrYVxvKtplLQwTwrMsYOLlKILCWwDapXT9h2uMtzT5h
         FQo/i+pZ9lOVySfQSByu+bJxBm2Rxlan+5U8E6j4O9RXU3cjESBiDhlTNIbCO65kCn5Y
         AEAw==
In-Reply-To: <20120504165706.GD24655@flying-gecko.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

>> Has anyone considered making nodejs and ax25 conflict? That would be=
 an
>> easy way of sidestepping this entire namespace issue.
>>
>
> FWIW, I'm fine with that. =A0Apparently either Node.js people are not
> OR someone higher in the food chain is not. =A0They are trying to
> make it so you can have Node.js AND node installed. =A0I suspect the
> actual cases where this is really desired to be very close to zero.

While I don't yet know anything about Node.js, a comment was recently
made on the wetnet list that the Node.js technology might lead to
making good use of the inherent nature of AX25 data.

If they are marked as conflicting, can it be easily overridden at insta=
ll time?

Bill - WA7NWP
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
