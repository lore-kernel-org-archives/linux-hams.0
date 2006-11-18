From: Doug <appld@sasktel.net>
Subject: Lost Enterprise 3 Password
Date: Sat, 18 Nov 2006 15:30:44 -0600
Message-ID: <7.0.1.0.2.20061118151653.04a9f0e0@sasktel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Further to my first post on Oct 24, I received many kind responses on 
how to overcome the lost
password. They probably all would of worked if I really knew what I 
was doing. However, I have
been successful with some help from a knowledgeable Linux guru 
locally. Using the emails I received
as reference we were able to load Mepis 6.0 as a live cd. I am going 
to list the procedure that
I used in case there are others who may need a little help.

Booted Mepis 6.0 as a live cd as root.
Started a kconsole and issued the following commands.

mount -t ext3 /dev/hda2 /mnt/hda2
chroot /mnt/hda2
passwd (then entered my new password)

Restarted and both the bbs and the cluster seem to be working just fine.

Learned a lot gentlemen so thanks. All help is greatly appreciated.

Also, I was able to fix up a screwed grub on my dual boot xp/mepis system
using the live cd method. This appears to be a powerful tool and I will have
to learn more about it as I do like to play.....

73
Doug VE5DA


