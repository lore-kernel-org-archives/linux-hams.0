From: Ivan Savitsky <jcuken321@gmail.com>
Subject: Quesion: AX.25 socket data corruption
Date: Mon, 24 Feb 2020 15:11:20 +0200
Message-ID: <CAJ4MR4aaQPvoX4=qzzUShkM+Xr5FUjb8nt047mT1khWvABoZLA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=onuukAwwc+2wXBRbPPBPs2+mng23s75gTCqjz5Eh6os=;
        b=FIvhHGqQj0xh8c1LR5gOJZXZuJnOzPg9ZFRMtpkcsHMLJlMmuUw5GOqlG9XYSF9/eM
         CVACxBBfqswFgf20mtAfIdSPl9yFObH3wZjlYgCgMKKEqjN9sqAe1bFS/1gNkYgJMGZO
         2k+/jNxh8qcc+nUzkOJ92wgfkPmBGAKF4V1IFaoebvTnnMuG8Z4f0jsjhV6G3VE2ISA4
         35y9d6LS13ls+NC+aUsTpQU286Xpqs+e5/hob1FtRaYM2xOkMICeBygV5UDep4X6i8wG
         5aBqSQzQhp6TJAjBUDnYABchICvFcHXl4p3LdhefvEpt5E7oSEA6gm3+QGnVhQwbV08Q
         kcng==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-hams@vger.kernel.org

Hello,

I was asking this question on
https://github.com/ve7fet/linuxax25/issues but was directed to this
mailing list for further investigation. I apologise for possible
duplicates if you're reading the both discussions.

I'm writing a proxy between a AX.25 VC socket and a TCP socket.
It is needed for programmes like telnet to work directly over AX.25 VC.
This allows full screen visual remote terminal access without using IP
over AX.25.

On the server side I'm creating a listening AX.25 socket. After
accepting a AX.25 client, the TCP connection to the telnetd is
created.

On the client side a listening TCP socket is created. After accepting
a telnet connection to the TCP socket, the AX.25 VC is created.

The AX.25 link I am currently testing is created by ax25ipd over the
Ethernet LAN between two linux PCs which reside in the same room. I've
done a few tests over the real radio as well with same results.

The problem is that the data passing between the two sockets (VC and
TCP) is quite often became corrupted, duplicated or misplaced. In the
packet dump with axlisten command there are "REJ" frames from the
client side and duplicated "I" frames from the server side which are
corresponding to the corrupted output in the telnet session (LORA3-8
is a server and LORA4 is a client):

axip: fm LORA3-8 to LORA4 ctl I76^ pid=3DF0(Text) len 64 12:08:23
axip: fm LORA4 to LORA3-8 ctl REJ7v 12:08:23
axip: fm LORA3-8 to LORA4 ctl I77+ pid=3DF0(Text) len 80 12:08:23
axip: fm LORA4 to LORA3-8 ctl RR0- 12:08:23
axip: fm LORA3-8 to LORA4 ctl I77+ pid=3DF0(Text) len 160 12:08:23
axip: fm LORA4 to LORA3-8 ctl REJ0- 12:08:23
axip: fm LORA3-8 to LORA4 ctl I77^ pid=3DF0(Text) len 80 12:08:23
axip: fm LORA3-8 to LORA4 ctl I70+ pid=3DF0(Text) len 256 12:08:23

The data forwarding routine is straightforward:

/* Forward data between sockets */
void forward_data(int source_sock, int destination_sock, const char* name) =
{
    ssize_t n;
    fd_set read_fd;
    char buffer[BUF_SIZE];

    if (fcntl(source_sock, F_SETFL, O_NONBLOCK) < 0) {
        perror("socket");
        close(source_sock);
        return;
    }

    int paclen =3D ax25_config_get_paclen(ax25_port);

    while (1) {
        FD_ZERO(&read_fd);
        FD_SET(source_sock, &read_fd);
        select(source_sock + 1, &read_fd, NULL, NULL, NULL);
        if (FD_ISSET(source_sock, &read_fd)) {
            n =3D read(source_sock, buffer, BUF_SIZE);
        }
        if (n <=3D0 ) break;

        int offset =3D 0;

        while (offset !=3D n) {
            int len =3D (n-offset > paclen) ? paclen : n-offset;
            int ret =3D write(destination_sock, buffer+offset, len); //
send data to output socket
            if (ret =3D=3D -1) {
                printf("\n");
                if (errno =3D=3D EWOULDBLOCK || errno =3D=3D EAGAIN) {
                    perror("write");
                    usleep(100000);
                    continue;
                }
                break;
            }
            offset +=3D ret;
        }
    }
=E2=80=A6

The question is: whether it is possible to pass the data reliably in
such a manner between the VC and TCP sockets and, if so, what should
be done from my side to eliminate the data corruption?

Thanks,
Ivan
