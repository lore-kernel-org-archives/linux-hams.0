From: Vivi Kusumo <vivi_ksm@yahoo.com>
Subject: 2nd indoor Packet Radio
Date: Fri, 18 Jul 2003 08:04:52 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030718150452.24757.qmail@web14410.mail.yahoo.com>
References: <20030712153628.GA7158@cloud.net.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-305355318-1058540692=:24178"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030712153628.GA7158@cloud.net.au>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org

--0-305355318-1058540692=:24178
Content-Type: text/plain; charset=us-ascii
Content-Id: 
Content-Disposition: inline

Hi all, 

I am using packet radio only in a room
|pc1|--|sc1|--|ht1| <~~~~> |ht2|--|sc2|--|pc2|

The hardware and software are: Personal Computer,
Sound Card, HT, RH Linux 7.1 kernel upgraded 2.4.19
and packet radio stuff (libax25-0.0.10,
ax25-apps-0.0.6, ax25-tools-0.0.8, node.0.3.0,
soundmodem-0.7)

First of all I am using stereo cable to connect 2
machines without ht and checking if the TCP/IP
facilities works such as ping, ftp, telnet and ssh.
|pc1|--|sc1|--------|sc2|--|pc2|}
 
[my1com]# ifconfig
..
sm0  Link encap: AMPR AX.25 HWaddr MY1COM inet addr:
44.128.1.20 Bcast: 44.128.1.255 Mask: 255.255.255.0
..
[my1com]# route add 44.128 1.21 sm0
[my1com]# arp -n 44.128.1.21 -H ax25 -s MY2COM -i sm0
[my1com]# cat /proc/net/arp
IP address   HW type  Flags  HW address      Mask   
Device
44.128.1.21  0x3      0x6     MY2COM-0    *      sm0
[my1com]# cat /etc/ax25/axports
..
radio     MY1COM     1200     255     2     sound card
[my2com]# ifconfig }
..
sm0  Link encap: AMPR AX.25 HWaddr MY2COM inet addr:
44.128.1.21 Bcast: 44.128.1.255 Mask: 255.255.255.0
..
[my2com]# route add 44.128.1.20 sm0
[my2com]# arp -n 44.128.1.20 -H ax25 -s MY1COM -i sm0
[my2com]# cat /proc/net/arp
IP address    HW type  Flags  HW address       Mask  
Device
44.128.1.20   0x3      0x6     MY1COM-0    *       sm0
[my2com]# cat /etc/ax25/axports
..
radio     MY2COM     1200     255     2     sound card

The connection using stereo cables as follow:
MIC-sc1|----|SPK-sc2
SPK-sc1|----|MIC-sc2
 
With help from Wilbert Knol (ZL2BSJ) and other
members: the "ping", "ftp", "ssh" and "telnet"
commands work from pc1 to pc2 and virce virca :-)
Thanks a lot people!

Now, I am trying using HT, but all commands (ping,ftp,
ssh, telnet) don't work ;-(
|pc1|--|sc1|--|ht1| <~~~~~> |ht2|--|sc2|--|pc2|

[my1com]$ ping -i 3 my2com
PING my2com.ampr.org (44.128.1.21) from 44.128.1.20:
56(84) bytes of data.

--- my2com.ampr.org ping statistics ---
4 packets transmitted, 0 packet received, 100% packet
loss
[my1com]$

Please any idea and help what should I do to make
ping, ftp, ssh and telnet commands workable and
useable?

Thanks in advance
Vivi


---------------------------------

But something is going on, if

