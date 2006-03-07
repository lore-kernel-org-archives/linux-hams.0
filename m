From: "David D. Hagood" <wowbagger@sktc.net>
Subject: Re: Band dropdown missing in GMFSK
Date: Tue, 07 Mar 2006 17:35:05 -0600
Message-ID: <440E18A9.30407@sktc.net>
References: <440CF9FE.7050206@sktc.net> <1141741387.4175.11.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1141741387.4175.11.camel@oh2bns.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tomi Manninen <oh2bns@sral.fi>
Cc: linux-hams@vger.kernel.org

Tomi Manninen wrote:

> Check Settings->Preferences->Hamlib->Features->Set QSO data frequency.
That was it.
> Note that gMFSK won't actually set the band. 
And that was my misunderstanding - that given hamlib gmfsk would set the 
frequency if asked. Another good reason why "Expected results" is so 
important on a bug report - to see if the user is expecting something 
other than what the program is designed to do.


>> Also, when I then create a log entry to XLog, the band is not set. 
>> Again, I could set the band manually, but ....
> 
> Hmm.. This seems to work for me, although the behaviour depends on

I found this one out - I needed to turn OFF using a Optionmenu for the 
band, and use an editbox - that way the real frequency gets written to 
the log.

Thanks a log, er, lot!

73 de N0YKG
