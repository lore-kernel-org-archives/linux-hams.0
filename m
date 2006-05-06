From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: AX.25, NETROM and ROSE changes in 2.6.17
Date: Sat, 6 May 2006 23:38:00 +0100
Message-ID: <20060506223800.GA4419@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

For those who haven't read my recent patches I'd like to point out that
in the next kernel release, 2.6.17 the units for the AX.25 timers T1,
T2 and T3 will change to use ms for all platforms away from the
previous chaos of version, architecture, platform and configuration
dependentant chaos.  I've tried to explain things on

  http://www.linux-ax25.org/wiki/Run_time_configurable_parameters
  http://de.linux-ax25.org/wiki/Laufzeiteinstellungen

  (1st page in English, 2nd in German)

This matters to any sysadmin that is modiyfing the values from their
defaults.

  Ralf
