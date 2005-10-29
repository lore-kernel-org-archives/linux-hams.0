From: "Henk Oegema" <henk@oegema.com>
Subject: RE: KPSK install problem
Date: Sat, 29 Oct 2005 22:14:23 +0200
Message-ID: <MBEEJPNKIJCJGNMGGBLBEEJFCFAA.henk@oegema.com>
References: <4363D46A.9020206@gmail.com>
Reply-To: <henk@oegema.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4363D46A.9020206@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Veldhuis <kd8atu@gmail.com>
Cc: linux-hams@vger.kernel.org

I dont have any files with a name db.h
When I do a 'whereis db.h' I get: /usr/share/man/man3/db.3.gz

Neither in /usr/include nor /usr/local/include is db.h

73, Henk
ON4HSO


-----Oorspronkelijk bericht-----
Van: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org]Namens Joe Veldhuis
Verzonden: zaterdag 29 oktober 2005 21:59
Aan: henk@oegema.com
CC: linux-hams@vger.kernel.org
Onderwerp: Re: KPSK install problem


The preprocessor can't find the header. You might try explicitly telling 
it where it is by passing a CPPFLAGS parameter to configure. Figure out 
where db.h is (probably /usr/include or /usr/local/include) and specify 
it like so:

$ CPPFLAGS=-I/usr/include ./configure (options)

Worth a try anyway.

-Joe, KD8ATU

Henk Oegema wrote:
> logcore.h::::27:16 db.h: No such file or directory
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

