From: John Ronan <jpronans@gmail.com>
Subject: unix98 ptys
Date: Mon, 05 Jul 2010 21:45:29 +0100
Message-ID: <4C324469.4090500@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=z9yN4mb550diZ0co7DPwAjsaGBQR9DLcFvweMIu0SEw=;
        b=gas9lBIy8pDo0zVkKfK97V7lLO9VYPurkFLLcSu/IRFV8n67h2OxWvyx6Jue76EpLU
         IJ/9x/Wvyd09SqNZfaC+273JcstrJ/UIQSexHmffTBMjWh9I2GyIFiBYJ2WwmfuSefKd
         Ip9kaI7O4wUAlEiU0g2jVYGc55ZsMjQ/wYq40=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,

I just had a go at getting ax25 mkiss working on ubuntu 10.04.
I came across this message and was wondered if there is a similiar 
mechanism to /dev/ptmx for the receive side.

http://www.mail-archive.com/linux-hams@vger.kernel.org/msg00103.html

At the moment I'm using kissattach /dev/pts/5 1200mk 44.155.6.12
etc to attach to it.  I've never used Unix98 ptys before so any 
assistance appreciated

Regards
de John
EI7IG
