From: "Albert Duane Lawson" <wb7awl@comcast.net>
Subject: Netrom Broadcast
Date: Thu, 11 Mar 2004 07:30:33 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <001101c4077d$cba85690$0200a8c0@albertla>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Makes sure the file "nrbroadcast" exists in /etc/ax25

It should look like this:

# /etc/ax25/nrbroadcast
#
# The format of this file is:
#
# ax25_name min_obs def_qual worst_qual verbose
#
1       6       230     85      0
2       6       230     85      0


Albert/WB7AWL


