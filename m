From: duoming@zju.edu.cn
Subject: Re: [PATCH net v5] net: rose: fix null-ptr-deref caused by
 rose_kill_by_neigh
Date: Tue, 12 Jul 2022 08:08:12 +0800 (GMT+08:00)
Message-ID: <43096493.3daca.181efbc1f66.Coremail.duoming@zju.edu.cn>
References: <56319300.38660.181e861b71b.Coremail.duoming@zju.edu.cn>
 <20220711104949.3de90fc5@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20220711104949.3de90fc5@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-hams@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

SGVsbG8sCgpPbiBNb24sIDExIEp1bCAyMDIyIDEwOjQ5OjQ5IC0wNzAwIEpha3ViIEtpY2luc2tp
IHdyb3RlOgoKPiBVbnJlbGF0ZWQgdG8gdGhpcyBwYXJ0aWN1bGFyIHBhdGNoLCBidXQgaXQgc2Vl
bXMgbGlrZSB5b3UncmUgd29ya2luZwo+IGEgbG90IG9uIEFGX1JPU0UsIHdvdWxkIHlvdSBjb25z
aWRlciBhZGRpbmcgYSBnb29kIHNldCBvZiBzZWxmdGVzdHMgCj4gZm9yIGl0PyAgSXQnZCBiZSBl
YXNpZXIgdG8geW91IHRvIHZhbGlkYXRlIHRoZSBjaGFuZ2VzIGFuZCBtdWNoIGVhc2llcgo+IGZv
ciB1cyB0byB0cnVzdCB0aGUgZml4ZXMgc2VlaW5nIGhvdyB0aGV5IHdlcmUgdmFsaWRhdGVkLgoK
VGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LCBJIHdpbGwgdHJ5IHRvIHByb3ZpZGUgYSBzZXQgb2Yg
c2VsZnRlc3RzLgoKQmVzdCByZWdhcmRzLApEdW9taW5nIFpob3U=
