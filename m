From: John Magliacane <kd2bd@yahoo.com>
Subject: QSSTV Compilation Issues...
Date: Fri, 30 Apr 2010 07:19:45 -0700 (PDT)
Message-ID: <688897.8364.qm@web37601.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1272637185; bh=kdpPj42WN1WzpBHmM3pFhajsjB2cFIyWs8WcaEwtuos=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=xpybU8wnUWT8xS5qNuTqmvAHCDdBoyN1RjnIKWDb0kkosF36270qa41tT/fh8N2H/gwNAZa63mmRsE7xGsqJssQwf3huAOm6EoYJlDUeUHHF6eynJLkJpaJWXi/oCNp7LbVm2O5D4oQLetlchJgpO8FyxwrOoYzcKCB8cVQ9lgM=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello Fellow Linux Hams.

It's an issue I've tackled several times before: Compiling qsstv-5.3c under Slackware.  The problem is that I don't recall the "trick" necessary to get QSSTV's ./configure script to recognize the Qt libraries present on the system.

I vaguely remember Qt (possibly) needs to be compiled with thread support.  The latest versions of Qt default to that mode of operation.

I also remember having to make sure the QTDIR environmental variable points to the installed Qt library. Been there. Done that.

I even made sure the Qt libraries are in my /etc/ld.so.conf path, and I've run ldconfig.

Yet, I get the dreaded, "checking for Qt... configure: error: Qt (>= Qt 3.1.0) (headers and libraries) not found. Please check your installation!" error message when running the ./configure script.

I'm trying this on several different versions of Slackware, including the latest version (13.0).  I have even removed the pre-installed Qt libraries on an older distribution and compiled the latest version (Qt-4.6.2) on my own.

No dice.  :-(

Does anyone remember the "trick" necessary to get past this brick wall?

Thanks.


73, de John, KD2BD

--
Visit John on the Web at:

	http://kd2bd.ham.org/



      
