From: Dave Stubbs <dave.stubbs@utoronto.ca>
Subject: Re: Soundmodem Logging
Date: Sun, 06 Mar 2005 08:12:29 -0500
Message-ID: <422B01BD.8030509@utoronto.ca>
References: <20040213100203.62bbe780.washer@trlp.com> <20040213193911.D220@jeroen.pe1rxq.ampr.org> <422A6EFD.3060000@utoronto.ca> <422A91F6.7010809@ve7hex.ampr.org> <422AF8C8.2020506@utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <422AF8C8.2020506@utoronto.ca>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Dave Stubbs wrote:
> Niall Parker wrote:
> 
>> Dave Stubbs wrote:
>>
>>> Hello all,
>>>
>>> I'm using userspace soundmodem, and it works really great.  However, 
>>> I have a question about the soundmodem logging setup.
>>>
>>> I have the following in my script that starts up soundmodem:
>>>
>>> soundmodem -sM -v 9
>>>
>>> According to my reading, the -s switch should switch logging to the 
>>> syslog, and the -v 9 switch should enable massive amounts of logging.
>>>
>>> However, despite this, the syslog only gets one entry showing syslog 
>>> startup, while the console gets the massive spew of log items.
>>>
>>> Is there any way to redirect all these messages to the syslog 
>>> instead, where I believe my command line setup told them to go?
>>
>>
>>
>> Just a guess, but check your syslog.conf file to see what it is doing 
>> with the messages by facility and loglevel ... it may be receiving 
>> them OK and then redirecting them to the console.
>>
> Got that one covered.  I'm redirecting all syslog messages, no matter 
> how insignificant or from what facility, to a central logging server 
> which puts them in a MySQL database.  From other programs running on the 
> same hambox as soundmodem, I'm getting so much information it's crazy, 
> so I don't think syslog is the problem in this case.  Is anyone else 
> using syslog to track soundmodem packets?
> 
> One other thought - maybe the trace that's coming up on my console is 
> not from the soundmodem software - maybe it's from kernel AX.25 code or 
> something?  Is there a way to redirect *that* to the syslog?
> 

Well,

I was able to confirm that.  I set my soundmodem to -v 0 and rebooted. 
The piddly little syslog trail vanished, but I still got the massive 
spew of all packets on the console.  I put the -v 9 back into soundmodem 
startup and the syslog messages started again (such as they are) and the 
console spew remains.

So, a new question - does anyone know where the console messages (they 
start with "Tx:") come from?  Can they be redirected to syslog or sent 
there instead of the console?

Thankyou,

Dave...
VA3BHF
