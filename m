From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: hamlib not compiling well
Date: Wed, 7 Jul 2004 17:10:47 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200407071710.47138.pa3gcu@zeelandnet.nl>
References: <1223.192.168.1.117.1089178842.squirrel@gateway>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1223.192.168.1.117.1089178842.squirrel@gateway>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: w9ya@arrl.net
Cc: linux-hams@vger.kernel.org

On Wednesday 07 July 2004 07:40, w9ya@arrl.net wrote:
> Hey gang;
>
> I am trying to write some Mandrake spec files for tlf and a few other
> packages. In the process I am not able to use rpm -ba to compile the spec
> files for hamlib.
>
> I am running into a problem that I have not seen before. There are files
> being created but they are without the ".so"in the file name, I tried
> adding "--enable-shared" to the configure, but this did not work, nor have
> I ever required this.

After installing libs one needs to use 'ldconfig' to configure dynamic linker 
run time bindings, as show in the manual page of ldconfig.
I presume this is your problem.

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

-- 
If the Linux community is a bunch of thieves because they
try to imitate windows programs, then the Windows community
is built on organized crime.

Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

