From: =?ISO-8859-1?Q?Bruno_Tr=E9guier?= <Bruno.Treguier@shom.fr>
Subject: Re: Issue with RS232 <-> USB adaptor (FC15)
Date: Tue, 14 Jun 2011 23:39:21 +0200
Message-ID: <4DF7D509.20202@shom.fr>
References: <4DF663E7.7040100@f8arr.org> <4DF66BF8.6090003@shom.fr> <4DF672E6.7050403@f8arr.org> <4DF678B0.1080600@shom.fr> <4DF67C02.4060200@radagast.org> <4DF68088.9070501@f8arr.org> <4DF7CA10.1090202@f8arr.org> <4DF7CC0F.8020602@shom.fr> <4DF7CD59.4020007@f8arr.org> <4DF7D0A2.7030507@f8arr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shom.fr; s=20100103;
	t=1308087563; bh=QdJCuRTE509EWx5fjg5JWxPG3DEHCxcH8bTrwpaEQJM=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=HsuPSWb/wHfK
	osDfvDCjJl46RqP4IMYDxSy0G6xNmlDe2f3h7afGIAI08x8qymy24bI/LoWtWykcW11
	b6doYAGdGEZ+TNp0MQyyoo5AvV1VAcnBhwdkVxT5wA7c5ioLv8nQ4jcuQcuMYrwWkXM
	t5kvMFIN7WO9+XGjQ5A7pXNdI=
In-Reply-To: <4DF7D0A2.7030507@f8arr.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Le 14/06/2011 =E0 23:20, f8arr a =E9crit :
> I found !!!!!!!!!!!!!!!!!!!!!!!!!
>
> The problem came from modem-manager lauched by dbus.
> In order to desactivate I had to remove
>
> /usr/share/dbus-1/system-services/org.freedesktop.ModemManager.servic=
e
>
> The following trace on /var/log/messages put me on the rails:
>
> Jun 13 14:32:24 f8arr2-station modem-manager[721]: <info> (ttyUSB0)
> closing serial port...
> Jun 13 14:32:24 f8arr2-station modem-manager[721]: <info> (ttyUSB0)
> serial port closed
> Jun 13 14:32:24 f8arr2-station modem-manager[721]: <info> (ttyUSB0)
> opening serial port...
> Jun 13 14:32:24 f8arr2-station modem-manager[721]: <info> (ttyUSB1)
> closing serial port...
> Jun 13 14:32:24 f8arr2-station modem-manager[721]: <info> (ttyUSB1)
> serial port closed
> Jun 13 14:32:24 f8arr2-station modem-manager[721]: <info> (ttyUSB1)
> opening serial port...
> Jun 13 14:32:24 f8arr2-station modem-manager[721]: <info> (ttyUSB0)
> closing serial port...
> Jun 13 14:32:24 f8arr2-station modem-manager[721]: <info> (ttyUSB0)
> serial port closed

Well done ! But it's rather strange that "fuser" didn't give away the=20
name of the culprit... As the modem-manager application seems to keep=20
opening and closing the ttys, you must have been unlucky and "fuser"=20
checked just when the port was closed...


> This is working now !!
> Thanks everybody for support

Well, thanks to you, as there is no doubt this kind of information is=20
useful for everybody. We can all be victims of those little processes=20
launched without notice (usually at session startup time). Linux is=20
becoming too complicated sometimes, haha ! :-)


> Let's go on the rock now (EME) !!!

Good luck ! Maybe we'll have the opportunity to make a QSO via=20
moonbounce one day: I'm a member of F6KHM here in Brest, and we have a=20
nice 10.30m dish, that we use for EME too. ;-)

Best regards,

Bruno - F8FIV
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
