From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: [PATCH] ax25ipd : added provision for dynamic dns hosts
Date: Mon, 2 Nov 2009 18:22:32 +0100
Message-ID: <20091102172232.GA31187@x-berg.in-berlin.de>
References: <C5A3335A.25066%teners@bh90210.net> <4AE1AA6C.9040500@upmc.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4AE1AA6C.9040500@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <bernard.pidoux@upmc.fr>
Cc: linux-hams@vger.kernel.org, Ralf Baechle DL5RB <ralf@linux-mips.org>, ax25@x-berg.in-berlin.de

Hello Bernard,

On 2009-10-23 15:06:52 +0200, Bernard Pidoux <bernard.pidoux@upmc.fr>
wrote in <4AE1AA6C.9040500@upmc.fr>:
> Hi All,
>
> The following patch 
>
> +/*
> +* added provision for dynamic dns hosts
> +  Steve Fraser vk5asf, June 2005
> +*/
>
> is still not included into "official"  
> http://www.linux-ax25.org/pub/ax25-apps/ax25-apps-0.0.8-rc2.tar.gz

You're right. I admit I was not very happy about the code. I remember I
tried to minimize unnecessary DNS requests, but I did not like my solution
neither.

> despite the fact that it has been used since 2005 by FPAC packet
> switch nodes and that it looks very usefull in maintaining nodes
> connected through ROSE network with dynamic IP changes.
>
> Thus, I resend this patch in the hope that it will be
> added in ax25-apps-0.0.8.

I try to comment my problems with the patch between the lines below.
>
> 73 de Bernard, f6bvp
>
>

> --- ax25-apps-0.0.8-rc2/ax25ipd/ax25ipd.h	2009-06-14 10:11:48.000000000 +0200
> +++ ax25-apps-0.0.8-rc2/ax25ipd/ax25ipd.h	2009-10-20 19:41:41.307206002 +0200
> @@ -25,6 +25,10 @@
>   * Terry Dawson, VK2KTJ, September 2001.
>   */
>  
> +/*
> +* added provision for dynamic dns hosts
> +  Steve Fraser vk5asf, June 2005
> +*/
>  /* Define the current version number
>   *
>   * The first digit represents the major release (0 is a prototype release)
> @@ -133,12 +137,13 @@
>  
>  /* routing.c */
>  void route_init(void);
> -void route_add(unsigned char *, unsigned char *, int, unsigned int);
> +void route_add(unsigned char *, unsigned char *, unsigned char *, int, unsigned int);
>  void bcast_add(unsigned char *);
>  unsigned char *call_to_ip(unsigned char *);
>  int is_call_bcast(unsigned char *);
>  void send_broadcast(unsigned char *, int);
>  void dump_routes(void);
> +void update_dns(void);

update_dns() is never called in this patch.

>  
>  /* config.c */
>  void config_init(void);
> --- ax25-apps-0.0.8-rc2/ax25ipd/config.c	2009-06-14 10:07:11.000000000 +0200
> +++ ax25-apps-0.0.8-rc2/ax25ipd/config.c	2009-10-20 15:36:29.896354012 +0200
> @@ -154,7 +154,7 @@
>  int parse_line(char *buf)
>  {
>  	char *p, *q;
> -	unsigned char tcall[7], tip[4];
> +	unsigned char tcall[7], tip[4], thost [256];
>  	struct hostent *he;
>  	int i, j, uport;
>  	unsigned int flags;
> @@ -305,14 +305,20 @@
>  		q = strtok(NULL, " \t\n\r");
>  		if (q == NULL)
>  			return -1;
> -		he = gethostbyname(q);
> -		if (he != NULL) {
> +
> +		j = inet_addr(q);
> +                if (j != -1) {
> +                   memcpy(tip, (char *) &j, 4);
> +                   thost[0]=0;
> +                }else{
> +                   he = gethostbyname(q);
> +		   if (he != NULL){
>  			memcpy(tip, he->h_addr_list[0], 4);
> -		} else {	/* maybe user specified a numeric addr? */
> -			j = inet_addr(q);
> -			if (j == -1)
> -				return -5;	/* if -1, bad deal! */
> -			memcpy(tip, (char *) &j, 4);
> +                        strncpy(thost,q,255);
> +                        thost[255]=0;

I'd prefer sizeof() instead of raw values like 255, because it's always
a point of failure.

> +                   } else {
> +			fprintf(stderr,"ax25ipd: %s host IP address unknown - will probe it again later\n",q);

thost has random data. We'll not be able to resolve q (thost) because we did
not store it.

> +		   }
>  		}
>  
>  		while ((q = strtok(NULL, " \t\n\r")) != NULL) {
> @@ -336,7 +342,7 @@
>  				}
>  			}
>  		}
> -		route_add(tip, tcall, uport, flags);
> +		route_add(thost,tip, tcall, uport, flags);
>  		return 0;
>  
>  	} else if (strcmp(p, "broadcast") == 0) {
> --- ax25-apps-0.0.8-rc2/ax25ipd/io.c	2009-06-14 17:42:11.000000000 +0200
> +++ ax25-apps-0.0.8-rc2/ax25ipd/io.c	2009-10-20 19:45:45.959215067 +0200
> @@ -15,7 +15,6 @@
>  
>  #include <sys/types.h>
>  #include <sys/time.h>
> -#include <time.h>
>  #include <sys/socket.h>
>  #include <netinet/in.h>
>  #include <netinet/in_systm.h>
> @@ -67,8 +66,7 @@
>  struct sockaddr_in from;
>  socklen_t fromlen;
>  
> -time_t last_bc_time;
> -
> +time_t last_bc_time, last_dns_time;
>  int ttyfd_bpq = 0;
>  
>  /*
> @@ -134,6 +132,8 @@
>  
>  	bzero((char *) &udpbind, sizeof(struct sockaddr));
>  	udpbind.sin_family = AF_INET;
> +
> +        last_dns_time = time(NULL);
>  }
>  
>  /*
> @@ -599,8 +599,9 @@
>  			perror("reading from raw ip socket");
>  			exit(2);
>  		} else if (mode == UDP_MODE) {
> -			perror("reading from udp socket");
> +/*			perror("reading from udp socket");
>  			exit(2);
> +*/

why?

>  		} else if (mode == TTY_MODE) {
>  			perror("reading from tty device");
>  			exit(2);
> @@ -645,8 +646,9 @@
>  				usleep(100000);	/* sleep a bit */
>  				return 1;	/* and retry */
>  			}
> -			perror("writing to udp socket");
> +/*			perror("writing to udp socket");
>  			exit(2);
> +*/

