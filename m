From: "Curt, WE7U" <archer@eskimo.com>
Subject: Problems with ax25d/axspawn on OpenSuSE 11.0 32-bit
Date: Sun, 18 Jan 2009 00:22:36 -0800 (PST)
Message-ID: <alpine.LNX.1.10.0901172222000.22616@wapiti2.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: archer@eskimo.com


I saw several bugs in the AX.25 stuff yesterday/today.  First let me
say that I've configured AX.25 quite a few times on several systems
but haven't done played with "ax25d" or "axspawn" in more than ten
years.  I've done ax.25 KISS configurations and ax.25 soundmodem and
serial KISS soundmodem configs to test/use Xastir much more recently
and without a hitch.

So...  I get AX.25 kernel networking configured and working.  I use
my old 44.x IP address.  No problems so far.  "listen" is decoding
packets, I can "ping" and/or use "call" and I see packets go out.
So far so good.  I also set up Xastir on that port and it is
sending/receiving just fine over the AX.25 kernel networking port.
It's attached to a TNC-X TNC via a USB->Serial cable.

Now I start playing with "/etc/ax25/ax25d.conf" and
"/etc/ax25/axspawn.conf".  I refer to the AX.25 HOWTO (yea, it was
never up-to-date back then either, so I don't expect an easy go of
it).  I also consult two friends locally who did TCP/IP with me
years back.  They have great bits of knowledge and one helped with
on-air testing tonight (Hi Bob/Ken!).

To the meat of the matter:
--------------------------
1) First scenario:  Specifying "create_with_useradd yes" in
"axspawn.conf" to auto-create users when they first log in doesn't
work.  The account gets created just fine with LOTS of dot files in
it (apparently all the dot files "useradd" would normally stick in
there for a regular user).  There's an entry created in
"/etc/passwd" and "/etc/shadow" but the "useradd" executable stays
running.

The xterm where I earlier started "ax25d" starts spewing "waitpid"
errors and goes to 75% CPU usage ("waitpid (15185) failed: No child
process").  I kill the xterm and "useradd" goes to 92% CPU usage.

I kill "useradd" and things go to normal except for an empty
password for the new user, so he can't log in.  The user gets
disconnected by the Linux box.  After root changes his password he's
able to log in at the point.

2) Second scenario:  Specifying "create_with_useradd no" in
"axspawn.conf".  In this case there are fewer files created in the
new account (two dot files) but the new account creation step goes
without a hitch.

Except: There's still no password for the user so the root user has
to set it, and GET THIS:  The encrypted password string ends up in
"/etc/passwd" instead of "/etc/shadow"!  Do the AX.25 programs know
about and check "/etc/shadow" for the encrypted password strings?

3) The next problem:  Information that the user has requested seems
to only send the last 256 bytes or less across RF.  The earlier
stuff just disappears.  For instance he did this:

     cd /usr/bin
     ls

and got one line sent to him containing two filenames starting with
'z'.  I have 7275 files in that directory.  I watched the packet go
out with "listen" and nothing was sent before that.

4) Oh yea, when the remote user types "exit" I see a stack trace and
memory dump from "axspawn" on the xterm I started "ax25d" from.
Doesn't sound like a nice exit.

5) There were also cases, I believe right after the account was
created but before the password was set by root, that the remote
user got odd messages from "login" about not specifying the correct
number of parameters.  After the password was set by root these
messages went away.  Yea, documented below.

6) The remote user got messages about ".bcpasswd" not being present.
I don't know what that was about, but I see that a
"/etc/ax25/bcpasswd" file was touched by the system and I didn't
edit that one by hand.  It mentions "$HOME/.bcpasswd".

OpenSuSE 11.0 32-bit, all the updates applied.  2.6.26.18 kernel.
AX.25 RPM's installed from OpenSuSE-11.0 ham repository.  AX.25
stuff loaded as modules:

     Module                  Size  Used by
     af_packet              38656  4
     mkiss                  28292  1
     ax25                   74728  7 mkiss
     crc16                  18432  1 mkiss

Configs available on request.

Here's a few notes from the latest attempts:

---------------------------------------------------------------------

Useradd YES:
------------
xterm at 75% CPU printing:
waitpid (15185) failed: No child process
Killed xterm
useradd at 92% CPU.
kill 15184
kill 15184
kill -9 15184

Bob got this:
"Notice: No .bcpasswd file found in your homedirectory (for more
secure password authentication than plaintext). Generating example
file, with unique passwords (which may be changed).  Please edit
~/.bcpasswd, and enable your prefered authentication type; MD5 is
recommended."

Passwd line:
kd7nm:x:2001:1000:kd7nm:/home/ax25/kd7.../kd7nm:/bin/bash

Shadow line:
kd7nm:+:14262:0:99999:7:::

Blank login didn't work.
     Login incorrect
     wapiti2 login:

Root changed his password to "kd7nm".
He logged in.

Passwd line is the same, Shadow line is now:
kd7nm:$2a$10$KNDr8D1fMk92vie7/T6wd.g35q4yhp4aBA4bojFJ8plAtw60Zstdu:14262:0:99999:7:::

---------------------------------------------------------------------

Useradd NO:
-----------
Account created, user disconnected right away.  Two files in user
account:  .bcpasswd and .profile

Passwd line:
kd7nm:+:2001:1000:kd7nm:/home/ax25/kd7.../kd7nm:/bin/bash

No Shadow line.

User cannot connect.  Says:
   "login: Too many arguments
   Try `login --help' or `login --usage' for more information."
and then immediate disconnect.

Root changed his password to "kd7nm".
He logged in.

Passwd line:
kd7nm:$2a$10$djAnco8ODzBCug0lWYVareg1IjVgf3SzrFhltBeN9daYnIwYaLqEC:2001:1000:kd7nm:/home/ax25/kd7.../kd7nm:/bin/bash

No Shadow line.

   "Last login: Sat Jan 17 23:53:34 PST 2009 from AX.25 on pts/20
   Have a lot of fun...
   kd7nm@wapiti2:~>"
---------------------------------------------------------------------

Comments?

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
