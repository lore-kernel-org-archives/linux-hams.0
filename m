From: "Douglas Cole" <n7bfs@qwest.net>
Subject: soundmodem ptt troubles
Date: Mon, 9 Feb 2004 22:25:29 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200402092225.29942.n7bfs@qwest.net>
Reply-To: n7bfs@qwest.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

Well, I have gotten soundmodem working as far as audio is concerned (receives 
packet no prob, makes noise out of sound card when tx) but when I try to 
setup soundmodem.conf for /dev/parport0 it complains "sm[15680]: 
Device"/dev/parport0" neither parport nor serport" and then goes on its merry 
way, does the same thing if I try /dev/lp0 as well...

Now I have not measured to see if any of the parallel ports pins go hi when I 
tx but as I don't know which pin to look at I am unclear on this one.
It does not complain when I change the config to /dev/ttyS0, but I would like 
to use the parallel port, so I can save the serial port for other things.
I also shutdown "lp" as I assumed that it would try and occupy the parallel 
port, but no change.

I am using the soundmodem version supplied/installed by SuSE 8.2 (rpm, no 
compiling involved), and running Linpac as a client.

Tried to find documentation on soundmodem but did not find anything but a very 
very small man page, googled "soundmodem" and "soundmodem parport" to no 
avail...
This happens on three very different pc boxen (two desktops and one laptop) 
with the same distro' installed on all three...

Sorry if most of this is obvious to those with the magic keys to making this 
stuff work, but I am still not certain where the room full of keys lie ;^}

If someone could point me in the direction of documentation that could help me 
make the parallel port do ptt I would surely appreciate the assistance.

73

Douglas Cole   N7BFS
AMSAT#26182 , K2 # 544
http://www.users.qwest.net/~cdoug3
Registered Linux user # 188922

