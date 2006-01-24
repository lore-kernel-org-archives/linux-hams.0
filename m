From: "AE5PL Lists" <HamLists@ametx.com>
Subject: RE: Unwanted packets on AX25 interface
Date: Tue, 24 Jan 2006 15:39:37 -0600
Message-ID: <478F6623898BBC4DBD692A223D28298A165991@amewebsrvr.webametx.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Are you running Samba (standard in FC4)?  If so, restrict it to your LAN
interface or it will send packets out your AX.25 interface.

73,

Pete Loveall AE5PL
mailto:pete@ae5pl.net 

> -----Original Message-----
> From: Josh Freeman
> Posted At: Tuesday, January 24, 2006 3:36 PM
> Subject: Unwanted packets on AX25 interface
> 
> I'm running Fedora Core 4 and user-mode Soundmodem 0.10.1 in 
> MKISS mode to operate APRS, primarily with XASTIR. When I 
> start up Soundmodem, it creates interface ax0 with an IP 
> address of 10.0.0.1.
> It immediately sends a packet
