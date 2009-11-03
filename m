From: Pidoux <f6bvp@free.fr>
Subject: Re: [PATCH] ax25ipd : added provision for dynamic dns hosts
Date: Tue, 03 Nov 2009 14:46:57 +0100
Message-ID: <4AF03451.9030505@free.fr>
References: <C5A3335A.25066%teners@bh90210.net> <4AE1AA6C.9040500@upmc.fr> <20091102172232.GA31187@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20091102172232.GA31187@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: Bernard Pidoux <bernard.pidoux@upmc.fr>, linux-hams@vger.kernel.org, Ralf Baechle DL5RB <ralf@linux-mips.org>, ax25@x-berg.in-berlin.de

Hi Thomas,

You are absolutely right.
There was a part of the code missing in io.c patch.
I have just sent a patch including the call to update_dns().

I agree with you about the use of sizeof() instead of a fixed value.

I removed exit() when the progam detects an UDP failure for it aborts
unecessarily ax25ipd daemon.

UDP socket could not be set when remote station is not on line at the t=
ime
ax25ipd tries to resolve a dynamic IP address.
This is usually corrected by a later call to update_dns().

73 de Bernard, f6bvp



Thomas Osterried a =E9crit :
> Hello Bernard,
>=20
> On 2009-10-23 15:06:52 +0200, Bernard Pidoux <bernard.pidoux@upmc.fr>
> wrote in <4AE1AA6C.9040500@upmc.fr>:
>> Hi All,
>>
>> The following patch=20
>>
>> +/*
>> +* added provision for dynamic dns hosts
>> +  Steve Fraser vk5asf, June 2005
>> +*/
>>
>> is still not included into "official" =20
>> http://www.linux-ax25.org/pub/ax25-apps/ax25-apps-0.0.8-rc2.tar.gz
>=20
> You're right. I admit I was not very happy about the code. I remember=
 I
