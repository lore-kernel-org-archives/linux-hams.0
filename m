From: Pino Zollo <pinozollo@gmail.com>
Subject: DBLog 0.13.2
Date: Fri, 11 Jul 2008 13:07:23 -0400
Message-ID: <200807111307.27192.pinozollo@gmail.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to
         :subject:date:user-agent:cc:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=6tPEimHWriNVAuMK5OkU2jNZ2ps2nkIwoW4gxNcoNTg=;
        b=E4RAPomlh1d/r93aZrm3+kOAp6s+tDreIFSoTCF9v0LjWeUNguAvdZpaeO4aAbPZgT
         9UAPJYdw5j9ZIB4SFo0tPTCr24RyweUT3NEbJnwtOTd+6JClhYFVDwGXDF7Lq7fk4H9s
         C5fP81kvkVGzhsDuo6DoxDuB+MGu2IN4cNj3Y=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yahoo linux hams <linuxhams@yahoogroups.com>, pa0r <rein@couperus.com>, "Marco Di Martino (IW2OHX)" <iw2ohx@eutelia.com>, Linux Hams <linux-hams@vger.kernel.org>, Joop Stakenborg <pg>
Cc: I2PHD <i2phd@weaksignals.com>, "INFO Sezione A.R.I. di Milano" <info@arimi.it>, "Psk31 at qth.net" <psk31@mailman.qth.net>

The new version of DBLog, the 0.13.2 is available on

http://www.qsl.net/zp4kfx/Linux 

News:
Special for developers of other HAM radio applications as programs for 
digimodes, EME or Meteorscatter.

DBLog now works also as 'Log server': another program can send commands to 
DBLog via TCP on port 3164 to fill fields and to log QSOs. DBLog replies 
with 'Name' and 'QTH' if the call has been worked before. More infos in the 
file SERVER_DOC included into the distribution.
------
DBLog is a logging program for radio amateurs based on a relational Data Base.
The main table conforms to ADIF specifications.
It allows to log QSOs, export a range of them in ADIF format and import from 
an ADIF file.
It keeps statistics of DXCC worked countries in mixed mode.
It reads the VFO frequency via the hamlib daemon rigctld, so all radios 
supported by hamlib can be used.
When rigctld is active appears the Band Map graphic windows which shows an 
analogical representation of the radio tune. Clicking on the tune scale will 
set the radio VFO.
It includes a CW Keyer based on cwdaemon.
Receives cluster spots from xdx by PG4I, checks them against local statistics 
and shows the results in a dedicated window.
If Cluster is active spots are shown also on the Band Map.
The Band Map can store permanently spots or frequencies.
Clicking on a cluster spot sets the radio VFO, honouring QSX an UP information 
in case of split.
In RUN mode it will remember the CQ frequency, while in S&P a call written 
into the entry window will be remembered. 
Shows the azimuthal map of the earth centred on the QTH using xplanet. If  the 
other station call is present, his position is also shown.
The NCDXF beacons can be monitored by band or by beacon. A map is available
to see where beacons are located.

Beta testers and feedbacks appreciated.

73

Pino ZP4KFX
