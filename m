From: "TIMOTHY POWELL" <kd4iky@peoplepc.com>
Subject: AX25 socket question.
Date: Sun, 14 Jul 2002 12:01:11 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020714120112.23833.h011.c002.wm@mail.peoplepc.com.criticalpath.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Got a question about the below code copied from the
listen.c file that came with ax25-apps-0.0.4

if ((s = socket(AF_PACKET, SOCK_PACKET, htons(proto)))
== -1) {
		perror("socket");
		return 1;
	}
I'm new to sockets so I'm a little confuse.  From what
i read from the man pages about sockets if i want to
create a socket for ax.25 I would do something similar
to the following:

axsock = socket(PF_AX25, SOCK_STREAM, <?>) ;

I am assuming that AF_PACKET and SOCK_PACKET, used in
the first piece of code, are just variables used by the
programmer to create any type socket he wanted, since I
couldn't find metion of them in the man pages or any
where else.  In my example, axsock, am I correct in the
way i wrote the function except for <?> if all i want
to do is create a socket for AX25?  <?> is where the
protocol is sure post to be, which protocol do you use?
 I tried to find the function 
htons(proto) in the code but couldn't so I'm not sure
which protocol to use with AX25.  I looked in the file
/ect/protocols but didn't see anything for AX25, but
there was one for radio.  Can some one give me 
a little incite on how to create a socket just for
AX25?  Thanks I'll keep looking over the code and
reading to try and learn as much as possible.  Thanks.

Timothy 
KD4IKY

________________________________________________
PeoplePC:  It's for people. And it's just smart. 
http://www.peoplepc.com 
