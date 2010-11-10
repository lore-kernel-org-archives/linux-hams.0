From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Running python from ax25d?
Date: Wed, 10 Nov 2010 09:34:05 +0200
Message-ID: <4CDA4AED.8020100@sral.fi>
References: <1289341791.7453.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1289341791.7453.6.camel@localhost.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gordon JC Pearce <gordonjcp@gjcp.net>
Cc: linux-hams@vger.kernel.org

Gordon JC Pearce wrote:

> #!/usr/bin/python2 -u
> # saved as /home/gordonjcp/test.py
> # corresponding line in ax25d.conf is
> # default  * * * * * *  - gordonjcp /home/gordonjcp/test.py test.py
> import sys
> a=""
> print "Hello"
> while(a.strip()!="stop"):
>     a = sys.stdin.readline()
>     print "you typed " + a

End-of-line problems maybe? On packet radio CR is the de facto EOL
character. Python file objects readline() method probably seeks
for a LF...

Have you tried eg. sys.stdin.read(1) to see if you get what you
wrote back one character at a time?

>>From ax25d, it prints "Hello" but does not respond to any keyboard
> input.  Furthermore, if I close down the connection from call(1) I get
> the following:
> 
> Traceback (most recent call last):
>   File "/home/gordonjcp/test.py", line 7, in <module>
>     a = sys.stdin.readline()
> IOError: [Errno 107] Transport endpoint is not connected
> 
> The IO error seems to suggest that there is no connection from stdin as
> handled by ax25d to Python.  I'm not sure if this is because stdin goes
> away when the connection is closed, or because it was never there to
> begin with.

I'd say it's because the connection was closed. Although ENOTCONN is
a somewhat strange error here... hmm.

/Tomi

