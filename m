From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re: Suse 9.1 and Xastir problems compiling
Date: Wed, 07 Jul 2004 01:02:58 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40EB4BC2.23430.2E9809@localhost>
References: <40E9E13A.8090207@ftc-i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <40E9E13A.8090207@ftc-i.net>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: "Gale D. Wilkinson" <gdwrbw@ftc-i.net>


---
On 5 Jul 2004 at 19:16, Gale D. Wilkinson wrote:

> I am having a problem getting Xastir to compile on Suse 9.1 as the 
> ./configure script says it can not find the Motif devel files.  Per Yast 
> they are installed.  Even went so far as to remove Motif and install 
> Lesstif with the same results. 

Are you sure you have installed the devel files? Some 
distributions split library packages into a package which 
includes the library itself, and a -devel package which 
includes the files needed for compilation (mainly .h files).

