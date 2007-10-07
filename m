From: Tihomir Heidelberg - 9a4gl <9a4gl_MAKNI_OVO@hamradio.hr>
Subject: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Sun, 07 Oct 2007 21:58:06 +0200
Message-ID: <47093A4E.5040409@hamradio.hr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi ax25 developers,

Using kernel 2.6.21.6 here. If you write to AX.25 socket bytes more then
MTU, write will return -1 and errno will be set to 90 (EMSGSIZE =
[Message too long]).

This happend in net/ax25/af_ax25.c in function ax25_sendmsg at:

        if (len > ax25->ax25_dev->dev->mtu) {
                err = -EMSGSIZE;
                goto out;
        }

Old kernels, 2.2.x and 2.4.x accepted write with data length larger then
MTU and for SOCK_SEQPACKET sockets the ax25_output function did the
fragmentation job.

According to "man 2 write", write should return number of bytes written.
I think that:

1. ax25_sendmsg should accept data larger then mtu and pass the data to
ax25_output.
2. ax25_output should do fragmentation and queue frames into device queue.
3. ax25_output should stop fragmenting when device queue is full
4. ax25_output should return number of bytes queued on device
5. ax25_sendmsg should return number of bytes accepted for xmiting

Also, as I see, currently ax25 stack is not checking if dev_queue_xmit
fails. Does this means that AX.25 kernel can loose some frames when
device queue is full ?

By the way, this problem is having OpenBCM V1.07b3, very popular BBS
software (http://dnx274.dyndns.org/baybox/) which writes as much data as
it prepared.

73 de Tihomir Heidelberg, 9a4gl(_a_t_)hamradio(d_o_t)hr


