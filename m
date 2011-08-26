From: Stephane Fillod <f8cfe@free.fr>
Subject: [ANN] grig 0.8.0 released
Date: Fri, 26 Aug 2011 23:20:48 +0200
Message-ID: <20110826212048.GB4738@charybde.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <hamlib-developer-bounces@lists.sourceforge.net>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=hamlib-developer>
List-Post: <mailto:hamlib-developer@lists.sourceforge.net>
List-Help: <mailto:hamlib-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: hamlib-developer-bounces@lists.sourceforge.net
To: groundstation-developer@lists.sourceforge.net
Cc: linux-hams@vger.kernel.org, Hamlib developers <hamlib-developer@lists.sourceforge.net>

Good News every one!

After almost 5 years, here is coming grig 0.8.0.

The NEWS blurb:

- Frequency entry via keypad (thanks to Alessandro Zummo).
- Arrow LEFT/RIGHT will change the frequency with the smallest step.
  This can be used for tuning using external devices like the Powermate.
* Support for VFO->MEM and MEM->VFO function.
- Support on/off rig functions.
- Added an extra gigahertz digit in lcd display
- Added antenna control
- French l10n (feel free to contribute your language)
- Fixed crash that occurs when mouse is clicked between MHz and kHz digits.
  Reported as Ubuntu bug 517816.
- Requires Gtk+ 2.12 and Hamlib 1.2.8

Download it at: https://sourceforge.net/projects/groundstation/files/Grig/0.8.0/

But hold on, what is grig BTW?  http://groundstation.sourceforge.net/grig/

Alexandru Csete, OZ9AEC, the original designer and developer of grig
is looking for people to take over and maintain the project.
The current release has been made on interim by Nirgal and myself.
We are thinking about bringing all the nice Alex's ideas in a Python
code base, lowering the maintainance. Upon Alex proposal, Grig might
one day join the Hamlib project. Many thanks to Alex for his work so far.

73
-- 
Stephane - F8CFE


------------------------------------------------------------------------------
EMC VNX: the world's simplest storage, starting under $10K
The only unified storage solution that offers unified management 
Up to 160% more powerful than alternatives and 25% more efficient. 
Guaranteed. http://p.sf.net/sfu/emc-vnx-dev2dev
