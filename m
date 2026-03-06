Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5855536B042
	for <linux-hams@vger.kernel.org>; Fri,  6 Mar 2026 03:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772766568; cv=pass; b=rFgMWVJaNtPgSmz29AwAcVCvOpZwQmx3esRWDZkBuP9s8S//tLueNeLT0vX5vKQEqKCPJU+Bwb4NclkQkfvXEDmQajUO0u3d8KD9ri3IoFkcQVK/ku/3EwFbMGleP1fs6tdq77U3tv6HHZVvgs27fbzg4Wr8i4tJUO59XfuJ9ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772766568; c=relaxed/simple;
	bh=bviOEAiclB40zHgWtMns3qOTI6tH10B4GOXwr6aNFqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WlR/kc4M8SpO3iOhohqrivnWVDDcqT82nGbAv8No9UH1Qb37Nj8AvwJ5l+A78Yj1U1cwscYkUG8j5znpmw742rfxRLPQIvEDM2lEfjoOXx0Z4z1S0taNqlhynUjpw3COfy7zDV13J3fTlNZF2fi84CF97GJIC/gizLc9cDar5oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=dAwPI33N; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="dAwPI33N"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358ed696623so3630435a91.0
        for <linux-hams@vger.kernel.org>; Thu, 05 Mar 2026 19:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772766565; cv=none;
        d=google.com; s=arc-20240605;
        b=dZJ0iJIfcRIj9lvnfAgvYyLd7p3nX5KmugC/2LbizPtBFOwxgtlcP9MDG44Ae5FbPN
         2f9suwvT9FpA0EJOrRGP9BDv9r/c0vRr5TBHwFAoUY/okwgjIenHnnzwUeP7Zb4UzZL2
         yqRWB1BeXU/ZNiF+rIUsnFc8I95YcAsphzrgFlBw/E6id4DSa/hbhcob42qM1MD1xrlq
         drn5LPwIf+5oIPZ8dYA6HGGVddKOh0WGrmHEJhfgeje/CDiE27IEyfEoWoApRS1PbXcV
         MeNYwj0MMxidrJZwCYj7VdIqaw2Bp5CaZOhnjkBlnb+lDEp+2fZ2UC7X75IcQgySldGf
         z8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a2wyFmqtgQuSSxu/y1lHXpYQVnaUEjD/9HUkzSu97q4=;
        fh=2DeqYm0G3eRPNRWtuTwRZiTLrraebQ95YaYQcEak07o=;
        b=CHkWtewcGg7GWxBN3JA92Ng7oiKTwH9dvYdGPiEhAb9ITpOE5a0GeleyBtPqJos0hs
         JN+mWdbrvJ22ApgIdzsfwHOqypIbp8/jtomZ4VGxaywtyXZQSdqPE77jF/Ufk/dyMPDt
         lkhsinGsH4ajQwOH7JNzna9IMYZpAGVYup2RZVC99pTd2G978fKf2VZsvo3xLKgtglWa
         2hSO1IKHb/SBQkBuD6r8KUas3SGP4IZu9AS5J/elfTqqcwStfmTBFUM0IKKpxc72qrah
         pVLnD4RhyYtaT9h8vAGCs8EBpAWvADI1urXevzX7mBSj8ZCegzW3lWysGfROLwDEYYcD
         zzqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1772766565; x=1773371365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2wyFmqtgQuSSxu/y1lHXpYQVnaUEjD/9HUkzSu97q4=;
        b=dAwPI33NE0I1N7/Ob8GYMBqsbwtzcp+gp2GDnYiH04YPQzdL4RUvdUR0iBjC13xcQv
         aMlFvamolK9EzpBi4IgqFSnNpby7fEcumrjWtlKePL62YAyLDCmP7hU8YhE4e5dTV4im
         bxKYh3oOr1YE19tfvZlpSAD+OmVZB0B+qCCPL7+9ujo1/bE5Vg3GerBiI72kjcw8sVjb
         lkjdL/w3VuY7xlT09hsIXHjJpUJEi/Ru/lQnfTbU8FKYq4PXRFBSV8fwkeEqIgfI8cIW
         ZF0zTRPVDBbS2bScfd71WgeyHuBjROxPuT+4Rc9LFHrrJ3RGMuKypOfKDAdxE+j0N1PI
         Ht5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772766565; x=1773371365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a2wyFmqtgQuSSxu/y1lHXpYQVnaUEjD/9HUkzSu97q4=;
        b=bXJvlv/3ETHCPi9B6m5q0h26Mvd+J0cCGfCI2X2JvJGSFy3EwbR4e9mvAUR5RGAukF
         abcyjLv8KvSjqt77FlvPMO9CSMc35j4/OcPT4oUCuvc1t1bp9Z1/lwYPK1EYHdjjGf5+
         QZbREHP3JRvq6XYYe41f2iD+CAD0injovgU9fGwc4tsXkIPC+wE+NZToUz6y7/tjKN4i
         jFv1tO2DDItHs0mIYL3mRWQ3FoSUAG3QI8mKICCU7cBHd+a7ZggJM+bwTJ5Y+TGh4naO
         8hINO4m23vmAihL/07Di3MkQxEZoLa4g4ZlIzpEQQS6y0fY19MRFqRogD00YoJF0bSxH
         Jrrw==
