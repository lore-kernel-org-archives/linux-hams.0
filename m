From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Node.js and it's future in debian
Date: Thu, 03 May 2012 08:33:43 -0700
Message-ID: <4FA2A557.1080103@trinnet.net>
References: <CACxjfDH5zYth6Q-ZDLDafqNEczbF3BqaGRcAhsaiPEnApbiUuA@mail.gmail.com> <20120501205524.GI30521@flying-gecko.net> <20120501215305.GA1250@burratino> <20120501221659.GA11430@flying-gecko.net> <20120502065003.GB2410@burratino> <20120502165031.GC7390@flying-gecko.net> <20120502171349.GA23806@burratino> <20120502200426.GF7390@flying-gecko.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20120502200426.GF7390@flying-gecko.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick Ouellette <pouelle@debian.org>
Cc: Jonathan Nieder <jrnieder@gmail.com>, node@packages.debian.org, nodejs@packages.debian.org, debian-hams@lists.debian.org, linux-hams@vger.kernel.org


Hello Gentlemen,

I thought I'd chime in since the linux-hams@vger list was added to the 
thread and give one Packet HAM's perspective.  Specifically, if one 
proposal is to rename the long existing /usr/sbin/node binary to 
/usr/sbin/axnode, why couldn't the "new guy" node.js binary be renamed 
to something like /usr/sbin/nodejs?  The later seems more of a 
reasonable proposal.

 From my experience, many MANY Linux hams have customized scripts that 
startup some very elaborate HAM systems.  For many, these scripts 
weren't written by them and the changing of the node command could be 
very difficult for some.  The other aspect is if this change came into a 
package update that could impact production systems in VERY remote 
sites.  This could cause all kinds ugliness that can be easily avoided.

I can appreciate Debian's goal to keep things moving forward but I'd 
argue that a binary name of "/usr/sbin/nodejs" would be a lot more 
informative with the two additional characters than just calling it 
"node" (and disrupting a well known binary name for us Linux packet hams).

--David
KI6ZHD


On 05/02/2012 01:04 PM, Patrick Ouellette wrote:
> On Wed, May 02, 2012 at 12:13:49PM -0500, Jonathan Nieder wrote:
>> Patrick Ouellette wrote:
>>
>>> Likewise I can argue the number of people with installed ham radio systems
>>> is a good reason NOT to change the current situation.
>> You can, yes.  But how does that move things forward at all?
> I never said it did.  Clearly both sides have valid reasons to
> not change.  Equally clear to me is one side ignored policy
> and created an issue to attempt to force a resolution they hope
> will be in their favor rather than solve the issue first.
>
>> This is not supposed to be a popularity contest.  I mentioned the
>> large pile of scripts because _every one of them would have to be
>> changed_ to have a working system.  By contrast, there are two
>> configuration files mentioned so far that refer to /usr/sbin/node.
> The scripts (on either side) could be changed with a scripted change.
>
> If it is so simple to change the configuration files for the ham radio
> users, why has not a Node.js person put forth code to do this and advocated
> it on debian-hams and linux-hams? (The "patch" sent does not address
> automatically updating anything)
>
> I've discussed it with other ham radio operators.  They shudder at the
> thought of changing the name because of the possible issues that will
> come up.
>
>> [...]
>>> If it were "easy" to get an exception, why has this not already happened?
>> Because you did not ask for one.  Instead you have been wasting time
>> arguing and defending against an opponent you seem to assume is not
>> going to care or listen to you.
> The Node.js people apparently didn't ask for one either
> pot - kettle - black
>
> As for the last line, if I thought the opponent did not care or was
> not going to listen I would not waste the time putting forth my
> position.  Since it would seem that is where we are, I won't
> continue to waste my time.
>
> Here is my proposal:
> Node.js people, put forth a reasonable and workable plan to allow
> hundreds or thousands of ham radio users to transition from
> /usr/sbin/node to /usr/sbin/axnode, including reliable shell scripts
> to verify all the files on the system are identified and allowed to
> be patched or manually modified.  You created the situation, you
> provide the manpower to resolve it in the way you prefer.
>
>
> Pat - NE4PO
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message tomajordomo@vger.kernel.org
> More majordomo info athttp://vger.kernel.org/majordomo-info.html
