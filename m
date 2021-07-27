From: Ralf Baechle <ralf@linux-mips.org>
Subject: SIOCGIFHWADDR errors and long network device names
Date: Tue, 27 Jul 2021 18:36:13 +0200
Message-ID: <YQA1/VD9E8bnj1Ox@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

While I've analyzed the issue years ago I've finally thrown the gauntlet
at this bug - which unfortunately is a whole class of bugs.  At this
point I've fixed the listen program to use the strategy I've lined out in
previous postings.  What the existing code does:

  struct sockaddr sa;		/* really is a struct sockaddr_pkt  */
  socklen_t asize = sizeof(sa);
  struct ifreq ifr;
  int sock;

  sock = socket(PF_PACKET, SOCK_PACKET, htons(proto));
  size = recvfrom(sock, buffer, sizeof(buffer), 0, &sa, &asize);
  strcpy(ifr.ifr_name, sa.sa_data);
  ioctl(sock, SIOCGIFHWADDR, &ifr);

where the problem was that struct sockaddr's sa_data[] as returned by
recvfrom is only 14 bytes long and thus 2 bytes shorter than IFNAMSIZ.
And SOCK_PACKET is deprecated anyway.

So the new solution is to use a SOCK_RAW socket.  This will make recfrom
return it's address result in a struct sockaddr_pkt instead which does
no longer hold an interface name but an interface index.  We thus will
have to convert the interface index to an interface name using an
SIOCGIFNAME ioctl.

  struct sockaddr_ll sa;
  socklen_t asize = sizeof(sa);
  struct ifreq ifr;
  int sock;

  sock = socket(PF_PACKET, SOCK_RAW, htons(proto));
  size = recvfrom(sock, buffer, sizeof(buffer), 0, &sa, &asize);
  fr.ifr_ifindex = index;
  res = ioctl(sock, SIOCGIFNAME, &ifr);
  printf("if_name: %s\n", ifr.ifr_name);

It's just a sketch but it should demonstrate the gist.

Please help to finally stamp out the issue in other packages!

Thanks,

  Ralf
