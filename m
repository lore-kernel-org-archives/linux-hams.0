From: <w9ya@arrl.net>
Subject: hamlib not compiling well
Date: Wed, 7 Jul 2004 00:40:42 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1223.192.168.1.117.1089178842.squirrel@gateway>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hey gang;

I am trying to write some Mandrake spec files for tlf and a few other
packages. In the process I am not able to use rpm -ba to compile the spec
files for hamlib.

I am running into a problem that I have not seen before. There are files
being created but they are without the ".so"in the file name, I tried
adding "--enable-shared" to the configure, but this did not work, nor have
I ever required this.

I am sure I am just brain farting on why this is happening or much more
importantly what it is I need to do to get a decent compile; but does
anyone have any helpful ideas ?

TIA

Vy 73;

Bob
w9ya




