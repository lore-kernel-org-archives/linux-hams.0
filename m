Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169555013B4
	for <linux-hams@vger.kernel.org>; Wed, 14 Oct 2026 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982373; cv=pass; b=IXwjwixD6cPXiyz7XzlR0Vz7c//nXKKSwm82thP8zdXGs6Eu3M3aAQzFaiaeXvIdana9VrTVSrT5GFq74ORr22YnRj58T9sDzi2w/alk6uCPl1updrhs2m6fYSz7Nv6bqPkSWjBcDD5mfuTYxmLdRkKw3fJnpXIbPY1/aNxfCY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982373; c=relaxed/simple;
	bh=d91s7fownhF4AS66QGsLg8F+wp+g+Qm6lwEr1B7xwlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIcBDBpGsB5w/Kt/mpk9xBIulEKda0wBs2lLEWj513HQWtWgXc3qMrPpALeR3QUSbHRYgOpiPuZNqV+kVU3qZ8+CmzWHh4n5lu7TQXFjRHBqoxkMl0Cs9AeHGICT8evyvSMAK/05oeFs4E436jY4MQANdwJQk0Gx9n7mr3JL7ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNodElL3; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNodElL3"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-676804a3a22so3841410d50.1
        for <linux-hams@vger.kernel.org>; Wed, 14 Oct 2026 05:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791982330; cv=none;
        d=google.com; s=arc-20260327;
        b=Y5RsT3MV+vqKL9RO8gJLnh1SeNv0jdDYYYGI/oJSytF6/80k4tP0Zgnq21skJ6AbJg
         bhXrN4ffoArAx2XcXYhd2r40dX7PamuXNRAauIPF0jnCkEEDPaD8Se4K2RWUZwlB1agZ
         YiGq7KmFE4pHcdDbOTQeAdrumq6ObbvLIWru1cEJqY2ax93nqDXSKhgrtynHiHIeyNoo
         LDFlrZOkzYdYTTVeSrpxfv2KuSigbRyy4NUt40xV0jr32XdVyNRpJnobYrBXTqAkOwaW
         zdHHci8rgP8xNgsiYhAmBIMEhkX+S/XJxR1jFWYiRHRJLP4iYMHxnaZEp1BM+v88Hj8D
         dfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Bete3nYv8k5XX15jQeKmDv9GW3Y/+Uvo/DnMZHhMlzk=;
        fh=Su3QtX70+yAWarwvyBxaE3rwmtekL6Cn6/lSEnFn1O0=;
        b=ZIHYqtJtjKvIta+uHmhel25x/rTV1p0ceIKwTBUb94f7K2/28P+oBteTfsGUubm5e7
         moQCN4RkBEkXlNoqjObx8echoaCDoctJCZf8urU5QxIiUoXo0Mu7c2AUk6fAphel7k4j
         5wSDeMsvaSoS6n+xvDU78OSMYnLQiPqNEn/RQ/57/anLcOJjxED8PciSQOitDgGxKHKH
         Lq2dHNuTUGjfiJkHEECZfRTtx8QRehmFvqYacDff9S6mQ73PtyzhzF8Hm5BkwhWcJNuZ
         s8846oz/txr2903ucND7YYQt0HrCQ+W9kHW0QmmB4dSd9hozS/OBjHoInd1aM2HmrsJm
         YrDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791982330; x=1792587130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bete3nYv8k5XX15jQeKmDv9GW3Y/+Uvo/DnMZHhMlzk=;
        b=qNodElL3r9WTg4/2cgs4PQEP7zP27jvSwNYka7mYLFHPkIw9W/j0ZQqz1O2lVEbm6t
         SNoVRAAKYEwS7C45GUpVXa1FTJOFKzGe2ZxkBAnfLjTAyzl646uAWpX7Ff/W0jXoK/JQ
         JGSsx+CDh+fhl1MuSkhgcuNIHaS9jjXfM8OKzDIMm8i+iNELr9egOmWWMzKuErn3tr8y
         y7yh6Sft24TbAEh4fwJ975zP9UtNiAKB0FOGTwuGmPwg4bJ/VwHPNf2oACuLy6uP7VIY
         2piPSX1j8RoAGo932K338Jz6APDlwwSApy5mJuODFE4qyvzX8rA8N0txcsERLG1GpB/P
         cKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982330; x=1792587130;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bete3nYv8k5XX15jQeKmDv9GW3Y/+Uvo/DnMZHhMlzk=;
        b=0qft1ijZpOScmIwq31ae0QBDQwZ6hLggeX685hqHbaT/Z+rxGfT0xk+DDv/pmQQZGS
         GIEqYlqEsOYfY5M0+e3aaVtRoZsAPDRJm2kHbd/G3ev6c7zRzp9oIUFUUmo56QF7z5gp
         Aso6I1dJCTgewbi2qro37JIP++sQb947KTz7KkV/Ck15jfLlhL3/N17zSV5Ml8nupNz0
         4EAhGthlsj4NU/3+5jTYg1Z2ZKFTxF36ft59u7ZIcjaWn3jkPgRqhElfOXHXLrKg2Bd4
         B8U1xOC6hwcvwBwoiaW/5j1UbOEyBm1heuIflBEYQfFfFIqJ44rJ8VSxKRgE/qj/RiTA
         3AMQ==
X-Gm-Message-State: AFq9FYICh51fLDYoCtVvyO8mT4bj17FhQ7qMXvd4mcbYTifhh1Qx2a3y
	MgooFmL6NjKh77jAmTyb9myyNSs+FbgumrVfsu7YDWH/0AqWOsp2jgkadvnC8qUrK8NqeT7Ao8w
	6YLqHh62k3GIUh0ftjb5VKrI/jazgvvUbFItf
X-Gm-Gg: AYBFou1diwMx8JmuQkqwiaYiPDprMMoIK/vprrK7tbNkA0VApc4N5o4WJv3zvZlLhcb
	ftm1VGQv0OhqvdDCuOy98zs0fVWzh/i7K9bMafnuZOrkY5G4ZiRhA97EA0VnRW2Zg8Qb/ZGlQyY
	IuG2JKybdQKvDb3+PAwtwtdmp0vUN+QOeJGHdyXZLysGWHy5Ly88FWzuV5zmEW34FQ1LtuBTj4j
	isSe+OW1vwqJ2YCiedfdPjl7F3MsPvQLBEiZ6HO0nSmHrRHW+5YNm13babhNaQN91PKqGc1/zQz
	Ak8BOhlQzuqMMKZcxaZUJI8+BZJOM5wET5pOllZA8C1cBmyu27lydS8=
