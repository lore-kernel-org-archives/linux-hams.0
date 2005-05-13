From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: LoTW: TrustedQSL-1.11 fails to compile
Date: Fri, 13 May 2005 16:46:42 +1000
Message-ID: <20050513064642.GA2617@cloud.net.au>
References: <200505131733.33152.w.knol@niwa.co.nz>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200505131733.33152.w.knol@niwa.co.nz>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Fri, May 13, 2005 at 05:33:32PM +1200, Wilbert Knol wrote:
> GCC 3.3.2 complains:
> 
> make[1]: Entering directory `/home/wk/Documents/src/TrustedQSL-1.11'
> g++ -DHAVE_CONFIG_H -I. -I. -I.    -Wall `"/usr/local/bin/wx-config" 
> --cxxflags` -I/usr/local/include -I/usr/include -I/usr/include -g -O2 
> -c -o tqsl.o tqsl.cpp
> tqsl.cpp: In member function `bool MyFrame::ConvertLogFile(void*, 
> wxString&, wxString&, bool, bool)':
> tqsl.cpp:759: error: invalid conversion from `const void*' to `void*'
> make[1]: *** [tqsl.o] Error 1
> make[1]: Leaving directory `/home/wk/Documents/src/TrustedQSL-1.11'
> make: *** [all] Error 2
> [wk@wk TrustedQSL-1.11]$
> 
> This looks like sloppy code to me - a casting problem? I don't know 
> enough about C++ to fix this...has anyone managed?

We build it on Debian with g++ 3.3.5 without incident...


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
