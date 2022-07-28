From: duoming@zju.edu.cn
Subject: Re: [PATCH net v2] netrom: fix sleep in atomic context bugs in
 timer handlers
Date: Thu, 28 Jul 2022 10:07:55 +0800 (GMT+08:00)
Message-ID: <7ee70f8a.625d3.182428f792f.Coremail.duoming@zju.edu.cn>
References: <20220726032420.5516-1-duoming@zju.edu.cn>
 <20220727183647.23ae46f8@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20220727183647.23ae46f8@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

SGVsbG8sCgpPbiBXZWQsIDI3IEp1bCAyMDIyIDE4OjM2OjQ3IC0wNzAwIEpha3ViIEtpY2luc2tp
IHdyb3RlOgoKPiBPbiBUdWUsIDI2IEp1bCAyMDIyIDExOjI0OjIwICswODAwIER1b21pbmcgWmhv
dSB3cm90ZToKPiA+IG5yX2hlYXJ0YmVhdF9leHBpcnkKPiA+ICAgbnJfd3JpdGVfaW50ZXJuYWwK
PiA+ICAgICBucl90cmFuc21pdF9idWZmZXIKPiAKPiB2b2lkIG5yX3RyYW5zbWl0X2J1ZmZlcihz
dHJ1Y3Qgc29jayAqc2ssIHN0cnVjdCBza19idWZmICpza2IpCj4gewo+IFsuLi5dCj4gCWlmICgh
bnJfcm91dGVfZnJhbWUoc2tiLCBOVUxMKSkgewo+IAo+ID4gICAgICAgbnJfcm91dGVfZnJhbWUK
PiAKPiBpbnQgbnJfcm91dGVfZnJhbWUoc3RydWN0IHNrX2J1ZmYgKnNrYiwgYXgyNV9jYiAqYXgy
NSkKPiB7Cj4gWy4uLl0KPiAJaWYgKGF4MjUgIT0gTlVMTCkgewo+IAkJcmV0ID0gbnJfYWRkX25v
ZGUobnJfc3JjLCAiIiwgJmF4MjUtPmRlc3RfYWRkciwgYXgyNS0+ZGlnaXBlYXQsCj4gCj4gYXgy
NSBtdXN0IGJlIE5VTEwgb24gdGhpcyBwYXRoIEFGQUlDVC4KPiAKPiA+ICAgICAgICAgbnJfYWRk
X25vZGUKPiA+ICAgICAgICAgICBrbWVtZHVwKC4uLEdGUF9LRVJORUwpIC8vbWF5IHNsZWVwCgpU
aGFuayB5b3UgZm9yIHlvdXIgdGltZSBhbmQgc3VnZ2VzdGlvbnMsIEkgdW5kZXJzdGFuZC4KCkJl
c3QgcmVnYXJkcywKRHVvbWluZyBaaG91
