From: Jonathan Naylor <jonathan@mechserv.demon.co.uk>
Subject: ANN: UKW Tools 0.3.2 released
Date: Tue, 9 Mar 2004 18:49:58 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <dFemtxAWHhTAFwRT@mechserv.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi Folks

I'm pleased to announce that UKW Tools 0.3.2 has been released. This is 
an amateur radio GIS program type thingy, that allows for radio 
coverage, path plots and other good things to be done. In coverage mode 
it can be used for tracing the coverage of FM repeaters for example, the 
path plot mode is more useful for microwave types who want to get the 
path loss over a given path. There are lots of other bits and pieces 
that it does. The propagation model that it uses is the same as that 
used by John KD2BD in Splat!

By using the wxWidgets (nee wxWindows)  library, I have been able to 
make it portable to Windows also, and a Windows installer based version 
is also available on my web site.

The source code for UKW Tools is GPL as is my source for the Windows 
installer.

As released UKW Tools requires terrain data which is freely available on 
the Internet but requires access to broadband due to the amount 
required. The basic data I use is named SRTM and covers most of the 
earth at 90m-ish intervals but is sometimes inaccurate. I use either 
GTOPO30 or Globe data that covers the earth at 900m-ish intervals to 
remove any faults it finds.

UKW Tools can be downloaded from http://www.qsl.net/g4klx under 
Software.

My previous bits of software such as LinWSJT, MTrack and Baken are still 
available from the same place.

Share and Enjoy

Jonathan  G4KLX

PS does anyone know where I can get the source code for a soft decision 
Reed Solomon decoder ?
