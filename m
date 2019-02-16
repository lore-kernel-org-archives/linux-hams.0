From: f6bvp <f6bvp@free.fr>
Subject: ax25: fix possible use-after-free
Date: Sat, 16 Feb 2019 22:32:25 +0100
Message-ID: <20190216223225.788b8ae7@draws-f6bvp>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>

Patch applied successfully on Linux draws-f6bvp 4.14.79-v7+ #1159 SMP Sun Nov 4 17:50:20 GMT 2018 armv7l GNU/Linux

However ax25_route_lock_use and ax25_route_lock_unuse() are not declared and compile failed.

make : on entre dans le répertoire « /usr/src/linux-headers-4.14.79-v7+ »
  CC [M]  /usr/src/linux-4.14.y/net/ax25/ax25_ip.o
/usr/src/linux-4.14.y/net/ax25/ax25_ip.c: In function ‘ax25_ip_xmit’:
/usr/src/linux-4.14.y/net/ax25/ax25_ip.c:117:2: error: implicit declaration of function ‘ax25_route_lock_use’ [-Werror=implicit-function-declaration]
  ax25_route_lock_use();
  ^~~~~~~~~~~~~~~~~~~
/usr/src/linux-4.14.y/net/ax25/ax25_ip.c:211:2: error: implicit declaration of function ‘ax25_route_lock_unuse’ [-Werror=implicit-function-declaration]
  ax25_route_lock_unuse();
  ^~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
scripts/Makefile.build:328 : la recette pour la cible « /usr/src/linux-4.14.y/net/ax25/ax25_ip.o » a échouée
make[1]: *** [/usr/src/linux-4.14.y/net/ax25/ax25_ip.o] Erreur 1
Makefile:1527 : la recette pour la cible « _module_/usr/src/linux-4.14.y/net/ax25 » a échouée
make: *** [_module_/usr/src/linux-4.14.y/net/ax25] Erreur 2
make : on quitte le répertoire « /usr/src/linux-headers-4.14.79-v7+ »


Bernard, f6bvp

