From: <w9ya@arrl.net>
Subject: Re: hamlib not compiling well
Date: Wed, 7 Jul 2004 11:39:12 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4900.192.168.1.117.1089218352.squirrel@gateway>
References: <1223.192.168.1.117.1089178842.squirrel@gateway>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1223.192.168.1.117.1089178842.squirrel@gateway>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hey again gang;


I added this to the top of the spec file to get libtool to NOT libtoolize:

 %define __libtoolize /bin/true

Apparently there is a libtool version mismatch somewhere ? (Just a guess.)
Mandrake uses this:

 libtool-1.4.3-10mdk

Anyways, I am not sure these files actually work (grin)....but at least
they exist correctly and in the right places.

I tested this fix with the spec file that came with hamlib 1.2.0.src.rpm
btw, although this problem existed also with 1.1.4 as well.


Vy 73;

Bob
w9ya



> Hey gang;
>
> I am trying to write some Mandrake spec files for tlf and a few other
> packages. In the process I am not able to use rpm -ba to compile the
> spec files for hamlib.
>
> I am running into a problem that I have not seen before. There are files
> being created but they are without the ".so"in the file name, I tried
> adding "--enable-shared" to the configure, but this did not work, nor
> have I ever required this.
>
> I am sure I am just brain farting on why this is happening or much more
> importantly what it is I need to do to get a decent compile; but does
> anyone have any helpful ideas ?
>
> TIA
>
> Vy 73;
>
> Bob
> w9ya



