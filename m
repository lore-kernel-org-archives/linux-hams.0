From: Jonathan Naylor <jonathan@mechserv.demon.co.uk>
Subject: Linux AX.25 Socket programming
Date: Wed, 1 Jan 2003 18:59:37 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <onKLlQBZqzE+EwXZ@mechserv.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I have seen some messages on Linux-Hams about AX.25 socket programming 
that seem to miss the potential simplicity of it. By this I mean making 
use of the existing infrastructure within the ax25-utils/ax25-lib.

AX.25 (and NET/ROM and ROSE) server development can by careful design of 
the server be made extremely easy. The program ax25d is exactly 
analogous to inetd, in that it can launch programs when an incoming 
connection is received. This is controlled by the ax25d.conf file which 
also allows for different servers to be started depending on the 
incoming interface and/or incoming callsign. The started program only 
has to read and write to stdin and stdout respectively, ax25d is also 
capable of passing command line arguments to the started program based 
on a set of substitution parameters and literal text given in its 
configuration file.

This mode of server program assumes that one program will handle one 
connection. This makes (usually) for much simpler programs that don't 
have to internally multi-task, but then places more complexity into any 
needed inter-process communication that may be needed between different 
instances of the same server. An example I can think of is for a DX 
Cluster implementation, whereby the IPC would be via a database accessed 
from all of the instances. Each server could either be multi-threaded 
with one thread to listen for incoming commands from the user and the 
other thread sending incoming spot data to the user, or alternatively a 
polling structure using select(2) with a timeout.

Servers that can be started by ax25d do not need to be in C or C++, but 
can be in Perl, Java, Ruby, COBOL or anything else that can read and 
write to stdin/stdout.

As a side note, a server designed to be used from ax25d, can just as 
easily be started by inetd and therefore be made available to users of 
an IP network also. The only caveat would be that the end of line 
convention between AX.25 and the Internet are different, I am not sure 
if the ax25-lib has support for this, but the alternative would be to 
pass an indication of the required EOL character via the command line, 
possibly as an incoming connection type e.g. ax25, netrom, rose, inet.

As I said at the beginning this only applies to server programming, for 
a client you have to get your hands dirty, and indeed for any program 
that needs to monitor traffic like listen.

Jonathan  G4KLX
