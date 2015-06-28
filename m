From: Stuart Longland <stuartl@longlandclan.yi.org>
Subject: Re: PTY Improvements for kissattach, kissnetd
Date: Sun, 28 Jun 2015 13:30:12 +1000
Message-ID: <558F6A44.6040604@longlandclan.yi.org>
References: <1435460682-27595-1-git-send-email-me@vk4msl.yi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1435460682-27595-1-git-send-email-me@vk4msl.yi.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On 28/06/15 13:04, me@vk4msl.yi.org wrote:
> This is a re-based patchset for ax25-tools based on commit 
> 18fa7fa6776da35da34a7e148fa2d96be8921e2.  It adds command line
> options to kissattach and kissnet to permit two things:
> 
> - symbolic linking of pseudo TTYs to consistent names for
> referencing in configuration files. - changing ownership/mode of
> pseudo TTYs so that they can be accessed by designated
> users/groups.

As an alternative to applying the patches by hand, I also have the
patches available via Git:
> The following changes since commit
> 18fa7fa6776da35da34a7e148fa2d96be8921e2e:
> 
> axparms: Accept numeric user ID. (2015-06-19 20:42:04 +0200)
> 
> are available in the git repository at:
> 
> git://git.longlandclan.yi.org/for-upstream/ax25/ax25-tools.git
> pty-improvements
> 
> for you to fetch changes up to
> 029a09b26fa1d6335ff9ee99b2d1217e55822ca2:
> 
> kissnetd: Add support for symlinking PTYs (2015-06-28 12:49:39
> +1000)
> 
> ---------------------------------------------------------------- 
> Stuart Longland (2): kissattach: Add support for pty symlinking 
> kissnetd: Add support for symlinking PTYs
> 
> kiss/kissattach.c | 110
> +++++++++++++++++++++++++++++++++++++++++++++++++---- 
> kiss/kissnetd.c   | 177
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
>
> 
2 files changed, 272 insertions(+), 15 deletions(-)

Regards,
- -- 
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
  ...it's backed up on a tape somewhere.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iJ4EARMKAAYFAlWPajgACgkQoCQEvFhlDPnF4AH+KGAhaCsLV0KPVnaiXzzHzA/X
ni2PEtvBAanpfAPUafMXlRsuV7OG3/z0y2zcg6pLUdQdY6s1/q1VYMYltRH4igH9
FhqZfbmUfgwZRc/d7CrMT179uUSxIYra7nRTnUiGw8O5WIJHmbqzEblDCamn0Kz5
ZeCJlK8GRQ4+yu2e0AjOqQ==
=HCt3
-----END PGP SIGNATURE-----
