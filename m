From: Nate Bargmann <n0nb@networksplus.net>
Subject: Re: Distance measuring
Date: Tue, 6 Jan 2004 19:59:11 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040107015911.GF27234@localhost>
References: <200401061152.01460.phil@spiderweb.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200401061152.01460.phil@spiderweb.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

* Phil <phil@spiderweb.com.au> [2004 Jan 06 18:19 -0600]:
> Hello Everyone,
> 
> I'm looking for a Linux application, or maybe the code that does the 
> calculation, that will measure the distance between two points given the 
> latitude and longitude. I've seen applications that measure the distance 
> between grid squares but that's not what I need.
> 
> Can anyone help?

Hi Phil.

You might also want to check out Hamlib at http://sf.net/projects/hamlib

Last summer a substantial amoutn of re-work went to locator.c in the src
directory which implements just the functions you're looking for.
Hamlib is written in C and it's a reasonably simple matter to install
the library and use those functions in your program.  I won't guarantee
the code to return extremely accurate results, but they seem reasonable.

Right now the only way to get the latest changes is through CVS although
a stable release is expected in the next few weeks.

HTH,

73, de Nate >>

-- 
 Wireless | Amateur Radio Station N0NB          |  Successfully Microsoft
 Internet | n0nb@networksplus.net               | free since January 1998.
 Location | Bremen, Kansas USA EM19ov           |  "Debian, the choice of
  Amateur radio exams; ham radio; Linux info @  |     a GNU generation!"
             http://www.qsl.net/n0nb/           |   http://www.debian.org
