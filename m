From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: Re: ax25 Listen as a service
Date: Fri, 16 Dec 2005 10:40:50 -0800
Message-ID: <43A30A32.9020900@jnos.org>
References: <Pine.LNX.4.44.0512141122000.19350-100000@srv01.compumont.com>	 <43A1BAE9.4000009@jnos.org> <43A1ECE4.1020406@jnos.org>	 <620c90570512151918g52db83bbs21775d2547da100a@mail.gmail.com> <620c90570512151944n1bc95c58w9c1e0a0a4bcdcc1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570512151944n1bc95c58w9c1e0a0a4bcdcc1@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


>>>Then I sent a -HUP to xinetd and tried it.
>>>
>>>   telnet localhost 3695
>>>
>>>Wow?  I see packets scrolling by.  Pretty cool!


>>Went to try that port and found this in my services file
>>bmc-data-coll   3695/tcp   # BMC Data Collection
>>bmc-data-coll   3695/udp   # BMC Data Collection
>>
>>Not sure what it is but it is used by something.

I'm sure there are some Internet guru's on here to correct me if I'm 
wrong...  My assumption is that these incoming ports are assigned to 
this BMC process - but unless you actually install and use the BMC 
program, there's no real reason not to re-use the ports.

I picked 3695 for my Listen experiment simply because it's one more then 
the 3694 used by UroNode.

.. I have a machine
>>set up that I ssh to listen and get a listen screen but no one else has
>>been able to do it on other machines, indeed I have not either, so not
>>sure what I did that made it work on one machine...???

Are you trying the listen as a service?  Or are you running it as an 
application from ssh?   Hmmm.  I have to try that as it might be a 
better way yet to do what I want.


> Bill, our FPAC Linux boxes use port 10093 UDP to link boxes over the
> intenet, I was looking and see that the following block is not used:
> #               10081-10099 Unassigned
> Wonder if we could get that whole block assigned for amateur radio
> applications?

I know Scott has at least one port officially assigned for his OpenTrac 
project.  I'm sure others could be requested for various ham 
applications but I personally don't think it's worth the effort.  There 
are so few of us and it's so easy to move ports around..

Bill - WA7NWP
