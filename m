From: IZ4EFN Alessio <iz4efn@libero.it>
Subject: SCC Driver compilation error
Date: Sat, 25 Dec 2004 14:27:52 +0100
Message-ID: <41CD6AD8.9040708@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams List <linux-hams@vger.kernel.org>

Hello guys,

Marry Christmast to everyone!!

I'm, in these days of holiday, trying to setup a couple of old cards 
based on Z8530.

These are S5PCC design (board rebuild by I2REO), two Z8530 with 2 modems 
each.

While compiling the usual driver i get the following error:


root@Slack_ARIMO:~/z8530drv-2.4# make dep
gcc -O2 -m486 -Wall -Wstrict-prototypes -DCONFIG_SCC_STANDALONE -M 
sccstat.c sccinit.c sccparam.c >.depend
gcc -O2 -m486 -Wall -Wstrict-prototypes -DCONFIG_SCC_STANDALONE -c -pipe 
-D__KERNEL__ -DMODULE -DMODVERSIONS -fomit-frame-pointer 
-DCONFIG_SCC_DEV -DCONFIG_SCC_TTY -I/usr/src/linux/include -M scc.c 
 >>.depend
scc.c:156:20: warning: extra tokens at end of #undef directive
In file included from scc.c:189:
/usr/src/linux/include/linux/malloc.h:4:2: warning: #warning 
linux/malloc.h is deprecated, use linux/slab.h instead.
scc.c:3153:46: macro "dev_kfree_skb" passed 2 arguments, but takes just 1
scc.c:3164:46: macro "dev_kfree_skb" passed 2 arguments, but takes just 1
scc.c:3171:38: macro "dev_kfree_skb" passed 2 arguments, but takes just 1
make: *** [dep] Error 1
root@Slack_ARIMO:~/z8530drv-2.4#



and the make is replying this:



root@Slack_ARIMO:~/z8530drv-2.4# make
install -g root -o root -m 0755 -s sccstat /sbin/sccstat
install -g root -o root -m 0700 -s sccinit /sbin/sccinit
install -g root -o root -m 0700 -s sccparam /sbin/sccparam
install -g root -o root -m 0644 z8530drv.conf /etc/z8530drv.conf.ex
for d in 0 1 2 3 4 5 6 7 ; do \
        rm -f /dev/scc$d                ;\
        mknod /dev/scc$d c 34 $d        ;\
done
root@Slack_ARIMO:~/z8530drv-2.4#



which seems to be fine.,


Where do you think the matter is?

Thanks for help, Alessio IZ4EFN.