why?

>  		} else if (mode == TTY_MODE) {
>  			if (errno == EWOULDBLOCK) {
>  				LOGL4("write to tty would block, sleeping and retrying!\n");
> --- ax25-apps-0.0.8-rc2/ax25ipd/routing.c	2009-06-14 10:07:11.000000000 +0200
> +++ ax25-apps-0.0.8-rc2/ax25ipd/routing.c	2009-10-20 19:31:34.835219662 +0200
> @@ -10,8 +10,11 @@
>  #include "ax25ipd.h"
>  #include <sys/types.h>
>  #include <netinet/in.h>
> +#include <sys/socket.h>
> +#include <netdb.h> 
>  #include <memory.h>
>  #include <syslog.h>
> +#include <string.h>
>  
>  /* The routing table structure is not visible outside this module. */
>  
> @@ -23,6 +26,7 @@
>  	unsigned char pad1;
>  	unsigned char pad2;
>  	unsigned int flags;	/* route flags */
> +	unsigned char hostnm[256]; /* host name or null */
>  	struct route_table_entry *next;
>  };
>  
> @@ -47,7 +51,7 @@
>  }
>  
>  /* Add a new route entry */
> -void route_add(unsigned char *ip, unsigned char *call, int udpport,
> +void route_add(unsigned char *host, unsigned char *ip, unsigned char *call, int udpport, 
>  	unsigned int flags)
>  {
>  	struct route_table_entry *rl, *rn;
> @@ -75,6 +79,7 @@
>  		rn->callsign[i] = call[i] & 0xfe;
>  	rn->callsign[6] = (call[6] & 0x1e) | 0x60;
>  	rn->padcall = 0;
> +	strncpy(rn->hostnm,host,255);

In route_add we do rn = malloc(...)
rn->hostnm contains random data.
strncpy(rn->hostnm,host,255) copies 255 bytes to the 256 bytes array hostnm.
If host ist 255 characters long, then it contains a most probably a string
with a hostname and a non-null-character which results in a not-terminated
string.

>  	memcpy(rn->ip_addr, ip, 4);
>  	rn->udp_port = htons(udpport);
>  	rn->pad1 = 0;
> @@ -242,12 +247,31 @@
>  
>  	rp = route_tbl;
>  	while (rp) {
> -		LOGL1("  %s\t%s\t%s\t%d\t%d\n",
> +		LOGL1("  %s %s %s %d %d %s\n",
>  		      call_to_a(rp->callsign),
>  		      (char *) inet_ntoa(*(struct in_addr *) rp->ip_addr),
>  		      rp->udp_port ? "udp" : "ip",
> -		      ntohs(rp->udp_port), rp->flags);
> +		      ntohs(rp->udp_port), rp->flags,
> +                      rp->hostnm);
>  		rp = rp->next;
>  	}
>  	fflush(stdout);
>  }
> +/*update DNS entries of routes */
> +void update_dns(void)
> +{
> +        struct hostent *he;
> +	struct route_table_entry *rp;
> +	int i;
> +
> +	rp = route_tbl;
> +	while (rp) {
> +           if (strlen(rp->hostnm) > 0) {
> +              he = gethostbyname(rp->hostnm);
> +                if (he != NULL) {
> +                        memcpy(rp->ip_addr, he->h_addr_list[0], 4);
> +                }
> +           }
> +	rp = rp->next;
> +	}
> +}

update_dns() is not called in the patch. If it would, on a periodical
basis:
If internet is not available or the dns-server for rp->hostnm is not
available, then we may wait n seconds for dns timeout. In dependence of
how frequently update_dns() is called, ax25ipd gets blocked quite often -
n * m for each host which does not resolve.
rp should store the unsuccessful lookups, do lookups on an an exponential
basis, and in worse cases should do the lookup only i.E. once an hour.
Or even better: do update_dns() in a posix thread.


73,
	- Thomas  dl9sau
