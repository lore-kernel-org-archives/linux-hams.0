From: Jeff Renner <d1g1t4lsh4d0w@gmail.com>
Subject: AX.25 UI Frame socket
Date: Wed, 18 Apr 2012 19:55:49 +0100
Message-ID: <CAMPueyx0TTSrneWwwf0GC0R6YiD_7CtzLnfPqNO4hTCy1STnHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=2gIg0OLnIl10uOIM9d60rhcn0At2KnwjcUq3NoejyhQ=;
        b=YkLL7X53Q0OgeWeqp7PqliXeYnrS7ltULNd0rUEcV+6fFznUg/hIdU8uWmnAjyoQTv
         uM+rapkxdtPx/Rb0ilGzTEETrD0k2OiLKzamRr/j9FsSPPKspCk1Dp3ah4JJ4OObVI6l
         yvedv5x/BzINPDfdqFi0F+jHQn7hfshEQ6GYiRKBzxTt+aHjQxrnRJSrVpgxE3gGXd6k
         wU/KV9/eEbwzNBXc5KaYdIzBanKouKTa2tKzsZgtyeHjiJJK3z2CIbHK0MhwHmYYZmyV
         R9+0RIfGxMCVwns8HgB4lRbL0nivkGZrT2166BjE2aGwvMDLtV91b62uVv4skuMlAzXd
         PMDA==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Hi list,

I'm trying to exchange UI Frames (carrying=A0simple messages) between
two debian machines.
I have the following code to send a particular message "hello" every 5
seconds from CS9EX-2 to CS9EX-1 - example callsign, because i don't
have a real one (yet):

> UISend.c:
> [Other includes]
> #include <netax25/axlib.h>
> #include <netax25/ax25.h>
> #include <netax25/axconfig.h>
> int main(int argc, char *argv[]) {
> =A0 =A0 =A0 =A0 struct full_sockaddr_ax25 dest;
> =A0 =A0 =A0 =A0 struct full_sockaddr_ax25 src;
> =A0 =A0 =A0 =A0 char *localcall;
> =A0 =A0 =A0 =A0 char *destcall =3D "CS9EX-1";
> =A0 =A0 =A0 =A0 char message[10];
> =A0 =A0 =A0 =A0 char *port =3D "link";
> =A0 =A0 =A0 =A0 int dlen, slen, s;
>
> =A0 =A0 =A0 =A0 if (ax25_config_load_ports() =3D=3D 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "No AX.25 ports defin=
ed\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 if ((localcall =3D ax25_config_get_addr(port)) =3D=3D=
 NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "Invalid AX.25 port [=
 %s ]\n", port);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> =A0 =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0 if ((dlen =3D ax25_aton(destcall, &dest)) =3D=3D -1) =
{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "Unable to convert de=
stination callsign '%s'\n", destcall);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> =A0 =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0 if ((slen =3D ax25_aton(localcall, &src)) =3D=3D -1) =
{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "Unable to convert so=
urce callsign '%s'\n", localcall);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> =A0 =A0 =A0 =A0 }
>
>
> =A0while(1){
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((s =3D socket(PF_AX25, SOCK_DGRAM=
, 0)) =3D=3D -1) { //SOCK_DRAM - UI FRAME
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "sock=
et() error");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (bind(s, (struct sockaddr *)&src, =
slen) =3D=3D -1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "bind=
() error");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sprintf(message, "%s", "hello!");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (sendto(s, message, strlen(message=
), 0, (struct sockaddr *)&dest, dlen) =3D=3D -1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }else{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf("message sent!=
\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sleep(5);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 close(s);
> =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 return 0 ;
> }


And, then in the=A0CS9EX-1 i run the following code UIRec.c:

> #include <stdio.h>
> #include <sys/socket.h>
> #include <sys/types.h>
> #include <netax25/axlib.h>
> #include <netax25/ax25.h>
> #include <netax25/axconfig.h>
> int main(){
> =A0 =A0 =A0 =A0 struct full_sockaddr_ax25 src, remaddr;
> =A0 =A0 =A0 =A0 int sock;
> =A0 =A0 =A0 =A0 int size =3D 0;
> =A0 =A0 =A0 =A0 socklen_t remaddrs =3D sizeof(remaddr);
> =A0 =A0 =A0 =A0 socklen_t srcs =3D sizeof(src);
> =A0 =A0 =A0 =A0 char *localcall;
> =A0 =A0 =A0 =A0 char *ax25_port =3D "link";
> =A0 =A0 =A0 =A0 char buffer[255];
> =A0 =A0 =A0 =A0 if (ax25_config_load_ports() =3D=3D 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "No AX.25 ports defin=
ed\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 if ((sock =3D socket(PF_AX25, SOCK_DGRAM, 0)) =3D=3D =
-1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "socket() error");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 if ((localcall =3D ax25_config_get_addr(ax25_port)) =3D=
=3D NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "Invalid AX.25 port [=
 %s ]\n", ax25_port);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 if ((srcs =3D ax25_aton(localcall, &src)) =3D=3D -1) =
{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "Unable to convert so=
urce callsign '%s'\n", localcall);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 if (bind(sock, (struct sockaddr *)&src, srcs) =3D=3D =
-1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 perror("bind() error: ");
>
> =A0 =A0 =A0 =A0 }
>
>
>
> =A0 =A0 =A0 =A0 printf("Waiting for frames....\n");
> // =A0 =A0 =A0size =3D recvfrom(sock, buffer, 255, 0, (struct sockadd=
r *)&remaddr, &remaddrs);
> =A0 =A0 =A0 =A0 size =3D recv(sock, buffer, 255, 0);
> =A0 =A0 =A0 =A0 printf("Received!");
> =A0 =A0 =A0 =A0 return 0;
> }


The problem is the=A0UIRec program doesn't leave recvfrom and just
output "Waiting for frames....".
The UISend seems output to the link the expected frames.
Also,
I can see the each frame arriving in=A0CS9EX-1, using axlisten -ac, wit=
h
the following output:
link: fm=A0CS9EX-2=A0to=A0CS9EX-1=A0ctl UI^ pid=3DF0(Text) len 6
0000 =A0hello!
[repeated times....]

I don't know if this is important, but i also setup the axparams in
CS9EX-1 with #axparms -assoc =A0CS9EX-1 jeff
And I have: #axparams --assoc show
Userid =A0 =A0 Callsign
jeff =A0 =A0 =A0=A0CS9EX-1

Can someone help me find out what I'm missing here? Or, what mistake I'=
m doing?


Thank you very much,
73,
Jeff Renner
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
