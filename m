From: David Rivenburg <driven@onr.com>
Subject: unconnected mode operation
Date: Sat, 15 Oct 2005 21:50:07 -0500
Message-ID: <4351BFDF.7070106@onr.com>
Reply-To: driven@onr.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hello All, Dave AD5OO here.
Old to linux, new to ham, really new to linux-hams.

My initial searches have not turned up any software that will let you 
use an ax25 port to do interactive unconnected mode operation like you 
are able to do when talking directly to a hardware tnc.  So I wrote a 
short script that uses the already available tools to implement a crude 
unconnected mode tnc which is permanently in converse mode.  Since there 
is no flow control, incoming packets can disrupt something you may be 
typing.  As usual, ctrl-r will re-type the input and allow you to 
continue from there.  Ctrl-d will close the input and kill the listen 
command.  Ctrl-c will exit immediately and leave listen running.

Enjoy!



#!/bin/bash

# your ax25 port and unproto go here
PORT=ax0
UNPROTO="cq via relay-1 relay-2"

listen -r -p $PORT &

while [ 0 ]; do
   read INPUT
   if [ $? == 1 ]; then break; fi
   beacon -d "$UNPROTO" -s $PORT "$INPUT"
done

kill %1 # to stop the listen
