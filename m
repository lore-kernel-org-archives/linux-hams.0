From: Bent Bagger <bent.bagger@fern.dk>
Subject: Re: Where Can I find CQRLOG Version 1.8.2 in RPM
 =?UTF-8?Q?version=3F?=
Date: Tue, 09 Dec 2014 09:55:54 +0100
Message-ID: <e6cbfd0fb377eccca55abbbb4fdbd029@mail.oz6bl.dk>
References: <4185404.s9vzezYYZE@linux-gn6a.site>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4185404.s9vzezYYZE@linux-gn6a.site>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Smits <bob@rsmits.ca>
Cc: linux-hams <linux-hams@vger.kernel.org>, linux-hams-owner@vger.kernel.org

Robert Smits skrev den 2014-12-09 01:13:
> I want to install the latest version of CQRLog in my Opensuse 13.1 
> laptop. Any
> idea where I can find one. All I see are fedora versions.

You could try to do a manual installation of the Fedora RPM-package. I 
have had several successes - but also some failures - doing something 
similar to this.

The procedure is briefly this:

Download the RPM-package to e.g./usr/local/src
cd to /usr/local/scr
run the command rpm -Uhx <name of RPM file>

If you are lucky it will succeed, but chances are that your system 
cannot satisfy the dependency requirements of the Fedora package. The 
Fedora package maintainers sometimes set the requirements a bit too 
tight in my oppinion.

73,  Bent/OZ6BL


