From: Oliver Hohlfeld <Oliver.Hohlfeld@web.de>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 22:37:03 +0100
Message-ID: <200601302237.05868.Oliver.Hohlfeld@web.de>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca> <9923fd660601301230w15ab6f53ufb50ca0d78af4065@mail.gmail.com> <9923fd660601301248r49d34f64g76dc09246dbad341@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <9923fd660601301248r49d34f64g76dc09246dbad341@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

> Ok, I still don't know what the character values mean

These are specific KISS Mode commands which are interpreted by the TNC.
You can try to look them up in a KISS related document such as [1].
Basically, the decimal value 192 stands for the end of a frame. The
next one, 255, is the most important value to achieve your goal - this
one exists the KISS mode. The repeated usage of Frame End at the end
of the sequence is just a little workaround for some TNCs, as they
'wait too long' before interpreting the frame.

Cheers,
Oliver

[1] http://people.qualcomm.com/karn/papers/kiss.html

-- 
Oliver Hohlfeld | DO1FDK | http://www.ohohlfeld.com
http://dk0td.afthd.tu-darmstadt.de/~do1fdk/ | www.ohohlfeld.com/gpgkey.txt
                 - long long ago; /* in a galaxy far far away */ -
                  - I am not a bug I am a undocumented feature -
