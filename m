From: Jim Kusznir <jkusznir@gmail.com>
Subject: Linux Packet Interface Hardware
Date: Tue, 15 Jun 2010 16:43:45 -0700
Message-ID: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=W8piSmyWonqsOODb135UC2eAnsC1Ep6ZzL6z1pNjd2s=;
        b=ReT7EUb6cVQ+IRrKFgN3t/Grd7tGHXe2+7p2vbbNJkPGNtk3ij3NiAj3eiUbI/G3oj
         mVh/L2QBQ+caGBlqOh8su8M1atONb7TFV2eXyVPkZ7ro54yFvA98DhLjixTno4hoKN8v
         CIBz530OCuyDr5gcNITaV7+u2efa4Y48izkFw=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi all:

I'm in the process of designing some kinda-embedded applications that
will need to employ packet "compatibility layers" to allow access of
packet radios.

In one application, I'm proposing relacing a node stack with a linux
box, some interface (subject of this e-mail), and the existing radios
with their audio (discriminator if appropriate), tx line, squelch
line, etc.  Other applications may not be as demanding as the nodes,
but similar.  In essence, I'm looking for a device to connect to the
equivalent of the 6-pin mini-din connector used for "data" on most
modern radios and linux.

I'm familiar with the state of the art back in the late '90's.  I also
realize that not a lot has necessarily changed since then....
However, I suspect something may have.

the solution should be capable of running several different packet
interfaces, and at 9600 or 1200 baud.  These interfaces should turn
into linux axX interfaces.

I know one solution is to get modern TNCs (such as the PK-96, etc),
and either put them in kiss mode or replace the rom with a KISS-only
rom.  I know that linux can do sound card packet as well.  However,
I'm wondering if there's something inbetween.  I'm not entirely
against the sound card TNC option, but have some questions as to the
robustness and performance of such a system.  Also, its likely in my
implementation that I'd be using usb audio adapters to provide the
sound card.  And I want to do 9600 baud with them.  Of course, there's
also the how-to-key-the-transmitter problem as well.

I see in the linux kernel support for YAM and some others; are any of
these viable solutions?  Anything else to recommend?

Thanks!
--Jim, K7LL
