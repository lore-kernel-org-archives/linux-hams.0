From: "Lane Wilson" <lwilson@dccnet.com>
Subject: Problems with ax25 support in 2.4.18 kernel ?
Date: Tue, 10 Dec 2002 08:45:08 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <000101c2a06b$8046e5b0$1401a8c0@LANE>
Reply-To: <lwilson@dccnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Is there any hams out there who are running the ax25 ham radio support
packages under Linux slackware 8.1? If so, what versions of the packages are
you using with the 2.4.18 kernel? Are you finding any stability problems at
all?

What I am doing is setting up a new Linux computer to be used with XFBB and
JNOS, and I am currently setting up base Linux ax.25 support in the OS. The
problem I am having is that the computer "locks up" solid when running any
web browser in
KDE (3.0), only once I have a KISS serial port attached to a TNC. If I do
not perform the "kissattach" command, then all is well. Once the kissattach
command has been executed, I then start up X-Window (startx) and then
start-up a web browser, and it will freeze the machine in about a minute.

Details:
PC:    Duron 1.3GHz CPU, 512M Ram
OS:    Slackware 8.1 Linux
kernel:    2.4.18 (also tried 2.4.20)
AX25:    libax25-0.0.10.tag.gz
         ax25-tools-0.0.8.tar.gz
         ax25-apps-0.0.6.tar.gz
COM Ports:    COM1, COM2, and one serial port residing on a USB to serial
converter cable

Can anybody recommend what version of the Linux kernel should be used with
the Linux ax.25 support to get a stable operation?

Thank-you for your help

Lane, ve7ihl



