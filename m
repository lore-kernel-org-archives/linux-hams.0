From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Node.js and it's future in debian
Date: Thu, 03 May 2012 08:29:27 -0700
Message-ID: <4FA2A457.4020409@trinnet.net>
References: <CACxjfDH5zYth6Q-ZDLDafqNEczbF3BqaGRcAhsaiPEnApbiUuA@mail.gmail.com> <20120501205524.GI30521@flying-gecko.net> <20120501215305.GA1250@burratino> <20120501221659.GA11430@flying-gecko.net> <20120502065003.GB2410@burratino> <20120502165031.GC7390@flying-gecko.net> <20120502171349.GA23806@burratino> <20120502200426.GF7390@flying-gecko.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------020207080707000607020302"
Return-path: <bounce-debian-hams=debian-hams=m.gmane.org@lists.debian.org>
In-Reply-To: <20120502200426.GF7390@flying-gecko.net>
Resent-Message-ID: <qz4CC44iM7J.A.iKD.fYroPB@bendel>
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:debian-hams@lists.debian.org>
List-Help: <mailto:debian-hams-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hams-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hams-request@lists.debian.org?subject=unsubscribe>
To: Patrick Ouellette <pouelle@debian.org>
Cc: Jonathan Nieder <jrnieder@gmail.com>, node@packages.debian.org, nodejs@packages.debian.org, debian-hams@lists.debian.org, linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------020207080707000607020302
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


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
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--------------020207080707000607020302
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font size="-1"><br>
      Hello Gentlemen,<br>
      <br>
      I thought I'd chime in since the linux-hams@vger list was added to
      the thread and give one Packet HAM's perspective.&nbsp; Specifically,
      if one proposal is to rename the long existing /usr/sbin/node
      binary to /usr/sbin/axnode, why couldn't the "new guy" node.js
      binary be renamed to something like /usr/sbin/nodejs?&nbsp; The later
      seems more of a reasonable proposal.<br>
      <br>
      From my experience, many MANY Linux hams have customized scripts
      that startup some very elaborate HAM systems.&nbsp; For many, these
      scripts weren't written by them and the changing of the node
      command could be very difficult for some.&nbsp; The other aspect is if
      this change came into a package update that could impact
      production systems in VERY remote sites.&nbsp; This could cause all
      kinds ugliness that can be easily avoided.<br>
      <br>
      I can appreciate Debian's goal to keep things moving forward but
      I'd argue that a binary name of "/usr/sbin/nodejs" would be a lot
      more informative with the two additional characters than just
      calling it "node" (and disrupting a well known binary name for us
      Linux packet hams).<br>
      <br>
      --David<br>
      KI6ZHD<br>
      <br>
    </font><br>
    On 05/02/2012 01:04 PM, Patrick Ouellette wrote:
    <blockquote cite="mid:20120502200426.GF7390@flying-gecko.net"
      type="cite">
      <pre wrap="">On Wed, May 02, 2012 at 12:13:49PM -0500, Jonathan Nieder wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Patrick Ouellette wrote:

</pre>
        <blockquote type="cite">
          <pre wrap="">Likewise I can argue the number of people with installed ham radio systems
is a good reason NOT to change the current situation.
</pre>
        </blockquote>
        <pre wrap="">
You can, yes.  But how does that move things forward at all?
</pre>
      </blockquote>
      <pre wrap="">
I never said it did.  Clearly both sides have valid reasons to
not change.  Equally clear to me is one side ignored policy
and created an issue to attempt to force a resolution they hope
will be in their favor rather than solve the issue first.

</pre>
      <blockquote type="cite">
        <pre wrap="">
This is not supposed to be a popularity contest.  I mentioned the
large pile of scripts because _every one of them would have to be
changed_ to have a working system.  By contrast, there are two
configuration files mentioned so far that refer to /usr/sbin/node.
</pre>
      </blockquote>
      <pre wrap="">
The scripts (on either side) could be changed with a scripted change. 

If it is so simple to change the configuration files for the ham radio
users, why has not a Node.js person put forth code to do this and advocated
it on debian-hams and linux-hams? (The "patch" sent does not address
automatically updating anything)

I've discussed it with other ham radio operators.  They shudder at the
thought of changing the name because of the possible issues that will
come up.

</pre>
      <blockquote type="cite">
        <pre wrap="">
[...]
</pre>
        <blockquote type="cite">
          <pre wrap="">If it were "easy" to get an exception, why has this not already happened?
</pre>
        </blockquote>
        <pre wrap="">
Because you did not ask for one.  Instead you have been wasting time
arguing and defending against an opponent you seem to assume is not
going to care or listen to you.
</pre>
      </blockquote>
      <pre wrap="">
The Node.js people apparently didn't ask for one either
pot - kettle - black

As for the last line, if I thought the opponent did not care or was
not going to listen I would not waste the time putting forth my
position.  Since it would seem that is where we are, I won't
continue to waste my time.

Here is my proposal:
Node.js people, put forth a reasonable and workable plan to allow
hundreds or thousands of ham radio users to transition from 
/usr/sbin/node to /usr/sbin/axnode, including reliable shell scripts
to verify all the files on the system are identified and allowed to
be patched or manually modified.  You created the situation, you 
provide the manpower to resolve it in the way you prefer.


Pat - NE4PO
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to <a class="moz-txt-link-abbreviated" href="mailto:majordomo@vger.kernel.org">majordomo@vger.kernel.org</a>
More majordomo info at  <a class="moz-txt-link-freetext" href="http://vger.kernel.org/majordomo-info.html">http://vger.kernel.org/majordomo-info.html</a>
</pre>
    </blockquote>
  </body>
</html>

--------------020207080707000607020302--

