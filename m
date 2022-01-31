From: "Bernard Pidoux , f6bvp" <f6bvp@free.fr>
Subject: Re: [AX25] ipv6 incompatible with AX.25
Date: Mon, 31 Jan 2022 18:36:14 +0100
Message-ID: <0b54ca91-5463-12e5-09fa-8977b85a30b9@free.fr>
References: <4B2CD772.1030106@upmc.fr> <4B2D1025.1020106@gmail.com>
 <4B2E6729.1090102@free.fr> <4B507FAA.8010007@free.fr>
 <20100115203654.GA3084@del.dom.local> <4DFA6A59.2000709@free.fr>
 <581f0c8e-f4fb-523d-df6e-7a973b506c34@sorbonne-universite.fr>
 <2394eae7-dada-f43e-40b9-fae929212913@trinnet.net>
 <724d87c5-3029-702a-32c9-b64677a2da0e@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------5iivTm9tdneCDbuCxgDLGWgF"
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Language: fr
In-Reply-To: <724d87c5-3029-702a-32c9-b64677a2da0e@free.fr>
List-ID: <linux-hams.vger.kernel.org>
To: David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org
Cc: List for the LINUX version of FBB <xfbb@f6fbb.org>

This is a multi-part message in MIME format.
--------------5iivTm9tdneCDbuCxgDLGWgF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello David,

To answer more precisely your question I prefere to include the listing 
of an ./ax25up script initializing AX.25 on my Ubuntu PC followed by 
dmesg and ifconfig messages.

Without disabling IPv6 I confirm that my LAN AX.25 was not behaving 
correctly as I wrote before.

It is strange that there are still two messages about IPv6 while 
Ethernet device had previously been disabled in Ubuntu as shown.

Then ifconfig shows that IPv6 is also disabled by command in the script.

73 de Bernard, f6bvp



--------------5iivTm9tdneCDbuCxgDLGWgF
Content-Type: text/plain; charset=UTF-8; name="IPv6.txt"
Content-Disposition: attachment; filename="IPv6.txt"
Content-Transfer-Encoding: base64

ICAgMTEuMDIwNDcwXSBJUHY2OiBBRERSQ09ORihORVRERVZfQ0hBTkdFKTogZW5wNXMwOiBs
aW5rIGJlY29tZXMgcmVhZHkKLi4uLi4uLgpbICAgNzcuMjc5ODcyXSBORVQ6IFJlZ2lzdGVy
ZWQgcHJvdG9jb2wgZmFtaWx5IDMKWyAgIDc3LjI4MjgxMF0gbWtpc3M6IEFYLjI1IE11bHRp
a2lzcywgSGFucyBBbGJhcyBQRTFBWVgKWyAgIDc3LjI4MzM5MV0gbWtpc3M6IGF4MDogY3Jj
IG1vZGUgaXMgYXV0by4KWyAgIDc3LjI4MzU0Ml0gSVB2NjogQUREUkNPTkYoTkVUREVWX0NI
QU5HRSk6IGF4MDogbGluayBiZWNvbWVzIHJlYWR5ClsgICA3OS4zMDM3NDJdIE5FVDogUmVn
aXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgNgpbICAgOTUuNTA0ODY4XSBta2lzczogYXgwOiBU
cnlpbmcgY3JjLXNtYWNrClsgICA5NS41MDUxMjhdIG1raXNzOiBheDA6IFRyeWluZyBjcmMt
ZmxleG5ldAoKCi4vYXgyNXVwCm5ldC5pcHY2LmNvbmYuYWxsLmRpc2FibGVfaXB2NiA9IDEK
L2Jpbi9ybTogY2Fubm90IHJlbW92ZSAnL3Zhci9heDI1L2ZiYi8qLnJlcyc6IE5vIHN1Y2gg
ZmlsZSBvciBkaXJlY3RvcnkKSW5zdGFsbGluZyBheDI1aXBkIFVuaXg5OCBtYXN0ZXIgcHNl
dWRvIHR0eQpJbnN0YWxsaW5nIGEgS0lTUyBsaW5rIG9uIGV0aGVybmV0IHBvcnQKUG9ydCBh
eHVkcCBhdHRhY2hlZCB0byBheDAKU3RhcnRpbmcgTmV0Um9tLi4uCkluaXQgTmV0cm9tCk5F
VC9ST00gcG9ydCBuZXRub2QgYm91bmQgdG8gZGV2aWNlIG5yMAoKIE5FVDogUmVnaXN0ZXJl
ZCBwcm90b2NvbCBmYW1pbHkgMwpbICAgNjUuMDMyODExXSBta2lzczogQVguMjUgTXVsdGlr
aXNzLCBIYW5zIEFsYmFzIFBFMUFZWApbICAgNjUuMDMzNTUyXSBta2lzczogYXgwOiBjcmMg
bW9kZSBpcyBhdXRvLgpbICAgNjUuMDMzNzM5XSBJUHY2OiBBRERSQ09ORihORVRERVZfQ0hB
TkdFKTogYXgwOiBsaW5rIGJlY29tZXMgcmVhZHkKWyAgIDY3LjA2MDU0NF0gTkVUOiBSZWdp
c3RlcmVkIHByb3RvY29sIGZhbWlseSA2ClsgICA4My4yNjU4MDZdIG1raXNzOiBheDA6IFRy
eWluZyBjcmMtc21hY2sKWyAgIDgzLjI2NTk3MF0gbWtpc3M6IGF4MDogVHJ5aW5nIGNyYy1m
bGV4bmV0CgpheDA6IGZsYWdzPTY3PFVQLEJST0FEQ0FTVCxSVU5OSU5HPiAgbXR1IDI1Mwog
ICAgICAgIGF4MjUgRjZCVlAtNCAgdHhxdWV1ZWxlbiAxMCAgKEFNUFIgQVguMjUpCiAgICAg
ICAgUlggcGFja2V0cyAwICBieXRlcyAwICgwLjAgQikKICAgICAgICBSWCBlcnJvcnMgMCAg
ZHJvcHBlZCAwICBvdmVycnVucyAwICBmcmFtZSAwCiAgICAgICAgVFggcGFja2V0cyA2ICBi
eXRlcyAzMDcgKDMwNy4wIEIpCiAgICAgICAgVFggZXJyb3JzIDAgIGRyb3BwZWQgMCBvdmVy
cnVucyAwICBjYXJyaWVyIDAgIGNvbGxpc2lvbnMgMAoK

--------------5iivTm9tdneCDbuCxgDLGWgF--
