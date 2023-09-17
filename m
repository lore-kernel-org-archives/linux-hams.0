From: Peter Lafreniere <peter@n8pjl.ca>
Subject: [PATCH 0/3] ax25: Update link for linux-ax25.org
Date: Sun, 17 Sep 2023 15:29:44 +0000
Message-ID: <20230917152938.8231-1-peter@n8pjl.ca>
References: <20230908113907.25053-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1694964602; x=1695223802;
        bh=xCV78BUZ8wWHYIMMcO4tVeNrAYJwIdS9yFfArGxbUqA=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=SlYa5y0afeSTQ5KzBpULSlj2qXsKFgdjTpp1DG0YPGM4HMdCUYVv4dP0OvGEYP5RA
         yohGBk3IXf1bbJbS9t2hPRn83JJYrRT87gPT/NcU/lJJ48SvJ4PTcU8eCwpWs8XgVS
         XAqtGOtHdI6AEgHp2/DIADoUFw9mhE6Kg5hRZtqGB9eOcz+pKDU2DuZM3OC+ob73nI
         ArOJAmIq2vawDVdTXqzJEGL1hTILJWo0+UU2bREmvch4jsKArc5e6TcELRiw7JCJ/F
         mYkJBtz+a3BNI31VIjzPLTqTZf3rwGOPBarfAy7qdj3deHDavwmi+rhLTRy3LhUOE2
         r9JFxlfirtlBw==
In-Reply-To: <20230908113907.25053-1-peter@n8pjl.ca>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Peter Lafreniere <peter@n8pjl.ca>, thomas@osterried.de, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, linux-doc@vger.kernel.org, corbet@lwn.net

http://linux-ax25.org has been down for nearly a year. Its official
replacement is https://linux-ax25.in-berlin.de.

Update all references to the dead link to its replacement.

As the three touched files are in different areas of the tree, this is
being sent with one patch per file.

Peter Lafreniere (3):
  Documentation: netdev: fix dead link in ax25.rst
  MAINTAINERS: Update link for linux-ax25.org
  ax25: Kconfig: Update link for linux-ax25.org

 Documentation/networking/ax25.rst |  4 ++--
 MAINTAINERS                       |  6 +++---
 net/ax25/Kconfig                  | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

--=20
2.42.0


