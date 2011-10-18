From: Miroslav Skoric <skoric@eunet.rs>
Subject: RS232-USB conversion (was: Compiling FBB)
Date: Tue, 18 Oct 2011 22:07:07 +0200
Message-ID: <4E9DDC6B.8080702@eunet.rs>
References: <4E93FBEC.7050907@free.fr> <4E98B35E.1050602@eunet.rs> <4E993C82.2090601@free.fr> <4E9959B1.20704@dommel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E9959B1.20704@dommel.be>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: marcc@dommel.be
Cc: "Bernard, f6bvp" <f6bvp@free.fr>, linux-hams <linux-hams@vger.kernel.org>, Lee Woldanski <ve7fet@tparc.org>

On 10/15/2011 12:00 PM, Marc Coevoet wrote:
> Op 15-10-11 09:55, Bernard, f6bvp schreef:
>> Hello Miroslav,
>>
>> I now understand the libax25 issue.
>> Debian and alike libax25 packages are installing AX.25 libraries into
>> /usr/lib/ whereas by default xfbb link process is expecting libax25.*
>> in /usr/local/lib directory.
>>
>
> No, the link libs are known when compiled (even when different distros
> use different hierarchies). Everything can be configured in an option of
> "configure".
>

OK guys, thank you all for your advices ...will see about compiling FBB 
when I return from a conference trip. Btw, after a long time of 
avoiding to purchase a laptop/notebook comp (and still living well 
without a cellphone :-)), I have been thinking about an inexpensive 
portable comp that could run not only PPT (or similarly formatted) 
scientific presentations, but also to give me an opportunity to run my 
TNC2S (an old German-made TNC), which connects over RS232. I do not know 
if some of you have experience with some of those adapters that convert 
an USB output of a laptop to a RS232 connector of a TNC. I heard that 
some adapters (if not all) come with a kind of software that makes them 
thinking that the computer still has COM1, COM2, etc, but I don't know 
if such software works only in M$ world or/and in Linux too. (In the 
other words, I would like to have a relatively modern machine, but to 
avoid buying an expensive one that is still equipped with RS232.)

Opinions?

Misko
