From: root <root@hamgate.crb.org.br>
Subject: netrom problem?
Date: Fri, 17 May 2002 14:53:35 -0300 (BRT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0205171440470.26646-100000@hamgate.crb.org.br>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: radio-lnx@crb.org.br

Dear sirs,

there have been a few strange cases with netrom, so your help is needed.
Does anyone know why a system (see config below), after Alt-Ctrl-Del, is
not going to the halt state (or rebooting) and keeps sending to the
console the very same message (forever). Additionally, refuses the kill
and only reboot after pressing the "panic button":

unregister_netdevice: waiting for ax0 become free [245]

This happens only when the system had netrom running, otherwise the
shutdown or halt is fine.

Config is as follows:
libax25-0.0.7, ax25-tools-0.0.8 e ax25-apps-0.0.6, kernel 2.4.18-6mdk
(Mandrake distro). Everything compiled fine, no errors or warnings.

Any idea?

Best 73 de Luiz - PP5AQ

