From: "Riley Williams" <Riley@Williams.Name>
Subject: RE: making apps
Date: Fri, 28 Mar 2003 08:26:38 -0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <BKEGKPICNAKILKJKMHCAMEAGCEAA.Riley@Williams.Name>
References: <20030328041621.445F72B22C@www.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030328041621.445F72B22C@www.fastmail.fm>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Jose A. Amador" <co2ja01@fastmail.fm>, Shane <vk3bvp@qsl.net>, Linux Hams <linux-hams@vger.kernel.org>

Hi Jose.

 >>> Starting out with Mandrake 9.0, and trying to get ax25 up.
 >>> Looked at pa3gcu's page, and followed instructions. Everything
 >>> worked except make on ax25-apps-0.0.6, which bombed while
 >>> making call. Of course, it all scrolls up and off the screen.
 >>> Can someone point me to how to look at this (working at
 >>> command prompt Ctrl-Alt-F1, so no xterm scrollbar :-)

 >> Shift + page up | down

 >>> so I can see better where exactly the bomb-out is? It's
 >>> repeatable.

 > You could also make a log of your compilation with something
 > similar to:
 >
 >         make > /tmp/making_apps 2>&1
 >
 > Hope this helps. Guess that ncurses might be related as you were
 > suggested before. Shane's suggestion (using the rpm) could be
 > the easy way out...

When it comes to making logs of what's going on, I generally do...

           make 2>&1 | tee make.log

...as that puts the log on the screen and lets me watch what it's
doing, so I don't get bored watching an unchanging screen. Also, by
dropping the log in the current directory, I know what it relates to
if I forget to erase it and come back to it later.

Best wishes from Riley G7GOD / KB8PPG
---
 * Nothing as pretty as a smile, nothing as ugly as a frown.

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.465 / Virus Database: 263 - Release Date: 25-Mar-2003

