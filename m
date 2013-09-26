From: Waldek <sp2ong@wp.pl>
Subject: Odp: Re: patch INP3 for kernel 3.6
Date: Thu, 26 Sep 2013 10:20:40 +0200
Message-ID: <5243ee588b32f4.42875689@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1380183640; bh=vj/HqdQlruS9PqqLNA35XMafB3J1SnAl2FCqBesuOt4=;
          h=From:To:Subject;
          b=ccw/Hiuecvzyylr+zh9gf1P4k8uUfpBaDrIUXvFD9137PZWM5ohOW2gCujcxPhpJL
           v8/Qkf6FGR6r8p2IlnAm6c4q0rbTJDuD+7va05Dlb37Jtqs3ZCxY5WYJr2qeD9v5bF
           maKy8lqbwNth4rkXdUp08EyrcZ3wF/0PagtwYSuM=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams <linux-hams@vger.kernel.org>

Ok I have try compile kernel 3.6 with fixed rejected netrom.h and patch=
 don't working with 3.6 kernel

 CC [M]  net/netrom/af_netrom.o
In file included from net/netrom/af_netrom.c:40:0:
include/net/netrom.h:72:27: warning: declaration does not declare anyth=
ing [enabled by default]
net/netrom/af_netrom.c: In function 'nr_ioctl':
net/netrom/af_netrom.c:1261:3: error: implicit declaration of function =
'inp3_set_mnem' [-Werror=3Dimplicit-function-declaration]
net/netrom/af_netrom.c:1269:3: error: implicit declaration of function =
'inp3_get_mnem' [-Werror=3Dimplicit-function-declaration]
net/netrom/af_netrom.c: In function 'nr_proto_init':
net/netrom/af_netrom.c:1481:2: error: implicit declaration of function =
'kinp3d_start' [-Werror=3Dimplicit-function-declaration]
net/netrom/af_netrom.c: In function 'nr_exit':
net/netrom/af_netrom.c:1512:2: error: implicit declaration of function =
'kinp3d_stop' [-Werror=3Dimplicit-function-declaration]
cc1: some warnings being treated as errors
make[2]: *** [net/netrom/af_netrom.o] error 1
make[1]: *** [net/netrom] error 2
make: *** [net] error 2


Dnia Czwartek, 26 Wrze=B6nia 2013 10:10 Matt Maguire <matt.vk2rq@gmail.=
com> napisa=B3(a)=20
> I'm not surprised it doesn't apply cleanly -- it is for 2.6 kernel,
> not 3.6. Even if it did apply, I wouldn't use it until the deadlock
> issue is addressed -- that's why I was interested to hear that someon=
e
> else made a patch for 2.6, as I am curious whether they also fixed th=
e
> deadlock issue inherited from the 2.4 patch.



--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
