From: "IZ4EFN Alessio" <iz4efn@libero.it>
Subject: Anyone running APRSD on Slackware?
Date: Wed, 24 Mar 2004 18:10:26 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <001401c411c2$e78de420$1400a8c0@IZ4EFN>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I'm installing aprsd215b11 bye wa4dsy on a Slackware 9.1 server.

I get the following errors, both as PGM and DEAMON.

Seems like an internal compiler error, but i'm using 3.2.3 and he suggest to
compile from 3.2.

I'm also quite scared about the Slackware fact...here everyone seems to bo
running it on RH and SUSE...?!?!

Anyone already experienced this?

Thanks, Alessio.


root@Slack_ARIMO:/tmp/aprsd215# ./INSTALLPGM
Installing aprsd as a program
Making aprsd from source
g++   -Wall -pthread -mcpu=i386    -c servers.cpp
In file included from /usr/include/c++/3.2.3/backward/strstream:51,
                 from servers.cpp:61:
/usr/include/c++/3.2.3/backward/backward_warning.h:32:2: warning: #warning
This file includes at least one deprecated or antiquated header. Please
consider using one of the 32 headers found in section 17.4.1.2 of the C++
standard. Examples include substituting the <X> header for the <X.h> header
for C++ includes, or <sstream> instead of the deprecated header
<strstream.h>. To disable this warning use -Wno-deprecated.
g++: Internal error: Terminated (program cc1plus)
Please submit a full bug report.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
make: *** [servers.o] Error 1
Making aprspass from source
g++   -Wall -pthread -mcpu=i386    -c servers.cpp
In file included from /usr/include/c++/3.2.3/backward/strstream:51,
                 from servers.cpp:61:
/usr/include/c++/3.2.3/backward/backward_warning.h:32:2: warning: #warning
This file includes at least one deprecated or antiquated header. Please
consider using one of the 32 headers found in section 17.4.1.2 of the C++
standard. Examples include substituting the <X> header for the <X.h> header
for C++ includes, or <sstream> instead of the deprecated header
<strstream.h>. To disable this warning use -Wno-deprecated.
g++: Internal error: Terminated (program cc1plus)
Please submit a full bug report.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
make: *** [servers.o] Error 1
Copying /tmp/aprsd215/aprsd to /home/aprsd2
cp: cannot stat `aprsd': No such file or directory
Copying /tmp/aprsd215/aprspass to /home/aprsd2
cp: cannot stat `aprspass': No such file or directory
Copying /tmp/aprsd215/aprsddoc.html to /home/aprsd2
Install complete
User manual is aprsddoc.html.
Please cd to /home/aprsd2/ and edit INIT.TNC, aprsd.conf,
welcome.txt, and user.deny before running.
To start change dir to /home/aprsd2 and enter ./aprsd
To stop hit ctrl-C or q
To allow users other than root to run it you must change
the owner and/or mode of /home/aprsd2 and all the files in it.
Linux user/pass checking only works if run as root.
root@Slack_ARIMO:/tmp/aprsd215#

