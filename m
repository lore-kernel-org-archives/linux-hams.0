From: Doug <appld@sasktel.net>
Subject: Loading packages
Date: Wed, 17 Mar 2004 20:48:08 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5.1.0.14.2.20040317204718.04da6200@mail.sasktel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I am running FC-1 with kernel 2.4.22.2174.nptl. When I tried to load a 
couple of
development packages, the system told me it could not find libxml2. I tried to
load it from the cd, and then the system said that the package was already in
the system is was newer then the one I was trying to load. In other words,  it
looks like the package I wanted to load required the old copy. The new one must
of been picked up by YUM.

The question is, how do I go about doing this. Do I remove the new rpm, 
reload the
old and then load the application that I wanted? Then, reload the newer 
rpm??? What
I am afraid of, is that if I do this, it will come back with other files it 
needs.

What is the best way of doing this??

Thanks

Doug VE5DA 

