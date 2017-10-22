From: Bernard Pidoux <bernard.pidoux@free.fr>
Subject: [PATCH] net/rose : fix rose module to become free
Date: Sun, 22 Oct 2017 22:25:33 +0200
Message-ID: <bbf56ef6-aa7e-a1d2-2d3a-2be06f5261d9@free.fr>
References: <bcb1563f-a5c8-c5ab-b10a-aeaee376838a@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------8816916A9602997B4153E036"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <bcb1563f-a5c8-c5ab-b10a-aeaee376838a@free.fr>
Content-Language: en-US
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: =?UTF-8?Q?Ralf_B=c3=a4chle_DL5RB?= <ralf@linux-mips.org>
Cc: Richard Stearn <richard@rns-stearn.co.uk>, linux-hams@vger.kernel.org, davem@davemloft.net

This is a multi-part message in MIME format.
--------------8816916A9602997B4153E036
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Trying to remove rose device invariably makes console sending endless 
message
"waiting for rose module to become free" with a random fixed count.
This has been confirmed by many ROSE/FPAC users on all kernel versions 
for ages.
Richard Stearn investigated the issue and found that dev_put(dev) were 
missing:
two in rose_bind() and one in rose_loopback_timer().
Once patch is applied, rose can be removed cleanly.
Patch tested by Charley k4gbb and Bernard f6bvp.

Signed-off-by: Bernard Pidoux <bernard.pidoux@free.fr>

---


--------------8816916A9602997B4153E036
Content-Type: text/plain; charset=UTF-8;
 name="rose-patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="rose-patch"

ZGlmZiAtLWdpdCBhL25ldC9yb3NlL2FmX3Jvc2UuYyBiL25ldC9yb3NlL2FmX3Jvc2UuYwpp
bmRleCA0YTk3MjkyNTcwMjMuLjQ0NzY1ODJjMTcxMCAxMDA2NDQKLS0tIGEvbmV0L3Jvc2Uv
YWZfcm9zZS5jCisrKyBiL25ldC9yb3NlL2FmX3Jvc2UuYwpAQCAtNjg4LDggKzY4OCwxMCBA
QCBzdGF0aWMgaW50IHJvc2VfYmluZChzdHJ1Y3Qgc29ja2V0ICpzb2NrLCBzdHJ1Y3Qgc29j
a2FkZHIgKnVhZGRyLCBpbnQgYWRkcl9sZW4pCiAJCXJvc2UtPnNvdXJjZV9jYWxsID0gdXNl
ci0+Y2FsbDsKIAkJYXgyNV91aWRfcHV0KHVzZXIpOwogCX0gZWxzZSB7Ci0JCWlmIChheDI1
X3VpZF9wb2xpY3kgJiYgIWNhcGFibGUoQ0FQX05FVF9CSU5EX1NFUlZJQ0UpKQorCQlpZiAo
YXgyNV91aWRfcG9saWN5ICYmICFjYXBhYmxlKENBUF9ORVRfQklORF9TRVJWSUNFKSkgewor
CQkJZGV2X3B1dChkZXYpOwogCQkJcmV0dXJuIC1FQUNDRVM7CisJCX0KIAkJcm9zZS0+c291
cmNlX2NhbGwgICA9ICpzb3VyY2U7CiAJfQogCkBAIC03MTEsNiArNzEzLDggQEAgc3RhdGlj
IGludCByb3NlX2JpbmQoc3RydWN0IHNvY2tldCAqc29jaywgc3RydWN0IHNvY2thZGRyICp1
YWRkciwgaW50IGFkZHJfbGVuKQogCiAJc29ja19yZXNldF9mbGFnKHNrLCBTT0NLX1pBUFBF
RCk7CiAKKwlkZXZfcHV0KGRldik7CisKIAlyZXR1cm4gMDsKIH0KIApkaWZmIC0tZ2l0IGEv
bmV0L3Jvc2Uvcm9zZV9sb29wYmFjay5jIGIvbmV0L3Jvc2Uvcm9zZV9sb29wYmFjay5jCmlu
ZGV4IDM0NDQ1NjIwNmI3MC4uOTU4YWMyNGE5ZDQ3IDEwMDY0NAotLS0gYS9uZXQvcm9zZS9y
b3NlX2xvb3BiYWNrLmMKKysrIGIvbmV0L3Jvc2Uvcm9zZV9sb29wYmFjay5jCkBAIC0xMDIs
NiArMTAyLDcgQEAgc3RhdGljIHZvaWQgcm9zZV9sb29wYmFja190aW1lcih1bnNpZ25lZCBs
b25nIHBhcmFtKQogCQkJaWYgKChkZXYgPSByb3NlX2Rldl9nZXQoZGVzdCkpICE9IE5VTEwp
IHsKIAkJCQlpZiAocm9zZV9yeF9jYWxsX3JlcXVlc3Qoc2tiLCBkZXYsIHJvc2VfbG9vcGJh
Y2tfbmVpZ2gsIGxjaV9vKSA9PSAwKQogCQkJCQlrZnJlZV9za2Ioc2tiKTsKKwkJCQkJZGV2
X3B1dChkZXYpOwogCQkJfSBlbHNlIHsKIAkJCQlrZnJlZV9za2Ioc2tiKTsKIAkJCX0K
--------------8816916A9602997B4153E036--