X-Received: by 2002:a05:690e:d01:b0:667:b503:4d2e with SMTP id
 956f58d0204a3-679360697a2mr5332542d50.37.1791982329493; Wed, 14 Oct 2026
 05:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFAa3YCbFFNNWLwDEd6u7dGE=5xfb72CSLwJgJVAtP_+=8beDg@mail.gmail.com>
 <19B86BF2-D959-4D1A-81ED-8DADD729042B@osterried.de>
In-Reply-To: <19B86BF2-D959-4D1A-81ED-8DADD729042B@osterried.de>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Wed, 14 Oct 2026 14:51:57 +0200
X-Gm-Features: AclHuK9jU3k3i5Iou36NaasOaTV6wRmBWNwPtoBDalk_iIZDLJr6PX1LSxvCn7g
Message-ID: <CAFAa3YDzx6XGDH0wL+=YYq7uGaccJkdT0a7UUYOiFrdu5WFL9Q@mail.gmail.com>
Subject: Re: [PATCH] ax25-tools user_call: data dropped on a slow link,
 connect timeout that never fires
To: thomas@osterried.de
Cc: linux-hams@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000031c094065dcc666d"

--00000000000031c094065dcc666d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Thank you for the review. The three changes are done, in a second patch
on top of the first one (attached). It is also pushed to pull request 29
of the linuxax25 tree of Lee VE7FET.

1. Partial writes

You are right. write_frame() now loops until the whole frame is
written, as in your proposal, and still waits with poll() on EAGAIN.

I could show the loss with tcp_call: 32 MB sent from stdin to a TCP
server that reads slowly, with -o 65536. The previous version hit 22
partial writes and lost 81408 bytes. The new one delivers the 32 MB,
checksum identical.

2. alarm(0)

It is now called right after connect(), whether it succeeded or not,
in the four programs.

3. -T <seconds>

Added to ax25_call, netrom_call, rose_call and tcp_call, and to the
ax25_call(8) manual page. The default 0 sets no timeout of our own and
leaves it to the protocol timers. As you say, this is how ax25d and
node setups actually behaved until now, since the 30 seconds never
worked. A negative value is refused.

You wrote "I'll -T": if you meant to add it yourself to the official
ax25-tools tree, tell me, and I will adapt or drop that part.

Testing:

- builds without warning with and without zlib (gcc 15 on x86_64,
gcc 12 on aarch64)
- tcp_call -T 5 to a silent address gives up after 5.0 s; without -T
it was still waiting at 40 s; a refused connection fails at once
- rose_call -T 15 on a real node to our BBS over ROSE: banner,
prompt, and the session lasted 30 s without being cut by the alarm
- rose_call -T 10 to a ROSE address whose neighbour link is down:
"Connection timed out - aborting" after 10.03 s, no circuit left

Still not tested: ax25_call and netrom_call in real use, and the -c
compression path beyond compiling.

73 de Bernard, F6BVP


Le mar. 13 oct. 2026 =C3=A0 21:02, Thomas Osterried <thomas@osterried.de> a=
 =C3=A9crit :
>
> Hello Bernard,
>
> thank you for the patch. The fixes look good and address real issues (EAG=
AIN data drops and the SA_RESTART connect timeout).
>
> One small but important detail: write_frame() as written returns success =
on the first successful write() even if only part of the buffer was written=
. On TCP sockets with small write space, write() can return < len with no e=
rror - your code would then silently skip the rest.
>
> Please change write_frame() in user_io.c to loop until all bytes are writ=
ten (handling partial writes), e.g.:
>
> static int write_frame(int fd, const unsigned char *byte, int len)
> {
>         struct pollfd pfd;
>         int written =3D 0;
>         while (written < len) {
>                 int n =3D write(fd, byte + written, len - written);
>                 if (n < 0) {
>                         if (errno =3D=3D EINTR)
>                                 continue;
>                         if (errno !=3D EAGAIN && errno !=3D EWOULDBLOCK)
>                                 return -1;
>                         pfd.fd =3D fd;
>                         pfd.events =3D POLLOUT;
>                         pfd.revents =3D 0;
>                         if (poll(&pfd, 1, -1) < 0 && errno !=3D EINTR)
>                                 return -1;
>                         continue;
>                 }
>                 written +=3D n;
>         }
>         return 0;
> }
>
> This ensures no data is lost on partial writes. AX.25 sequenced sockets a=
re less likely to see this, but it's correct and safe for TCP too.
>
> Two minor suggestions:
> - Always call alarm(0) after connect (success or failure) to clear any pe=
nding alarm.
> - The hardcoded 30s connect timeout doesn't fit all cases; it was intende=
d, but you found it does not work.
>   The protocols already have their timeouts, some adjustable -> AX.25 ker=
nel timeouts can differ, and TCP due to standards defaults to 120s).
>   I'll -T <seconds> with default 0 to skip the internal timeout. That pre=
serves compatibility with existing ax25d/node usage.
>
> Thanks for catching these issues.
>
> vy 73,
>
>   - Thomas  dl9sau
>

--00000000000031c094065dcc666d
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-user_call-write-partial-frames-in-full-make-the-conn.patch"
Content-Disposition: attachment; 
	filename="0001-user_call-write-partial-frames-in-full-make-the-conn.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mv83y8th0>
X-Attachment-Id: f_mv83y8th0

