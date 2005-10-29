From: "Henk Oegema" <henk@oegema.com>
Subject: FW: KPSK install problem
Date: Sat, 29 Oct 2005 21:40:26 +0200
Message-ID: <MBEEJPNKIJCJGNMGGBLBCEJECFAA.henk@oegema.com>
Reply-To: <henk@oegema.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org



-----Oorspronkelijk bericht-----
Van: Henk Oegema [mailto:henk@oegema.com]
Verzonden: zaterdag 29 oktober 2005 21:37
Aan: Joe Veldhuis
CC: linnux-hams@vger.kernel.org
Onderwerp: RE: KPSK install problem


I have now installed Berkeley DB lib version 4.0

However, I still get the same errors as before:
(./configure was ok)

logcore.h::::27:16 db.h: No such file or directory
logcore.h:115: error: syntax error before '*' token
logcore.h:116: error: syntax error before '*' token
logcore.h:117: error: 'DBT' was not declared in this scope
logcore.h:117: error: 'data' was not declared in this scope
logcore.h:117: error: 'DBT' was not declared in this scope
logcore.h:117: error: 'key'was not declared in this scope
make[3]: ***[kpskmeter.o] Error 1
make[3]: ***[all-recursive] Error 1
make: *** [all] Error 2
henkoegema@linux:~/kpsk-1.0.1>

Any other clue ??

73, Henk
ON4HSO / PA2HO




-----Oorspronkelijk bericht-----
Van: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org]Namens Joe Veldhuis
Verzonden: zaterdag 29 oktober 2005 17:08
Aan: henk@oegema.com
CC: linux-hams@vger.kernel.org
Onderwerp: Re: KPSK install problem


Sounds like you might have an incompatible version of the Berkeley DB 
lib installed. Make sure you're using the 4.0 series, not something 
older or newer.

Just an idea, might work, might not.
-Joe, KD8ATU

Henk Oegema wrote:
 > stuff
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

