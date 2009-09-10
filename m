From: Collin Hockey <hockeyc@umich.edu>
Subject: mkiss in ubuntu kernels?
Date: Thu, 10 Sep 2009 18:44:12 -0400
Message-ID: <3013ad3b0909101544p7eed537fudd5fb92a681a4d44@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=CzOudhnFBygTIEYkAx3LNB/SANVvfhl5LPh0t9pyW5E=;
        b=PO0Xb88oQWx6KHJrqJyXxmAGu5532V3Eff2zUJDmGyta9AzpYA3KVouOma8IvBAprI
         RqZXpO4PIlX+VMnUV3LQukWaX7l/HkYLkWlqgN87Vi39uR0VPQ5oaiJZcbtPTVXlwVGX
         LsQ9ZGkkLvOY++ZZL/dLHP+ktbHwf9b3blwL0=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi everyone, and thanks in advance for any help.

I've been working for the past several days on getting a Kantronics
9612 paired with an iCom IC-910 for packet communication over KISS
working using the linux AX.25 stack. I have successfully set up
kissattach and related utilities to be able to send data back and
forth at 1200 baud.

I also need to communicate at 9600 baud. For the Kantronics TNC, this
requires talking to the radio over Port 2. My current understanding is
that packet routing is done using parts of the KISS protocol and that
this is achieved by using mkiss to split the physical serial port into
two pseudo ttys, which I can then use kissattach on separately to talk
to each port.

All of the documentation I have been able to find though assumes the
old style psuedo-tty setup, where master and slave pairs are numbered,
and plenty are pre-loaded by the kernel for use by user programs.
However, at least in my kernel (2.6.28), the client program is
supposed to request the single pseudo-tty master file, and the kernel
creates a new slave for each connection. There tends to be a pile of
these in my pseudo-tty slave directory, so I never know which one to
connect to. We do need to automate and script most of these
connections, so I do need to reliably be able to tell which slave tty
I need to connect to.

Hopefully I've explained the problem well enough to be understood, and
I would appreciate any help or suggestions you might have.

Thanks again,
Collin Hockey