RnJvbSBjNDA3YzNjZTRmZmE0ZjMzZjMwMDY1ZGVmMDdkMmY2ZDExZTE1ZmIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGNkJWUCA8YmVybmFyZC5mNmJ2cEBnbWFpbC5jb20+CkRhdGU6
IFdlZCwgMTQgT2N0IDIwMjYgMTQ6NDE6MzcgKzAyMDAKU3ViamVjdDogW1BBVENIXSB1c2VyX2Nh
bGw6IHdyaXRlIHBhcnRpYWwgZnJhbWVzIGluIGZ1bGwsIG1ha2UgdGhlIGNvbm5lY3QKIHRpbWVv
dXQgb3B0aW9uYWwKCkNoYW5nZXMgYXNrZWQgYnkgVGhvbWFzIE9zdGVycmllZCBETDlTQVUgaW4g
aGlzIHJldmlldyBvbiBsaW51eC1oYW1zLgoKd3JpdGVfZnJhbWUoKSByZXR1cm5lZCBhZnRlciB0
aGUgZmlyc3Qgc3VjY2Vzc2Z1bCB3cml0ZSgpLCBldmVuIHdoZW4Kb25seSBwYXJ0IG9mIHRoZSBm
cmFtZSB3YXMgdGFrZW4uIEEgVENQIHNvY2tldCB3aXRoIGxpdHRsZSByb29tIGxlZnQsCm9yIGFu
eSBzdHJlYW0sIGNhbiBkbyB0aGF0IHdpdGhvdXQgZXJyb3IsIGFuZCB0aGUgcmVzdCBvZiB0aGUg
ZnJhbWUKd2FzIGxvc3QuIExvb3AgdW50aWwgdGhlIHdob2xlIGZyYW1lIGlzIHdyaXR0ZW4uCgpD
bGVhciB0aGUgYWxhcm0gcmlnaHQgYWZ0ZXIgY29ubmVjdCgpLCB3aGV0aGVyIGl0IHN1Y2NlZWRl
ZCBvciBub3QuCgpUaGUgMzAgc2Vjb25kIGNvbm5lY3QgdGltZW91dCB3YXMgaGFyZGNvZGVkLCBh
bmQgdW50aWwgdGhlIHByZXZpb3VzCmNvbW1pdCBpdCBuZXZlciBlbmRlZCBhbnl0aGluZy4gVGhl
IHByb3RvY29scyBoYXZlIHRoZWlyIG93biB0aW1lcnMsCnNvbWUgYWRqdXN0YWJsZSAoQVguMjUs
IE5FVC9ST00gYW5kIFJPU0Uga2VybmVsIHRpbWVycywgYWJvdXQgdHdvCm1pbnV0ZXMgZm9yIFRD
UCkuIEFkZCAtVCA8c2Vjb25kcz47IHRoZSBkZWZhdWx0IDAgc2V0cyBubyB0aW1lb3V0IG9mCm91
ciBvd24sIHdoaWNoIGlzIGhvdyBheDI1ZCBhbmQgbm9kZSBzZXR1cHMgYWN0dWFsbHkgYmVoYXZl
ZCBzbyBmYXIuCgpDby1BdXRob3JlZC1CeTogQ2xhdWRlIE9wdXMgNS41IDxub3JlcGx5QGFudGhy
b3BpYy5jb20+Ci0tLQogYXgyNXRvb2xzL21hbi9heDI1X2NhbGwuOCAgICAgICAgIHwgMTQgKysr
KysrKysrKy0tLS0KIGF4MjV0b29scy91c2VyX2NhbGwvYXgyNV9jYWxsLmMgICB8IDIyICsrKysr
KysrKysrKysrKy0tLS0tLS0KIGF4MjV0b29scy91c2VyX2NhbGwvbmV0cm9tX2NhbGwuYyB8IDIy
ICsrKysrKysrKysrKysrKy0tLS0tLS0KIGF4MjV0b29scy91c2VyX2NhbGwvcm9zZV9jYWxsLmMg
ICB8IDIyICsrKysrKysrKysrKysrKy0tLS0tLS0KIGF4MjV0b29scy91c2VyX2NhbGwvdGNwX2Nh
bGwuYyAgICB8IDIyICsrKysrKysrKysrKysrKy0tLS0tLS0KIGF4MjV0b29scy91c2VyX2NhbGwv
dXNlcl9pby5jICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogYXgyNXRv
b2xzL3VzZXJfY2FsbC91c2VyX2lvLmggICAgIHwgIDEgKwogNyBmaWxlcyBjaGFuZ2VkLCA5MyBp
bnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9heDI1dG9vbHMvbWFu
L2F4MjVfY2FsbC44IGIvYXgyNXRvb2xzL21hbi9heDI1X2NhbGwuOAppbmRleCAwZjJhN2UxLi4w
NmM1MDRlIDEwMDY0NAotLS0gYS9heDI1dG9vbHMvbWFuL2F4MjVfY2FsbC44CisrKyBiL2F4MjV0
b29scy9tYW4vYXgyNV9jYWxsLjgKQEAgLTMsMTMgKzMsMTMgQEAKIGF4MjVfY2FsbCwgbmV0cm9t
X2NhbGwsIHJvc2VfY2FsbCwgdGNwX2NhbGwgXC0gbWFrZSBhbiBBWC4yNSwgTkVUL1JPTSwKIFJP
U0Ugb3IgVENQIGNvbm5lY3Rpb24KIC5TSCBTWU5PUFNJUwotLkIgYXgyNV9jYWxsIFstY10gWy1p
IHBhY2xlbl0gWy1vIHBhY2xlbl0gcG9ydCBsb2NhbF9jYWxsIHJlbW90ZV9jYWxsIFtkaWdpcGVh
dGVycyAuLi5dCisuQiBheDI1X2NhbGwgWy1jXSBbLWkgcGFjbGVuXSBbLW8gcGFjbGVuXSBbLVQg
c2Vjb25kc10gcG9ydCBsb2NhbF9jYWxsIHJlbW90ZV9jYWxsIFtkaWdpcGVhdGVycyAuLi5dCiAu
c3AKLS5CIG5ldHJvbV9jYWxsIFstY10gWy1pIHBhY2xlbl0gWy1vIHBhY2xlbl0gcG9ydCBsb2Nh
bF9jYWxsIHJlbW90ZV9uZXRyb21fYWRkcgorLkIgbmV0cm9tX2NhbGwgWy1jXSBbLWkgcGFjbGVu
XSBbLW8gcGFjbGVuXSBbLVQgc2Vjb25kc10gcG9ydCBsb2NhbF9jYWxsIHJlbW90ZV9uZXRyb21f
YWRkcgogLnNwCi0uQiByb3NlX2NhbGwgWy1jXSBbLWkgcGFjbGVuXSBbLW8gcGFjbGVuXSBwb3J0
IGxvY2FsX2NhbGwgcmVtb3RlX2NhbGwgcmVtb3RlX3Jvc2VfYWRkcgorLkIgcm9zZV9jYWxsIFst
Y10gWy1pIHBhY2xlbl0gWy1vIHBhY2xlbl0gWy1UIHNlY29uZHNdIHBvcnQgbG9jYWxfY2FsbCBy
ZW1vdGVfY2FsbCByZW1vdGVfcm9zZV9hZGRyCiAuc3AKLS5CIHRjcF9jYWxsIFstY10gWy1pIHBh
Y2xlbl0gWy1vIHBhY2xlbl0gcmVtb3RlX2FkZHIgcmVtb3RlX3BvcnQKKy5CIHRjcF9jYWxsIFst
Y10gWy1pIHBhY2xlbl0gWy1vIHBhY2xlbl0gWy1UIHNlY29uZHNdIHJlbW90ZV9hZGRyIHJlbW90
ZV9wb3J0CiAuU0ggREVTQ1JJUFRJT04KIC5MUAogLkIgYXgyNV9jYWxsLCBuZXRyb21fY2FsbCwg
cm9zZV9jYWxsIGFuZCB0Y3BfY2FsbApAQCAtNTQsNiArNTQsMTIgQEAgZGVmYXVsdCBpcyAyNTYg
Zm9yIGF4MjVfY2FsbCBhbmQgcm9zZV9jYWxsLCAyMzYgZm9yIG5ldHJvbV9jYWxsIGFuZAogVGhl
IG1heGltdW0gZnJhbWUgbGVuZ3RoIHRvIGJlIHVzZWQgb24gdGhlIG91dGdvaW5nIGNvbm5lY3Rp
b24uIFRoZQogZGVmYXVsdCBpcyAyNTYgZm9yIGF4MjVfY2FsbCBhbmQgcm9zZV9jYWxsLCAyMzYg
Zm9yIG5ldHJvbV9jYWxsIGFuZAogMTAyNCBmb3IgdGNwX2NhbGwuCisuVFAgMTIKKy5CSSAiXC1U
IHNlY29uZHMiCitHaXZlcyB1cCBpZiB0aGUgY29ubmVjdGlvbiBpcyBub3QgZXN0YWJsaXNoZWQg
d2l0aGluIHRoZSBnaXZlbiBudW1iZXIgb2YKK3NlY29uZHMuIFRoZSBkZWZhdWx0IGlzIDA6IG5v
IHRpbWVvdXQgb2YgaXRzIG93biwgdGhlIHRpbWVycyBvZiB0aGUKK3Byb3RvY29sIGRlY2lkZSAo
QVguMjUsIE5FVC9ST00gYW5kIFJPU0Uga2VybmVsIHRpbWVycywgYWJvdXQgdHdvIG1pbnV0ZXMK
K2ZvciBUQ1ApLgogLlNIIEZJTEVTCiAuYnIKIC9ldGMvYXgyNS9heHBvcnRzCmRpZmYgLS1naXQg
YS9heDI1dG9vbHMvdXNlcl9jYWxsL2F4MjVfY2FsbC5jIGIvYXgyNXRvb2xzL3VzZXJfY2FsbC9h
eDI1X2NhbGwuYwppbmRleCBlYTVmYzYwLi45NWViYzk0IDEwMDY0NAotLS0gYS9heDI1dG9vbHMv
dXNlcl9jYWxsL2F4MjVfY2FsbC5jCisrKyBiL2F4MjV0b29scy91c2VyX2NhbGwvYXgyNV9jYWxs
LmMKQEAgLTIyLDEwICsyMiwxMCBAQAogaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQog
ewogCWNoYXIgYnVmZmVyWzI1Nl0sICphZGRyOwotCWludCBzLCBhZGRybGVuID0gc2l6ZW9mKHN0
cnVjdCBmdWxsX3NvY2thZGRyX2F4MjUpOworCWludCBzLCByZXQsIGFkZHJsZW4gPSBzaXplb2Yo
c3RydWN0IGZ1bGxfc29ja2FkZHJfYXgyNSk7CiAJc3RydWN0IGZ1bGxfc29ja2FkZHJfYXgyNSBh
eGJpbmQsIGF4Y29ubmVjdDsKIAotCXdoaWxlICgocyA9IGdldG9wdChhcmdjLCBhcmd2LCAiY2k6
bzoiKSkgIT0gLTEpIHsKKwl3aGlsZSAoKHMgPSBnZXRvcHQoYXJnYywgYXJndiwgImNpOm86VDoi
KSkgIT0gLTEpIHsKIAkJc3dpdGNoIChzKSB7CiAJCWNhc2UgJ2MnOgogCQkJaW5pdF9jb21wcmVz
cygpOwpAQCAtMzcsNiArMzcsOSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJ
CWNhc2UgJ28nOgogCQkJcGFjbGVuX291dCA9IGF0b2kob3B0YXJnKTsKIAkJCWJyZWFrOworCQlj
YXNlICdUJzoKKwkJCWNvbm5lY3Rfc2Vjb25kcyA9IGF0b2kob3B0YXJnKTsKKwkJCWJyZWFrOwog
CQljYXNlICc6JzoKIAkJY2FzZSAnPyc6CiAJCQllcnIoIkVSUk9SOiBpbnZhbGlkIG9wdGlvbiB1
c2FnZVxyIik7CkBAIC00OSw2ICs1MiwxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFy
Z3YpCiAJCXJldHVybiAxOwogCX0KIAorCWlmIChjb25uZWN0X3NlY29uZHMgPCAwKSB7CisJCWVy
cigiRVJST1I6IGludmFsaWQgY29ubmVjdCB0aW1lb3V0XHIiKTsKKwkJcmV0dXJuIDE7CisJfQor
CiAJLyoKIAkgKiBBcmd1bWVudHMgc2hvdWxkIGJlICJheDI1X2NhbGwgcG9ydCBteWNhbGwgcmVt
Y2FsbCBbZGlnaXMgLi4uXSIKIAkgKi8KQEAgLTExMCwxNCArMTE4LDE2IEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICoqYXJndikKIAl1c2VyX3dyaXRlKFNURE9VVF9GSUxFTk8sIGJ1ZmZlciwg
c3RybGVuKGJ1ZmZlcikpOwogCiAJLyoKLQkgKiBJZiBubyByZXNwb25zZSBpbiAzMCBzZWNvbmRz
LCBnbyBhd2F5LgorCSAqIFdpdGggLVQsIGdpdmUgdXAgaWYgdGhlcmUgaXMgbm8gcmVzcG9uc2Ug
aW4gdGltZS4KIAkgKi8KLQljb25uZWN0X3RpbWVvdXQoMzApOworCWNvbm5lY3RfdGltZW91dChj
b25uZWN0X3NlY29uZHMpOwogCiAJLyoKIAkgKiBMZXRzIHRyeSBhbmQgY29ubmVjdCB0byB0aGUg
ZmFyIGVuZC4KIAkgKi8KLQlpZiAoY29ubmVjdChzLCAoc3RydWN0IHNvY2thZGRyICopJmF4Y29u
bmVjdCwgYWRkcmxlbikgIT0gMCkgeworCXJldCA9IGNvbm5lY3QocywgKHN0cnVjdCBzb2NrYWRk
ciAqKSZheGNvbm5lY3QsIGFkZHJsZW4pOworCWFsYXJtKDApOworCWlmIChyZXQgIT0gMCkgewog
CQlzd2l0Y2ggKGVycm5vKSB7CiAJCWNhc2UgRUNPTk5SRUZVU0VEOgogCQkJc3RyY3B5KGJ1ZmZl
ciwgIioqKiBDb25uZWN0aW9uIHJlZnVzZWQgLSBhYm9ydGluZ1xyIik7CkBAIC0xMzksOCArMTQ5
LDYgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCS8qCiAJICogV2UgZ290IHRo
ZXJlLgogCSAqLwotCWFsYXJtKDApOwotCiAJc3RyY3B5KGJ1ZmZlciwgIioqKiBDb25uZWN0ZWRc
ciIpOwogCXVzZXJfd3JpdGUoU1RET1VUX0ZJTEVOTywgYnVmZmVyLCBzdHJsZW4oYnVmZmVyKSk7
CiAKZGlmZiAtLWdpdCBhL2F4MjV0b29scy91c2VyX2NhbGwvbmV0cm9tX2NhbGwuYyBiL2F4MjV0
b29scy91c2VyX2NhbGwvbmV0cm9tX2NhbGwuYwppbmRleCBhNTFlZGU1Li4yYzdlZjY0IDEwMDY0
NAotLS0gYS9heDI1dG9vbHMvdXNlcl9jYWxsL25ldHJvbV9jYWxsLmMKKysrIGIvYXgyNXRvb2xz
L3VzZXJfY2FsbC9uZXRyb21fY2FsbC5jCkBAIC0yNCwxMyArMjQsMTMgQEAKIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICoqYXJndikKIHsKIAljaGFyIGJ1ZmZlclsyNTZdLCAqYWRkcjsKLQlpbnQg
cywgYWRkcmxlbiA9IHNpemVvZihzdHJ1Y3QgZnVsbF9zb2NrYWRkcl9heDI1KTsKKwlpbnQgcywg
cmV0LCBhZGRybGVuID0gc2l6ZW9mKHN0cnVjdCBmdWxsX3NvY2thZGRyX2F4MjUpOwogCXN0cnVj
dCBmdWxsX3NvY2thZGRyX2F4MjUgbnJiaW5kLCBucmNvbm5lY3Q7CiAKIAlwYWNsZW5faW4gPSAy
MzY7CiAJcGFjbGVuX291dCA9IDIzNjsKIAotCXdoaWxlICgocyA9IGdldG9wdChhcmdjLCBhcmd2
LCAiY2k6bzoiKSkgIT0gLTEpIHsKKwl3aGlsZSAoKHMgPSBnZXRvcHQoYXJnYywgYXJndiwgImNp
Om86VDoiKSkgIT0gLTEpIHsKIAkJc3dpdGNoIChzKSB7CiAJCWNhc2UgJ2MnOgogCQkJaW5pdF9j
b21wcmVzcygpOwpAQCAtNDIsNiArNDIsOSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFy
Z3YpCiAJCWNhc2UgJ28nOgogCQkJcGFjbGVuX291dCA9IGF0b2kob3B0YXJnKTsKIAkJCWJyZWFr
OworCQljYXNlICdUJzoKKwkJCWNvbm5lY3Rfc2Vjb25kcyA9IGF0b2kob3B0YXJnKTsKKwkJCWJy
ZWFrOwogCQljYXNlICc6JzoKIAkJY2FzZSAnPyc6CiAJCQllcnIoIkVSUk9SOiBpbnZhbGlkIG9w
dGlvbiB1c2FnZVxyIik7CkBAIC01NCw2ICs1NywxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqKmFyZ3YpCiAJCXJldHVybiAxOwogCX0KIAorCWlmIChjb25uZWN0X3NlY29uZHMgPCAwKSB7
CisJCWVycigiRVJST1I6IGludmFsaWQgY29ubmVjdCB0aW1lb3V0XHIiKTsKKwkJcmV0dXJuIDE7
CisJfQorCiAJLyoKIAkgKiBBcmd1bWVudHMgc2hvdWxkIGJlICJuZXRyb21fY2FsbCBwb3J0IG15
Y2FsbCByZW1hZGRyIgogCSAqLwpAQCAtMTIxLDE0ICsxMjksMTYgQEAgaW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKiphcmd2KQogCXVzZXJfd3JpdGUoU1RET1VUX0ZJTEVOTywgYnVmZmVyLCBzdHJs
ZW4oYnVmZmVyKSk7CiAKIAkvKgotCSAqIElmIG5vIHJlc3BvbnNlIGluIDMwIHNlY29uZHMsIGdv
IGF3YXkuCisJICogV2l0aCAtVCwgZ2l2ZSB1cCBpZiB0aGVyZSBpcyBubyByZXNwb25zZSBpbiB0
aW1lLgogCSAqLwotCWNvbm5lY3RfdGltZW91dCgzMCk7CisJY29ubmVjdF90aW1lb3V0KGNvbm5l
Y3Rfc2Vjb25kcyk7CiAKIAkvKgogCSAqIExldHMgdHJ5IGFuZCBjb25uZWN0IHRvIHRoZSBmYXIg
ZW5kLgogCSAqLwotCWlmIChjb25uZWN0KHMsIChzdHJ1Y3Qgc29ja2FkZHIgKikmbnJjb25uZWN0
LCBhZGRybGVuKSAhPSAwKSB7CisJcmV0ID0gY29ubmVjdChzLCAoc3RydWN0IHNvY2thZGRyICop
Jm5yY29ubmVjdCwgYWRkcmxlbik7CisJYWxhcm0oMCk7CisJaWYgKHJldCAhPSAwKSB7CiAJCXN3
aXRjaCAoZXJybm8pIHsKIAkJY2FzZSBFQ09OTlJFRlVTRUQ6CiAJCQlzdHJjcHkoYnVmZmVyLCAi
KioqIENvbm5lY3Rpb24gcmVmdXNlZCAtIGFib3J0aW5nXHIiKTsKQEAgLTE1MCw4ICsxNjAsNiBA
QCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJLyoKIAkgKiBXZSBnb3QgdGhlcmUu
CiAJICovCi0JYWxhcm0oMCk7Ci0KIAlzdHJjcHkoYnVmZmVyLCAiKioqIENvbm5lY3RlZFxyIik7
CiAJdXNlcl93cml0ZShTVERPVVRfRklMRU5PLCBidWZmZXIsIHN0cmxlbihidWZmZXIpKTsKIApk
aWZmIC0tZ2l0IGEvYXgyNXRvb2xzL3VzZXJfY2FsbC9yb3NlX2NhbGwuYyBiL2F4MjV0b29scy91
c2VyX2NhbGwvcm9zZV9jYWxsLmMKaW5kZXggMjk4ODU2OC4uMTY1Y2FhMiAxMDA2NDQKLS0tIGEv
YXgyNXRvb2xzL3VzZXJfY2FsbC9yb3NlX2NhbGwuYworKysgYi9heDI1dG9vbHMvdXNlcl9jYWxs
L3Jvc2VfY2FsbC5jCkBAIC0yMywxMCArMjMsMTAgQEAKIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICoqYXJndikKIHsKIAljaGFyIGJ1ZmZlclsyNTZdLCAqYWRkcjsKLQlpbnQgcywgYWRkcmxlbiA9
IHNpemVvZihzdHJ1Y3Qgc29ja2FkZHJfcm9zZSk7CisJaW50IHMsIHJldCwgYWRkcmxlbiA9IHNp
emVvZihzdHJ1Y3Qgc29ja2FkZHJfcm9zZSk7CiAJc3RydWN0IHNvY2thZGRyX3Jvc2Ugcm9zZWJp
bmQsIHJvc2Vjb25uZWN0OwogCi0Jd2hpbGUgKChzID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJjaTpv
OiIpKSAhPSAtMSkgeworCXdoaWxlICgocyA9IGdldG9wdChhcmdjLCBhcmd2LCAiY2k6bzpUOiIp
KSAhPSAtMSkgewogCQlzd2l0Y2ggKHMpIHsKIAkJY2FzZSAnYyc6CiAJCQlpbml0X2NvbXByZXNz
KCk7CkBAIC0zOCw2ICszOCw5IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAkJ
Y2FzZSAnbyc6CiAJCQlwYWNsZW5fb3V0ID0gYXRvaShvcHRhcmcpOwogCQkJYnJlYWs7CisJCWNh
c2UgJ1QnOgorCQkJY29ubmVjdF9zZWNvbmRzID0gYXRvaShvcHRhcmcpOworCQkJYnJlYWs7CiAJ
CWNhc2UgJzonOgogCQljYXNlICc/JzoKIAkJCWVycigiRVJST1I6IGludmFsaWQgb3B0aW9uIHVz
YWdlXHIiKTsKQEAgLTUwLDYgKzUzLDExIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
dikKIAkJcmV0dXJuIDE7CiAJfQogCisJaWYgKGNvbm5lY3Rfc2Vjb25kcyA8IDApIHsKKwkJZXJy
KCJFUlJPUjogaW52YWxpZCBjb25uZWN0IHRpbWVvdXRcciIpOworCQlyZXR1cm4gMTsKKwl9CisK
IAkvKgogCSAqIEFyZ3VtZW50cyBzaG91bGQgYmUgInJvc2VfY2FsbCBwb3J0IG15Y2FsbCByZW1j
YWxsIHJlbWFkZHIiCiAJICovCkBAIC0xMTgsMTQgKzEyNiwxNiBAQCBpbnQgbWFpbihpbnQgYXJn
YywgY2hhciAqKmFyZ3YpCiAJdXNlcl93cml0ZShTVERPVVRfRklMRU5PLCBidWZmZXIsIHN0cmxl
bihidWZmZXIpKTsKIAogCS8qCi0JICogSWYgbm8gcmVzcG9uc2UgaW4gMzAgc2Vjb25kcywgZ28g
YXdheS4KKwkgKiBXaXRoIC1ULCBnaXZlIHVwIGlmIHRoZXJlIGlzIG5vIHJlc3BvbnNlIGluIHRp
bWUuCiAJICovCi0JY29ubmVjdF90aW1lb3V0KDMwKTsKKwljb25uZWN0X3RpbWVvdXQoY29ubmVj
dF9zZWNvbmRzKTsKIAogCS8qCiAJICogTGV0cyB0cnkgYW5kIGNvbm5lY3QgdG8gdGhlIGZhciBl
bmQuCiAJICovCi0JaWYgKGNvbm5lY3QocywgKHN0cnVjdCBzb2NrYWRkciAqKSZyb3NlY29ubmVj
dCwgYWRkcmxlbikgIT0gMCkgeworCXJldCA9IGNvbm5lY3QocywgKHN0cnVjdCBzb2NrYWRkciAq
KSZyb3NlY29ubmVjdCwgYWRkcmxlbik7CisJYWxhcm0oMCk7CisJaWYgKHJldCAhPSAwKSB7CiAJ
CXN3aXRjaCAoZXJybm8pIHsKIAkJY2FzZSBFQ09OTlJFRlVTRUQ6CiAJCQlzdHJjcHkoYnVmZmVy
LCAiKioqIENvbm5lY3Rpb24gcmVmdXNlZCAtIGFib3J0aW5nXHIiKTsKQEAgLTE0Nyw4ICsxNTcs
NiBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJLyoKIAkgKiBXZSBnb3QgdGhl
cmUuCiAJICovCi0JYWxhcm0oMCk7Ci0KIAlzdHJjcHkoYnVmZmVyLCAiKioqIENvbm5lY3RlZFxy
Iik7CiAJdXNlcl93cml0ZShTVERPVVRfRklMRU5PLCBidWZmZXIsIHN0cmxlbihidWZmZXIpKTsK
IApkaWZmIC0tZ2l0IGEvYXgyNXRvb2xzL3VzZXJfY2FsbC90Y3BfY2FsbC5jIGIvYXgyNXRvb2xz
L3VzZXJfY2FsbC90Y3BfY2FsbC5jCmluZGV4IDJlNmM4ODguLmQ5YTIyNDEgMTAwNjQ0Ci0tLSBh
L2F4MjV0b29scy91c2VyX2NhbGwvdGNwX2NhbGwuYworKysgYi9heDI1dG9vbHMvdXNlcl9jYWxs
L3RjcF9jYWxsLmMKQEAgLTE3LDcgKzE3LDcgQEAKIGludCBtYWluKGludCBhcmdjLCBjaGFyICoq
YXJndikKIHsKIAljaGFyIGJ1ZmZlclsyNTZdOwotCWludCBzLCBhZGRybGVuID0gc2l6ZW9mKHN0
cnVjdCBzb2NrYWRkcl9pbik7CisJaW50IHMsIHJldCwgYWRkcmxlbiA9IHNpemVvZihzdHJ1Y3Qg
c29ja2FkZHJfaW4pOwogCXN0cnVjdCBzb2NrYWRkcl9pbiBhZGRyOwogCXN0cnVjdCBob3N0ZW50
ICpocDsKIAlzdHJ1Y3Qgc2VydmVudCAqc3A7CkBAIC0yNiw3ICsyNiw3IEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICoqYXJndikKIAlwYWNsZW5faW4gPSAxMDI0OwogCXBhY2xlbl9vdXQgPSAx
MDI0OwogCi0Jd2hpbGUgKChzID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJjaTpvOnEiKSkgIT0gLTEp
IHsKKwl3aGlsZSAoKHMgPSBnZXRvcHQoYXJnYywgYXJndiwgImNpOm86VDpxIikpICE9IC0xKSB7
CiAJCXN3aXRjaCAocykgewogCQljYXNlICdjJzoKIAkJCWluaXRfY29tcHJlc3MoKTsKQEAgLTM4
LDYgKzM4LDkgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCQljYXNlICdvJzoK
IAkJCXBhY2xlbl9vdXQgPSBhdG9pKG9wdGFyZyk7CiAJCQlicmVhazsKKwkJY2FzZSAnVCc6CisJ
CQljb25uZWN0X3NlY29uZHMgPSBhdG9pKG9wdGFyZyk7CisJCQlicmVhazsKIAkJY2FzZSAncSc6
CiAJCQl2ZXJib3NlID0gMDsKIAkJCWJyZWFrOwpAQCAtNTMsNiArNTYsMTEgQEAgaW50IG1haW4o
aW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCQlyZXR1cm4gMTsKIAl9CiAKKwlpZiAoY29ubmVjdF9z
ZWNvbmRzIDwgMCkgeworCQllcnIoIkVSUk9SOiBpbnZhbGlkIGNvbm5lY3QgdGltZW91dFxuIik7
CisJCXJldHVybiAxOworCX0KKwogCS8qCiAJICogQXJndW1lbnRzIHNob3VsZCBiZSAidGNwX2Nh
bGwgcmVtYWRkciByZW1wb3J0IgogCSAqLwpAQCAtOTgsMTQgKzEwNiwxNiBAQCBpbnQgbWFpbihp
bnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJfQogCiAJLyoKLQkgKiBJZiBubyByZXNwb25zZSBpbiAz
MCBzZWNvbmRzLCBnbyBhd2F5LgorCSAqIFdpdGggLVQsIGdpdmUgdXAgaWYgdGhlcmUgaXMgbm8g
cmVzcG9uc2UgaW4gdGltZS4KIAkgKi8KLQljb25uZWN0X3RpbWVvdXQoMzApOworCWNvbm5lY3Rf
dGltZW91dChjb25uZWN0X3NlY29uZHMpOwogCiAJLyoKIAkgKiBMZXRzIHRyeSBhbmQgY29ubmVj
dCB0byB0aGUgZmFyIGVuZC4KIAkgKi8KLQlpZiAoY29ubmVjdChzLCAoc3RydWN0IHNvY2thZGRy
ICopJmFkZHIsIGFkZHJsZW4pICE9IDApIHsKKwlyZXQgPSBjb25uZWN0KHMsIChzdHJ1Y3Qgc29j
a2FkZHIgKikmYWRkciwgYWRkcmxlbik7CisJYWxhcm0oMCk7CisJaWYgKHJldCAhPSAwKSB7CiAJ
CXNucHJpbnRmKGJ1ZmZlciwgc2l6ZW9mKGJ1ZmZlciksICJFUlJPUjogY2FuJ3QgY29ubmVjdDog
JXNcbiIsIHN0cmVycm9yKGVycm5vKSk7CiAJCWVycihidWZmZXIpOwogCX0KQEAgLTExMyw4ICsx
MjMsNiBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJLyoKIAkgKiBXZSBnb3Qg
dGhlcmUuCiAJICovCi0JYWxhcm0oMCk7Ci0KIAlpZiAodmVyYm9zZSkgewogCQlzdHJjcHkoYnVm
ZmVyLCAiKioqIENvbm5lY3RlZFxuIik7CiAJCXVzZXJfd3JpdGUoU1RET1VUX0ZJTEVOTywgYnVm
ZmVyLCBzdHJsZW4oYnVmZmVyKSk7CmRpZmYgLS1naXQgYS9heDI1dG9vbHMvdXNlcl9jYWxsL3Vz
ZXJfaW8uYyBiL2F4MjV0b29scy91c2VyX2NhbGwvdXNlcl9pby5jCmluZGV4IGY4MjM3NjEuLmUw
ZjFiNDYgMTAwNjQ0Ci0tLSBhL2F4MjV0b29scy91c2VyX2NhbGwvdXNlcl9pby5jCisrKyBiL2F4
MjV0b29scy91c2VyX2NhbGwvdXNlcl9pby5jCkBAIC0xNiw2ICsxNiw4IEBACiBpbnQgY29tcHJl
c3Npb247CiBpbnQgcGFjbGVuX2luCQk9IDI1NjsKIGludCBwYWNsZW5fb3V0CQk9IDI1NjsKKy8q
IC1UOiBzZWNvbmRzIGFsbG93ZWQgdG8gY29ubmVjdCgpLCAwIGxlYXZlcyBpdCB0byB0aGUgcHJv
dG9jb2wgdGltZXJzICovCitpbnQgY29ubmVjdF9zZWNvbmRzOwogCiAvKiBUaGlzIGlzIGZvciBz
ZWxlY3RfbG9vcCgpICovCiBzdGF0aWMgdW5zaWduZWQgY2hhciBidWZbQlVGTEVOXTsKQEAgLTY3
LDE1ICs2OSwxOSBAQCBzdGF0aWMgdm9pZCBhbGFybV9oYW5kbGVyKGludCBzaWcpCiB9CiAKIC8q
Ci0gKiBBcm1zIHRoZSB0aW1lb3V0IG9mIGNvbm5lY3QoKS4gVGhlIGhhbmRsZXIgaXMgaW5zdGFs
bGVkIHdpdGhvdXQKLSAqIFNBX1JFU1RBUlQ6IHdpdGggc2lnbmFsKCksIGdsaWJjIHJlc3RhcnRz
IHRoZSBpbnRlcnJ1cHRlZCBjb25uZWN0KCksIHdoaWNoCi0gKiBvbiBhbiBBWC4yNSwgTkVUL1JP
TSBvciBST1NFIHNvY2tldCBzdGFydHMgYSBuZXcgY29ubmVjdGlvbiBhdHRlbXB0IGluc3RlYWQK
LSAqIG9mIHJldHVybmluZyBFSU5UUiwgc28gdGhlIHRpbWVvdXQgbmV2ZXIgZW5kZWQgYW55dGhp
bmcuCisgKiBBcm1zIHRoZSB0aW1lb3V0IG9mIGNvbm5lY3QoKSwgaWYgLVQgd2FzIGdpdmVuLiBU
aGUgaGFuZGxlciBpcyBpbnN0YWxsZWQKKyAqIHdpdGhvdXQgU0FfUkVTVEFSVDogd2l0aCBzaWdu
YWwoKSwgZ2xpYmMgcmVzdGFydHMgdGhlIGludGVycnVwdGVkCisgKiBjb25uZWN0KCksIHdoaWNo
IG9uIGFuIEFYLjI1LCBORVQvUk9NIG9yIFJPU0Ugc29ja2V0IHN0YXJ0cyBhIG5ldworICogY29u
bmVjdGlvbiBhdHRlbXB0IGluc3RlYWQgb2YgcmV0dXJuaW5nIEVJTlRSLCBzbyB0aGUgdGltZW91
dCBuZXZlciBlbmRlZAorICogYW55dGhpbmcuIFdpdGggbm8gLVQsIHRoZSB0aW1lcnMgb2YgdGhl
IHByb3RvY29sIGRlY2lkZSBhbG9uZS4KICAqLwogdm9pZCBjb25uZWN0X3RpbWVvdXQodW5zaWdu
ZWQgaW50IHNlY29uZHMpCiB7CiAJc3RydWN0IHNpZ2FjdGlvbiBzYTsKIAorCWlmIChzZWNvbmRz
ID09IDApCisJCXJldHVybjsKKwogCW1lbXNldCgmc2EsIDAsIHNpemVvZihzYSkpOwogCXNhLnNh
X2hhbmRsZXIgPSBhbGFybV9oYW5kbGVyOwogCXNpZ2VtcHR5c2V0KCZzYS5zYV9tYXNrKTsKQEAg
LTg4LDE1ICs5NCwyMSBAQCB2b2lkIGNvbm5lY3RfdGltZW91dCh1bnNpZ25lZCBpbnQgc2Vjb25k
cykKICAqIEJvdGggZW5kcyBhcmUgbm9uIGJsb2NraW5nIChzZWUgc2VsZWN0X2xvb3AoKSkuIFdo
ZW4gdGhlIGZhciBzaWRlIGlzIHNsb3cKICAqIC0gYSAxMjAwIGJhdWQgcmFkaW8gbGluayBmZWQg
YnkgYSBCQlMgbGlzdGluZyAtIHRoZSBzZW5kIGJ1ZmZlciBvZiB0aGUKICAqIHNvY2tldCBmaWxs
cyBhbmQgd3JpdGUoKSBmYWlscyB3aXRoIEVBR0FJTjogd2FpdCB1bnRpbCB0aGVyZSBpcyByb29t
IGFuZAotICogdHJ5IGFnYWluLCBpbnN0ZWFkIG9mIGRyb3BwaW5nIHRoZSBkYXRhLgorICogdHJ5
IGFnYWluLCBpbnN0ZWFkIG9mIGRyb3BwaW5nIHRoZSBkYXRhLiBBIHN0cmVhbSAoVENQLCBwaXBl
LCBwdHkpIG1heQorICogYWxzbyB0YWtlIG9ubHkgcGFydCBvZiB0aGUgYnVmZmVyOiB3cml0ZSB0
aGUgcmVzdC4KICAqLwogc3RhdGljIGludCB3cml0ZV9mcmFtZShpbnQgZmQsIGNvbnN0IHVuc2ln
bmVkIGNoYXIgKmJ5dGUsIGludCBsZW4pCiB7CiAJc3RydWN0IHBvbGxmZCBwZmQ7CisJaW50IHdy
aXR0ZW4gPSAwOworCWludCBuOwogCi0JZm9yICg7OykgewotCQlpZiAod3JpdGUoZmQsIGJ5dGUs
IGxlbikgPj0gMCkKLQkJCXJldHVybiAwOworCXdoaWxlICh3cml0dGVuIDwgbGVuKSB7CisJCW4g
PSB3cml0ZShmZCwgYnl0ZSArIHdyaXR0ZW4sIGxlbiAtIHdyaXR0ZW4pOworCQlpZiAobiA+PSAw
KSB7CisJCQl3cml0dGVuICs9IG47CisJCQljb250aW51ZTsKKwkJfQogCQlpZiAoZXJybm8gPT0g
RUlOVFIpCiAJCQljb250aW51ZTsKIAkJaWYgKGVycm5vICE9IEVBR0FJTiAmJiBlcnJubyAhPSBF
V09VTERCTE9DSykKQEAgLTEwOCw2ICsxMjAsOCBAQCBzdGF0aWMgaW50IHdyaXRlX2ZyYW1lKGlu
dCBmZCwgY29uc3QgdW5zaWduZWQgY2hhciAqYnl0ZSwgaW50IGxlbikKIAkJaWYgKHBvbGwoJnBm
ZCwgMSwgLTEpIDwgMCAmJiBlcnJubyAhPSBFSU5UUikKIAkJCXJldHVybiAtMTsKIAl9CisKKwly
ZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBmbHVzaF9vdXRwdXQoaW50IGZkLCBjb25zdCB2b2lk
ICpidWYsIHNpemVfdCBjb3VudCkKZGlmZiAtLWdpdCBhL2F4MjV0b29scy91c2VyX2NhbGwvdXNl
cl9pby5oIGIvYXgyNXRvb2xzL3VzZXJfY2FsbC91c2VyX2lvLmgKaW5kZXggNGI3ZDcwNi4uY2I0
YTZhNiAxMDA2NDQKLS0tIGEvYXgyNXRvb2xzL3VzZXJfY2FsbC91c2VyX2lvLmgKKysrIGIvYXgy
NXRvb2xzL3VzZXJfY2FsbC91c2VyX2lvLmgKQEAgLTExLDMgKzExLDQgQEAgZXh0ZXJuIHZvaWQg
ZW5kX2NvbXByZXNzKHZvaWQpOwogZXh0ZXJuIGludCBjb21wcmVzc2lvbjsKIGV4dGVybiBpbnQg
cGFjbGVuX2luOwogZXh0ZXJuIGludCBwYWNsZW5fb3V0OworZXh0ZXJuIGludCBjb25uZWN0X3Nl
Y29uZHM7Ci0tIAoyLjUzLjAKCg==
--00000000000031c094065dcc666d--