> tried to minimize unnecessary DNS requests, but I did not like my sol=
ution
> neither.
>=20
>> despite the fact that it has been used since 2005 by FPAC packet
>> switch nodes and that it looks very usefull in maintaining nodes
>> connected through ROSE network with dynamic IP changes.
>>
>> Thus, I resend this patch in the hope that it will be
>> added in ax25-apps-0.0.8.
>=20
> I try to comment my problems with the patch between the lines below.
>> 73 de Bernard, f6bvp
>>
>>
>=20
>> --- ax25-apps-0.0.8-rc2/ax25ipd/ax25ipd.h	2009-06-14 10:11:48.000000=
000 +0200
>> +++ ax25-apps-0.0.8-rc2/ax25ipd/ax25ipd.h	2009-10-20 19:41:41.307206=
002 +0200
>> @@ -25,6 +25,10 @@
>>   * Terry Dawson, VK2KTJ, September 2001.
>>   */
>> =20
>> +/*
>> +* added provision for dynamic dns hosts
>> +  Steve Fraser vk5asf, June 2005
>> +*/
>>  /* Define the current version number
>>   *
>>   * The first digit represents the major release (0 is a prototype r=
elease)
>> @@ -133,12 +137,13 @@
>> =20
>>  /* routing.c */
>>  void route_init(void);
>> -void route_add(unsigned char *, unsigned char *, int, unsigned int)=
;
>> +void route_add(unsigned char *, unsigned char *, unsigned char *, i=
nt, unsigned int);
>>  void bcast_add(unsigned char *);
>>  unsigned char *call_to_ip(unsigned char *);
>>  int is_call_bcast(unsigned char *);
>>  void send_broadcast(unsigned char *, int);
>>  void dump_routes(void);
>> +void update_dns(void);
>=20
> update_dns() is never called in this patch.
>=20
>> =20
>>  /* config.c */
>>  void config_init(void);
>> --- ax25-apps-0.0.8-rc2/ax25ipd/config.c	2009-06-14 10:07:11.0000000=
00 +0200
>> +++ ax25-apps-0.0.8-rc2/ax25ipd/config.c	2009-10-20 15:36:29.8963540=
12 +0200
>> @@ -154,7 +154,7 @@
>>  int parse_line(char *buf)
>>  {
>>  	char *p, *q;
>> -	unsigned char tcall[7], tip[4];
>> +	unsigned char tcall[7], tip[4], thost [256];
>>  	struct hostent *he;
>>  	int i, j, uport;
>>  	unsigned int flags;
>> @@ -305,14 +305,20 @@
>>  		q =3D strtok(NULL, " \t\n\r");
>>  		if (q =3D=3D NULL)
>>  			return -1;
>> -		he =3D gethostbyname(q);
>> -		if (he !=3D NULL) {
>> +
>> +		j =3D inet_addr(q);
>> +                if (j !=3D -1) {
>> +                   memcpy(tip, (char *) &j, 4);
>> +                   thost[0]=3D0;
>> +                }else{
>> +                   he =3D gethostbyname(q);
>> +		   if (he !=3D NULL){
>>  			memcpy(tip, he->h_addr_list[0], 4);
>> -		} else {	/* maybe user specified a numeric addr? */
>> -			j =3D inet_addr(q);
>> -			if (j =3D=3D -1)
>> -				return -5;	/* if -1, bad deal! */
>> -			memcpy(tip, (char *) &j, 4);
>> +                        strncpy(thost,q,255);
>> +                        thost[255]=3D0;
>=20
> I'd prefer sizeof() instead of raw values like 255, because it's alwa=
ys
> a point of failure.
>=20
>> +                   } else {
>> +			fprintf(stderr,"ax25ipd: %s host IP address unknown - will probe=
 it again later\n",q);
>=20
> thost has random data. We'll not be able to resolve q (thost) because=
 we did
> not store it.
>=20
>> +		   }
>>  		}
>> =20
>>  		while ((q =3D strtok(NULL, " \t\n\r")) !=3D NULL) {
>> @@ -336,7 +342,7 @@
>>  				}
>>  			}
>>  		}
>> -		route_add(tip, tcall, uport, flags);
>> +		route_add(thost,tip, tcall, uport, flags);
>>  		return 0;
>> =20
>>  	} else if (strcmp(p, "broadcast") =3D=3D 0) {
>> --- ax25-apps-0.0.8-rc2/ax25ipd/io.c	2009-06-14 17:42:11.000000000 +=
0200
>> +++ ax25-apps-0.0.8-rc2/ax25ipd/io.c	2009-10-20 19:45:45.959215067 +=
0200
>> @@ -15,7 +15,6 @@
>> =20
>>  #include <sys/types.h>
>>  #include <sys/time.h>
>> -#include <time.h>
>>  #include <sys/socket.h>
>>  #include <netinet/in.h>
>>  #include <netinet/in_systm.h>
>> @@ -67,8 +66,7 @@
>>  struct sockaddr_in from;
>>  socklen_t fromlen;
>> =20
>> -time_t last_bc_time;
>> -
>> +time_t last_bc_time, last_dns_time;
>>  int ttyfd_bpq =3D 0;
>> =20
>>  /*
>> @@ -134,6 +132,8 @@
>> =20
>>  	bzero((char *) &udpbind, sizeof(struct sockaddr));
>>  	udpbind.sin_family =3D AF_INET;
>> +
>> +        last_dns_time =3D time(NULL);
>>  }
>> =20
>>  /*
>> @@ -599,8 +599,9 @@
>>  			perror("reading from raw ip socket");
>>  			exit(2);
>>  		} else if (mode =3D=3D UDP_MODE) {
>> -			perror("reading from udp socket");
>> +/*			perror("reading from udp socket");
>>  			exit(2);
>> +*/
>=20
> why?
>=20
>>  		} else if (mode =3D=3D TTY_MODE) {
>>  			perror("reading from tty device");
>>  			exit(2);
>> @@ -645,8 +646,9 @@
>>  				usleep(100000);	/* sleep a bit */
>>  				return 1;	/* and retry */
>>  			}
>> -			perror("writing to udp socket");
>> +/*			perror("writing to udp socket");
>>  			exit(2);
>> +*/
>=20
> why?
>=20
>>  		} else if (mode =3D=3D TTY_MODE) {
>>  			if (errno =3D=3D EWOULDBLOCK) {
>>  				LOGL4("write to tty would block, sleeping and retrying!\n");
>> --- ax25-apps-0.0.8-rc2/ax25ipd/routing.c	2009-06-14 10:07:11.000000=
000 +0200
>> +++ ax25-apps-0.0.8-rc2/ax25ipd/routing.c	2009-10-20 19:31:34.835219=
662 +0200
>> @@ -10,8 +10,11 @@
>>  #include "ax25ipd.h"
>>  #include <sys/types.h>
>>  #include <netinet/in.h>
>> +#include <sys/socket.h>
>> +#include <netdb.h>=20
>>  #include <memory.h>
>>  #include <syslog.h>
>> +#include <string.h>
>> =20
>>  /* The routing table structure is not visible outside this module. =
*/
>> =20
>> @@ -23,6 +26,7 @@
>>  	unsigned char pad1;
>>  	unsigned char pad2;
>>  	unsigned int flags;	/* route flags */
>> +	unsigned char hostnm[256]; /* host name or null */
>>  	struct route_table_entry *next;
>>  };
>> =20
>> @@ -47,7 +51,7 @@
>>  }
>> =20
>>  /* Add a new route entry */
>> -void route_add(unsigned char *ip, unsigned char *call, int udpport,
>> +void route_add(unsigned char *host, unsigned char *ip, unsigned cha=
r *call, int udpport,=20
>>  	unsigned int flags)
>>  {
>>  	struct route_table_entry *rl, *rn;
>> @@ -75,6 +79,7 @@
>>  		rn->callsign[i] =3D call[i] & 0xfe;
>>  	rn->callsign[6] =3D (call[6] & 0x1e) | 0x60;
>>  	rn->padcall =3D 0;
>> +	strncpy(rn->hostnm,host,255);
>=20
> In route_add we do rn =3D malloc(...)
> rn->hostnm contains random data.
> strncpy(rn->hostnm,host,255) copies 255 bytes to the 256 bytes array =
hostnm.
> If host ist 255 characters long, then it contains a most probably a s=
tring
> with a hostname and a non-null-character which results in a not-termi=
nated
> string.
>=20
>>  	memcpy(rn->ip_addr, ip, 4);
>>  	rn->udp_port =3D htons(udpport);
>>  	rn->pad1 =3D 0;
>> @@ -242,12 +247,31 @@
>> =20
>>  	rp =3D route_tbl;
>>  	while (rp) {
>> -		LOGL1("  %s\t%s\t%s\t%d\t%d\n",
>> +		LOGL1("  %s %s %s %d %d %s\n",
>>  		      call_to_a(rp->callsign),
>>  		      (char *) inet_ntoa(*(struct in_addr *) rp->ip_addr),
>>  		      rp->udp_port ? "udp" : "ip",
>> -		      ntohs(rp->udp_port), rp->flags);
>> +		      ntohs(rp->udp_port), rp->flags,
>> +                      rp->hostnm);
>>  		rp =3D rp->next;
>>  	}
>>  	fflush(stdout);
>>  }
>> +/*update DNS entries of routes */
>> +void update_dns(void)
>> +{
>> +        struct hostent *he;
>> +	struct route_table_entry *rp;
>> +	int i;
>> +
>> +	rp =3D route_tbl;
>> +	while (rp) {
>> +           if (strlen(rp->hostnm) > 0) {
>> +              he =3D gethostbyname(rp->hostnm);
>> +                if (he !=3D NULL) {
>> +                        memcpy(rp->ip_addr, he->h_addr_list[0], 4);
>> +                }
>> +           }
>> +	rp =3D rp->next;
>> +	}
>> +}
>=20
> update_dns() is not called in the patch. If it would, on a periodical
> basis:
> If internet is not available or the dns-server for rp->hostnm is not
> available, then we may wait n seconds for dns timeout. In dependence =
of
> how frequently update_dns() is called, ax25ipd gets blocked quite oft=
en -
> n * m for each host which does not resolve.
> rp should store the unsuccessful lookups, do lookups on an an exponen=
tial
> basis, and in worse cases should do the lookup only i.E. once an hour=
=2E
> Or even better: do update_dns() in a posix thread.
>=20
>=20
> 73,
> 	- Thomas  dl9sau
>=20



--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
