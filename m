From: Roland Schwarz <roland.schwarz@blackspace.at>
Subject: Re: unknown kiss packet: 0x80 0x9e
Date: Fri, 17 Sep 2021 17:53:36 +0200
Message-ID: <9172bc4f-05a7-a24a-3216-b9311dd10fd6@blackspace.at>
References: <654f3a4d-6420-4fba-e6d9-5693a67f6459@blackspace.at>
 <20210917153456.DE6B832983F@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="svCSZuuOiZU43t2fMc2BecjmrQeeFfnE7"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20210917153456.DE6B832983F@yagi.h-net.msu.edu>
List-ID: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--svCSZuuOiZU43t2fMc2BecjmrQeeFfnE7
Content-Type: multipart/mixed; boundary="Wq0n6lQBQ2RhreYV2B5a2F0GujkMFKe0l";
 protected-headers="v1"
From: Roland Schwarz <roland.schwarz@blackspace.at>
To: linux-hams@vger.kernel.org
Message-ID: <9172bc4f-05a7-a24a-3216-b9311dd10fd6@blackspace.at>
Subject: Re: unknown kiss packet: 0x80 0x9e
References: <654f3a4d-6420-4fba-e6d9-5693a67f6459@blackspace.at>
 <20210917153456.DE6B832983F@yagi.h-net.msu.edu>
In-Reply-To: <20210917153456.DE6B832983F@yagi.h-net.msu.edu>

--Wq0n6lQBQ2RhreYV2B5a2F0GujkMFKe0l
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 17.09.21 at 17:34 wrote Dennis Boone:
>   > unknown kiss packet: 0x80 0x9e
>   > unknown kiss packet: 0x20 0x9e
>=20
> If 0x80 and 0x20 are the second byte of the frame (after the FEND), the=
n
> they're data packets (low nibble 0) from devices addressed (high nibble=
)
> as 8 and 2 respectively.

I think I found out what it is:
http://www.symek.com/g/smack.html

The issue is documented in direwolf and has to do with a state machine=20
that tries to guess the serial line CRC protocoll (which isn't need for=20
soundmodem). The state machine ideally shouldn't get into the way and=20
switch off CRC if not needed. As it turns out, however I am seeing a=20
long initial delay until the first packet reaches the transmitter.

Simply switching of smack mode with kissparms -c 1 does the trick. In=20
direwolf package it is also suggested to start the mkiss driver with=20
parameter crc_force=3D1 (which I have not tried yet).

73 oe1rsa

--=20
__________________________________________
   _  _  | Roland Schwarz
  |_)(_  |
  | \__) | mailto:roland.schwarz@blackspace.at
________| http://www.blackspace.at


--Wq0n6lQBQ2RhreYV2B5a2F0GujkMFKe0l--

--svCSZuuOiZU43t2fMc2BecjmrQeeFfnE7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELmDUtkkUQD99pU+KklFj+hFsiUgFAmFEugAFAwAAAAAACgkQklFj+hFsiUhA
7w/9EHA0S/cNt0zPHqT2S7SYN+xtbbcqyQ8KgH/MP7I+Ln8FSMyM06Rvh3iKnZy+iq/wI7j6rScz
5JAEj79IiVtsAnMmOqerwnE/CJ5nDbOJL/q2WE22V1iNjj8OTV74yZa6dJ8yQ/oqGGZ536WUZzik
p4esdVYVCb5zMwbByjBWAVLhr8WDnQVaEXUFsjJtYcH99aY7IIqr6R1wuhKdaObVkD1ptRW7uKzQ
x/980UK+pc7+jVZ/vVPIaLEVMduLAvYtWaH1ABfmse3OH62NJ/mzPZTinNy4obaomhWQLHvnJuE7
RqIqN7jH2t1BZHzDImNLVkIUrP7TSvxW+dmkASbajMeHPjuNVTurSgG9D0w6RZZz1un4apip6IAy
UYcJv82tVJ2pSUhGbJslOsZGCgSlC6Yg4aqpsKOIMtUaGKYFMHSCFSbY8Zi45TzkU5X/wVBdH3N3
Xt3aupIfARqA04NXi6NPG46gILJYTfhF0W4szz0vsKMwRKVmmBX1Z2L7F19XnRdrhZCwfIRb/q5Z
91lI3aF79dZrvMLy+eLLGFAlXTCx6spAbzuUm0wOItyE4Ig8LVKH1bIMvAnwfTKh24NlHTGaIFfL
8IdWeEj4zcd/uYzLAoJBxYf0PwWMI42NOiAOKn/3m8kt6Va8UMEWnNUycOnPAvRbY/vsySIis/8m
tYY=
=6Qa/
-----END PGP SIGNATURE-----

--svCSZuuOiZU43t2fMc2BecjmrQeeFfnE7--
