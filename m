From: wb9mjn <wb9mjn@wb9mjn-11.ampr.org>
Subject: RE: Linux Newbie with Compiling Problems...
Date: Sun, 2 Mar 2003 16:05:40 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <01C2E0D5.929E50E0.wb9mjn@wb9mjn-11.ampr.org>
Reply-To: "wb9mjn@wb9mjn-11.ampr.org" <wb9mjn@wb9mjn-11.ampr.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: Linux Hams mailing list <linux-hams@vger.kernel.org>


   Hi Ray,

      I used Kpackage and went through all the disks manually. Trying 
Rpmdrake, now, I see I wasted some time, but the as86 is still not there.

   Hi Hamish,

     According to the notes on the dev86 package, it includes the real mode 
assembler. But which file it is I am not sure. The 'asm' entry is not an 
executable. And 'as86' is not in there either !?


      73, Don...




-----Original Message-----
From:	Ray Heasman [SMTP:ray@isdmg.com]
Sent:	Sunday, March 02, 2003 3:34 PM
To:	wb9mjn@wb9mjn-11.ampr.org
Cc:	Linux Hams mailing list
Subject:	RE: Linux Newbie with Compiling Problems...

Hi Don,

On Sun, 2003-03-02 at 09:20, wb9mjn wrote:
>
>
> Hi Kelly, Jean and Bernard,
>
>     I am stuck again. Cannot find the bin86 package in the collection of
> Mandrake 7.2 disks here. Did find dev86, which I installed, but it had no 

> effect on the compilation. It still wants as86.
>
>     Does anybody know which package in Mandrake 7.2 one can find the as86 

> assembler program?
>

It's been a while since I used Mandrake, but there are two commands you
may find very useful: "rpm" and "rpmdrake". You can use "man rpm" to
find out more about rpm.

RPMDrake specifically allows you to search your Mandrake disks for the
RPM containing a specific file.

Rpm itself has some useful tools, like, to find out what rpm provided a
particular file, do "rpm -qa --whatprovides /path/to/file".

Hope this helps,
Ray


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