[my1com]# listen -a -c
radio: fm MY1COM to  MY2COM  ctl UI pid=CC(IP) len 84
IP: len 84 44.128.1.20->44.128.1.21 ihl 20 ttl 64 DF
prot ICMP
ICMP: type Echo Request id 8759 seq 0
0000  n.W?."L.HI.KLMNOPQRSTUVWXYZ[\]^_
!"#$%&'()*+,-./01234567
radio: fm  MY1COM  to MY2COM  ctl UI pid=CC(IP) len 84
IP: len 84 44.128.1.20->44.128.1.21 ihl 20 ttl 64 DF
prot ICMP
ICMP: type Echo Request id 8759 seq 256
0000  q.W?R.L.HI.KLMNOPQRSTUVWXYZ[\]^_
!"#$%&'()*+,-./01234567
radio: fm  MY1COM  to MY2COM  ctl UI pid=CC(IP) len 84
IP: len 84 44.128.1.20->44.128.1.21 ihl 20 ttl 64 DF
prot ICMP
ICMP: type Echo Request id 8759 seq 512
0000  t.W?Q.L.HI.KLMNOPQRSTUVWXYZ[\]^_
!"#$%&'()*+,-./01234567
radio: fm  MY1COM  to MY2COM  ctl UI pid=CC(IP) len 84
IP: len 84 44.128.1.20->44.128.1.21 ihl 20 ttl 64 DF
prot ICMP
ICMP: type Echo Request id 8759 seq 768
0000  w.W?R.L.HI.KLMNOPQRSTUVWXYZ[\]^_ !"#$%&'()*+,-./01234567

__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com
--0-305355318-1058540692=:24178
Content-Type: application/rtf; name="indoor-pr-2.rtf"
Content-Transfer-Encoding: base64
Content-Description: indoor-pr-2.rtf
Content-Disposition: attachment; filename="indoor-pr-2.rtf"