X-Forwarded-Encrypted: i=1; AJvYcCW7m1v3IvgT+tqmSSyrjyVd2myGJweDuHuzxao9cPK6XLsNRklJhVvhbN23vmJPQCZ1zOLe7vDNhAd6@vger.kernel.org
X-Gm-Message-State: AOJu0YwZXqmlvolrz37IBly3YuYW+MP9ZqWQLBdLNKeeKE/QKuSldmjr
	/iieJxBuRCjz7duv5GI+hkQuwpREB6clRTn/7pLuwBwJX7N2YidY+z20kkoFzjHkcCL5B+zJNC2
	Ee9Hv+IUgOG3AN6COckqMUJByCo3lpW9J6+467ycs
X-Gm-Gg: ATEYQzzxL5BwHSLkqvRyZ6yH/UKwyUGOfStyNTFMG0DKA4a3YsZ7ko9dqNjHHcMQepK
	x472NbgkpIh2h7wQy58vz/tKNIr6MWpmpjbz3zjrYPPkbT0KKqfdY5oDh8IEC0JCqJo4j7frgf8
	eAth/d53dWDNaZW2AfFxuVtLm0yDLjEsImo9S8TAYikHDQtiDYgwthMps2HQIMpnP2cp265N4gK
	ZexVwsN5Zmrw9Rc5tSrqeY3VkafYxmrYFPi2ZmaTEGQL7zGNvyHp/3xGWNx6/oTW0KumIHSo7FB
	ci5QCyo=
X-Received: by 2002:a17:90b:390a:b0:34c:35ce:3c5f with SMTP id
 98e67ed59e1d1-359be28da81mr585228a91.5.1772766564424; Thu, 05 Mar 2026
 19:09:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org> <20260304-iino-u64-v3-2-2257ad83d372@kernel.org>
In-Reply-To: <20260304-iino-u64-v3-2-2257ad83d372@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Mar 2026 22:09:12 -0500
X-Gm-Features: AaiRm51A9fGFpauPslQfX6LBJuSyutri4HG-shh7wAOHtGm4QDzvXC5jtThE_pI
Message-ID: <CAHC9VhQix8opxrX--w-pw5vEAiLaYX=kPhnm4x+dEFEwHiVnfQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] audit: widen ino fields to u64
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, 
	David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, 
	Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, 
	Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, 
	Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, 
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
	John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, 
	Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, Joerg Reuter <jreuter@yaina.de>, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Remi Denis-Courmont <courmisch@gmail.com>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, 
	v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, 
	ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, 
	ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, 
	jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
	linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
	linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, 
	linux-x25@vger.kernel.org, audit@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-sctp@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 10:33=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> inode->i_ino is being widened from unsigned long to u64. The audit
> subsystem uses unsigned long ino in struct fields, function parameters,
> and local variables that store inode numbers from arbitrary filesystems.
> On 32-bit platforms this truncates inode numbers that exceed 32 bits,
> which will cause incorrect audit log entries and broken watch/mark
> comparisons.
>
> Widen all audit ino fields, parameters, and locals to u64, and update
> the inode format string from %lu to %llu to match.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  include/linux/audit.h   |  2 +-
>  kernel/audit.h          | 13 ++++++-------
>  kernel/audit_fsnotify.c |  4 ++--
>  kernel/audit_watch.c    | 12 ++++++------
>  kernel/auditsc.c        |  4 ++--
>  5 files changed, 17 insertions(+), 18 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
