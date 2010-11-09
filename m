From: Gordon JC Pearce <gordonjcp@gjcp.net>
Subject: Running python from ax25d?
Date: Tue, 09 Nov 2010 22:29:51 +0000
Message-ID: <1289341791.7453.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi all,
  I'm having some problems getting Python to work when called from
ax25d.  Specifically, stdin does not seem to be passed correctly to the
script.

Example:

#!/usr/bin/python2 -u
# saved as /home/gordonjcp/test.py
# corresponding line in ax25d.conf is
# default  * * * * * *  - gordonjcp /home/gordonjcp/test.py test.py
import sys
a=""
print "Hello"
while(a.strip()!="stop"):
    a = sys.stdin.readline()
    print "you typed " + a

When I call this from the command-line, or indeed from xinetd it behaves
as expected - it starts, prints "Hello", then prints "you typed
<whatever you typed>" when you press return.  If you type "stop", it
stops.

From ax25d, it prints "Hello" but does not respond to any keyboard
input.  Furthermore, if I close down the connection from call(1) I get
the following:

Traceback (most recent call last):
  File "/home/gordonjcp/test.py", line 7, in <module>
    a = sys.stdin.readline()
IOError: [Errno 107] Transport endpoint is not connected

The IO error seems to suggest that there is no connection from stdin as
handled by ax25d to Python.  I'm not sure if this is because stdin goes
away when the connection is closed, or because it was never there to
begin with.

Any thoughts?

Gordon MM0YEQ


