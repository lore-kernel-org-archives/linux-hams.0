From: Luc Langehegermann <lx2gt@gmx.net>
Subject: [Announce] Ktrack 0.2.2 released
Date: Mon, 20 Jan 2003 20:05:43 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200301202005.43279.lx2gt@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org, amsat-bb@amsat.org

Hello,

I have just released a new KTrack Version.

Changelog:

0.2.1 to 0.2.2

- Fixed an bug, where the unable to init rig message appears, if the user
  has selected 'none' in the rig control
- Fixed the bug that caused ktrack to crash, if one of the selected rigs are
  'none'
- The rigs in the rigconfig comboboxes are now sorted alphabetically
- Only satellites that are displayed are now calculated. The previous version
  calculated them all, even if not displayed
- Much faster AOS / LOS calculation routines
- Only calculate AOS for satellites that actually can reach our position
- Removed the possibility to not correct the downlink... now the real way of
  doppler correction is always used!
- Removed every reference to the obsolete fodtrack driver that was still in
  the source tree from ktrack

As usual, you get get it at http://ktrack.sourceforge.net

73, Luc

