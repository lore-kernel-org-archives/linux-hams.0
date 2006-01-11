From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: RE: AX25 patches and how it affects the end user
Date: Wed, 11 Jan 2006 17:14:05 -0500
Message-ID: <000d01c616fc$5624f4b0$3849a8c0@lan.w1nr.net>
References: <9923fd660601110945p4c4ce12aw3311ae7e55111df1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <9923fd660601110945p4c4ce12aw3311ae7e55111df1@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Douglas Cole' <doug.n7bfs@gmail.com>, linux-hams@vger.kernel.org

Hi Douglas,
   Your best bet is to run the latest "stable" release.  Unstable's are for
those with time and expertise to "hack".
   It all depends on when Debian updates it's kernel.  The patches have gone
into the latest "git" on Kernel.org.  When Debian fetches the kernel from
there is anyone's guess.  In about another week, SuSE will release 10.1
Beta1.  I don't even know if it will get into that.  You can always install
Debian and get the kernel source from kernel.org and build it.  I would at
least wait until 2.6.15.1 (in kernel.org's numbering) instead of trying to
patch things.
   If Debian is running the 2.6.14 kernel, then you are probably OK.  The
changes that broke it are not in that version.  These "patches" that you see
are due to recent changes for multiprocessor hardware, but other things got
broken at the same time.

Mike, W1NR

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Douglas Cole
Sent: Wednesday, January 11, 2006 12:46 PM
To: linux-hams@vger.kernel.org
Subject: AX25 patches and how it affects the end user

If all could bear with my ignorance, but with all these patches flying
around in the last few weeks, if I were to install the latest Debian
unstable downloaded ISO would that include all this work, so that when I do
the install I will have a working AX25 setup using kissattach? Or do I still
have to learn how to patch again (haven't done any patching in 6 years)?


And thanks to all for the input on my previous thread, I have decided to
plunge into the world of Debian for my Amateur radio station setup, I just
hope I can keep my head above the water...

73


--
Douglas Cole
N7BFS
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html