SGkgYWxsLCAKCkkgYW0gdXNpbmcgcGFja2V0IHJhZGlvIG9ubHkgaW4gYSBy
b29tCnxwYzF8LS18c2MxfC0tfGh0MXwgPH5+fn4+IHxodDJ8LS18c2MyfC0t
fHBjMnx9CgpUaGUgaGFyZHdhcmUgYW5kIHNvZnR3YXJlIGFyZTogUGVyc29u
YWwgQ29tcHV0ZXIsIFNvdW5kIENhcmQsIEhULCBSSCBMaW51eCA3LjEga2Vy
bmVsIHVwZ3JhZGVkIDIuNC4xOSBhbmQgcGFja2V0IHJhZGlvIHN0dWZmIChs
aWJheDI1LTAuMC4xMCwgYXgyNS1hcHBzLTAuMC42LCBheDI1LXRvb2xzLTAu
MC44LCBub2RlLjAuMy4wLCBzb3VuZG1vZGVtLTAuNykKCkZpcnN0IG9mIGFs
bCBJIGFtIHVzaW5nIHN0ZXJlbyBjYWJsZSB0byBjb25uZWN0IDIgbWFjaGlu
ZXMgd2l0aG91dCBodCBhbmQgY2hlY2tpbmcgaWYgdGhlIFRDUC9JUCBmYWNp
bGl0aWVzIHdvcmtzIHN1Y2ggYXMgcGluZywgZnRwLCB0ZWxuZXQgYW5kIHNz
aC4KfHBjMXwtLXxzYzF8LS0tLS0tLS18c2MyfC0tfHBjMnx9CiAKW215MWNv
bV0jIGlmY29uZmlnfQouLgpzbTAgIExpbmsgZW5jYXA6IEFNUFIgQVguMjUg
SFdhZGRyIE1ZMUNPTSBpbmV0IGFkZHI6IDQ0LjEyOC4xLjIwIEJjYXN0OiA0
NC4xMjguMS4yNTUgTWFzazogMjU1LjI1NS4yNTUuMAouLgpbbXkxY29tXSMg
cm91dGUgYWRkIDQ0LjEyOCAxLjIxIHNtMApbbXkxY29tXSMgYXJwIC1uIDQ0
LjEyOC4xLjIxIC1IIGF4MjUgLXMgTVkyQ09NIC1pIHNtMApbbXkxY29tXSMg
Y2F0IC9wcm9jL25ldC9hcnAKSVAgYWRkcmVzcyAgIEhXIHR5cGUgIEZsYWdz
ICBIVyBhZGRyZXNzICAgICAgTWFzayAgICBEZXZpY2UKNDQuMTI4LjEuMjEg
IDB4MyAgICAgIDB4NiAgICAgTVkyQ09NLTAgICAgKiAgICAgIHNtMApbbXkx
Y29tXSMgY2F0IC9ldGMvYXgyNS9heHBvcnRzCi4uCnJhZGlvICAgICBNWTFD
T00gICAgIDEyMDAgICAgIDI1NSAgICAgMiAgICAgc291bmQgY2FyZApbbXky
Y29tXSMgaWZjb25maWcgfQouLgpzbTAgIExpbmsgZW5jYXA6IEFNUFIgQVgu
MjUgSFdhZGRyIE1ZMkNPTSBpbmV0IGFkZHI6IDQ0LjEyOC4xLjIxIEJjYXN0
OiA0NC4xMjguMS4yNTUgTWFzazogMjU1LjI1NS4yNTUuMAouLgpbbXkyY29t
XSMgcm91dGUgYWRkIDQ0LjEyOC4xLjIwIHNtMApbbXkyY29tXSMgYXJwIC1u
IDQ0LjEyOC4xLjIwIC1IIGF4MjUgLXMgTVkxQ09NIC1pIHNtMApbbXkyY29t
XSMgY2F0IC9wcm9jL25ldC9hcnAKSVAgYWRkcmVzcyAgICBIVyB0eXBlICBG
bGFncyAgSFcgYWRkcmVzcyAgICAgICBNYXNrICAgRGV2aWNlCjQ0LjEyOC4x
LjIwICAgMHgzICAgICAgMHg2ICAgICBNWTFDT00tMCAgICAqICAgICAgIHNt
MApbbXkyY29tXSMgY2F0IC9ldGMvYXgyNS9heHBvcnRzCi4uCnJhZGlvICAg
ICBNWTJDT00gICAgIDEyMDAgICAgIDI1NSAgICAgMiAgICAgc291bmQgY2Fy
ZAoKVGhlIGNvbm5lY3Rpb24gdXNpbmcgc3RlcmVvIGNhYmxlcyBhcyBmb2xs
b3c6Ck1JQy1zYzF8LS0tLXxTUEstc2MyClNQSy1zYzF8LS0tLXxNSUMtc2My
CiAKV2l0aCBoZWxwIGZyb20gV2lsYmVydCBLbm9sIChaTDJCU0opIGFuZCBv
dGhlciBtZW1iZXJzOiB0aGUgInBpbmciLCAiZnRwIiwgInNzaCIgYW5kICJ0
ZWxuZXQiIGNvbW1hbmRzIHdvcmsgZnJvbSBwYzEgdG8gcGMyIGFuZCB2aXJj
ZSB2aXJjYSA6LSkgVGhhbmtzIGEgbG90IHBlb3BsZSEKCk5vdywgSSBhbSB0
cnlpbmcgdXNpbmcgSFQsIGJ1dCBhbGwgY29tbWFuZHMgKHBpbmcsZnRwLCBz
c2gsIHRlbG5ldCkgZG9uJ3Qgd29yayA7LSgKfHBjMXwtLXxzYzF8LS18aHQx
fCA8fn5+fn4+IHxodDJ8LS18c2MyfC0tfHBjMnwKCltteTFjb21dJCBwaW5n
IC1pIDMgbXkyY29tClBJTkcgbXkyY29tLmFtcHIub3JnICg0NC4xMjguMS4y
MSkgZnJvbSA0NC4xMjguMS4yMDogNTYoODQpIGJ5dGVzIG9mIGRhdGEuCgot
LS0gbXkyY29tLmFtcHIub3JnIHBpbmcgc3RhdGlzdGljcyAtLS0KNCBwYWNr
ZXRzIHRyYW5zbWl0dGVkLCAwIHBhY2tldCByZWNlaXZlZCwgMTAwJSBwYWNr
ZXQgbG9zcwpbbXkxY29tXSQKClBsZWFzZSBhbnkgaWRlYSBhbmQgaGVscCB3
aGF0IHNob3VsZCBJIGRvIHRvIG1ha2UgcGluZywgZnRwLCBzc2ggYW5kIHRl
bG5ldCBjb21tYW5kcyB3b3JrYWJsZSBhbmQgdXNlYWJsZT8KClRoYW5rcyBp
biBhZHZhbmNlClZpdmkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQoKQnV0IHNvbWV0aGluZyBpcyBnb2luZyBvbiwgaWYKCltteTFjb21d
IyBsaXN0ZW4gLWEgLWMKcmFkaW86IGZtIE1ZMUNPTSB0byAgTVkyQ09NICBj
dGwgVUkgcGlkPUNDKElQKSBsZW4gODQKSVA6IGxlbiA4NCA0NC4xMjguMS4y
MC0+NDQuMTI4LjEuMjEgaWhsIDIwIHR0bCA2NCBERiBwcm90IElDTVAKSUNN
UDogdHlwZSBFY2hvIFJlcXVlc3QgaWQgODc1OSBzZXEgMAowMDAwICBuLlc/
LiJMLkhJLktMTU5PUFFSU1RVVldYWVpbXF1eXyAhIiMkJSYnKCkqKywtLi8w
MTIzNDU2NwpyYWRpbzogZm0gIE1ZMUNPTSAgdG8gTVkyQ09NICBjdGwgVUkg
cGlkPUNDKElQKSBsZW4gODQKSVA6IGxlbiA4NCA0NC4xMjguMS4yMC0+NDQu
MTI4LjEuMjEgaWhsIDIwIHR0bCA2NCBERiBwcm90IElDTVAKSUNNUDogdHlw
ZSBFY2hvIFJlcXVlc3QgaWQgODc1OSBzZXEgMjU2CjAwMDAgIHEuVz9SLkwu
SEkuS0xNTk9QUVJTVFVWV1hZWltcXV5fICEiIyQlJicoKSorLC0uLzAxMjM0
NTY3CnJhZGlvOiBmbSAgTVkxQ09NICB0byBNWTJDT00gIGN0bCBVSSBwaWQ9
Q0MoSVApIGxlbiA4NApJUDogbGVuIDg0IDQ0LjEyOC4xLjIwLT40NC4xMjgu
MS4yMSBpaGwgMjAgdHRsIDY0IERGIHByb3QgSUNNUApJQ01QOiB0eXBlIEVj
aG8gUmVxdWVzdCBpZCA4NzU5IHNlcSA1MTIKMDAwMCAgdC5XP1EuTC5ISS5L
TE1OT1BRUlNUVVZXWFlaW1xdXl8gISIjJCUmJygpKissLS4vMDEyMzQ1NjcK
cmFkaW86IGZtICBNWTFDT00gIHRvIE1ZMkNPTSAgY3RsIFVJIHBpZD1DQyhJ
UCkgbGVuIDg0CklQOiBsZW4gODQgNDQuMTI4LjEuMjAtPjQ0LjEyOC4xLjIx
IGlobCAyMCB0dGwgNjQgREYgcHJvdCBJQ01QCklDTVA6IHR5cGUgRWNobyBS
ZXF1ZXN0IGlkIDg3NTkgc2VxIDc2OAowMDAwICB3Llc/Ui5MLkhJLktMTU5P
UFFSU1RVVldYWVpbXF1eXyAhIiMkJSYnKCkqKywtLi8wMTIzNDU2Nwo=

--0-305355318-1058540692=:24178--
