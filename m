Received: from www11.qth.com (www11.qth.com [72.52.250.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E8B9463
	for <linux-hams@vger.kernel.org>; Tue, 17 Feb 2026 00:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.52.250.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771286612; cv=none; b=Z7OMr8Ye+PfdBaItNvk2lEkHoaY7/ITzLDmaNvhmRLys0pDJcS/P+94BKB10oU9X+uQze8uQAW0tGBEfmJAslY3Lb9nuamsDRACTwf0PFr6j45HbbaQVWwEzMVsALwiQH48qjNjSXjVlG9DnL7OQT/Kvq2pe3FZLWWj5wTcm7yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771286612; c=relaxed/simple;
	bh=bQTlYD8X07/LwOh+1BrKooFnGyhlWNZtYsXUbS45D0o=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsPAEX6FyY4KlOVuIcjxrxCfDVilFLvZT5hp80sdJrx8oPFexdvyI9rvqnday3bYTrvO/XLgibEggTqaE8AMiA9A0EcJqzUXU8G8vlJXRnStdgHBtwXlrzHi6WdWP5CONTkP1sDXJpCwUvE58QwSwZ3fw69ua36Np8mFn/PvCoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us; spf=pass smtp.mailfrom=n0nb.us; dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b=gLlmDPOH; arc=none smtp.client-ip=72.52.250.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n0nb.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b="gLlmDPOH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZTBto8STIhoO9nD+qb0rkmtV37ro3MFfbSTD1gVzcZY=; b=gLlmDPOH01ftCGZIMdnPKFqGRF
	OufmBpM/FZOzbxW5Ym4u1401i/d4DQOf0PxGU8iqmQIm1rpP7I2pvYZBLD1POvZGpm0N9dz1RkeGM
	N2Q06+DFKx+672QzZnScDGOrbkP+h9pI0LJ+m3ivz+XD2Sud40PiOiw0Hoy87ZK4LwEKTtZWMKObC
	iPkstAZCO7hn96VxO0ndDz0hR2hzHYaeu0kUsV0D3K3wbzitZC4nBI1yYvC5ZTJuSzgohNagO+aTY
	tytRZLTGchKygzZaGTKsTGguK3CqOuf1etutJLaBTCbeBtG+duIggaKfE4wpJ6pzQlppJxJknbX+9
	CNra8S8A==;
Received: from [68.234.117.130] (port=38812 helo=merlin.lan)
	by www11.qth.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <n0nb@n0nb.us>)
	id 1vs8Yr-0000000DRLy-1xUV;
	Mon, 16 Feb 2026 18:03:29 -0600
Received: from nate by merlin.lan with local (Exim 4.96)
	(envelope-from <n0nb@n0nb.us>)
	id 1vs8Yq-008j9v-0o;
	Mon, 16 Feb 2026 18:03:28 -0600
Date: Mon, 16 Feb 2026 18:03:28 -0600
From: Nate Bargmann <n0nb@n0nb.us>
To: debian-hams@lists.debian.org, 
	Hamlib Developers <hamlib-developer@lists.sourceforge.net>, Linux Hams <linux-hams@vger.kernel.org>
Subject: Re: [Hamlib-developer] Hamlib 4.7.0 released
Message-ID: <napfysnrhapfhgprtsg3xrofqaaxq2mukqm25uvosxregn5dun@5j6o4hhyy6ug>
Mail-Followup-To: debian-hams@lists.debian.org, 
	Hamlib Developers <hamlib-developer@lists.sourceforge.net>, Linux Hams <linux-hams@vger.kernel.org>
X-Operating-System: Linux 6.1.0-43-amd64 x86_64
Organization: Amateur Radio!
References: <rv4w6l27edbwjmdw54mo5p37zfrqul7pfivh6qjpx2mxtkuchk@b3lciyhi763b>
 <PR3PR09MB528364A1EA7803D188A5EB33A36CA@PR3PR09MB5283.eurprd09.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtj6376jmve6hgw4"
Content-Disposition: inline
In-Reply-To: <PR3PR09MB528364A1EA7803D188A5EB33A36CA@PR3PR09MB5283.eurprd09.prod.outlook.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - www11.qth.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - n0nb.us
X-Get-Message-Sender-Via: www11.qth.com: authenticated_id: n0nb@n0nb.us
X-Authenticated-Sender: www11.qth.com: n0nb@n0nb.us
X-Source: 
X-Source-Args: 
X-Source-Dir: 


--vtj6376jmve6hgw4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Hamlib-developer] Hamlib 4.7.0 released
MIME-Version: 1.0

* On 2026 16 Feb 11:45 -0600, gm3zza@btinternet.com wrote:
> Built OK on Debian 13 (trixie).
>=20
> Installed OK on W11 together with having to generate the .lib for MSVC
> per the README.
>=20
> Both tested and built into my app.

Thanks for the report, Phil, especially that the recipe for generating
the MSVC .lib file is correct.

73, Nate

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--vtj6376jmve6hgw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCaZOwTwAKCRD7LFEw1VqI
GVm5AJ46p1rRVnSq2nIKW+SemeuoKyk0rgCfaqaQUq1BO76YxMcSlAsXpJvBNOo=
=VJB7
-----END PGP SIGNATURE-----

--vtj6376jmve6hgw4--
