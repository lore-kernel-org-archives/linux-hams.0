From: "Riley Williams" <Riley@Williams.Name>
Subject: Re: Uploading to SourceForge (was: Linux radio path mapping software?)
Date: Sat, 24 May 2003 22:25:23 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <BKEGKPICNAKILKJKMHCAEEONDBAA.Riley@Williams.Name>
References: <20030524173759.29849.qmail@web12201.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030524173759.29849.qmail@web12201.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John A. Magliacane" <kd2bd@yahoo.com>
Cc: linux-hams@vger.kernel.org

Hi John.

 > Last I tried (5 months ago), I was unsuccessful in getting CVS to
 > upload files to sourceforge.net.  (I've never used CVS to upload
 > files before.) I'm sure I'm overlooking something simple somewhere...
 > (Yes, CVS and SSH are installed, and work fine downloading files.)
 >
 > So, let's say I have a directory of files on my machine. How do I
 > get them from here to there, CVS-wise?

It's 18 months since I last used CVS so this is all from memory, but
here's the process I remember using:

 1. Create an empty CVS repository on SourceForge. This is the project
    signup stage, and I presume you've done that.

 2. Check out the contents of that repository to your system.

 3. Add all the directories you need to your local copy, along with
    the files therein.

 4. Commit your changes to the SourceForge repository.

It's actually a relatively simple procedure if done that way. Assuming
you're using bash as your login shell, here's a typical session for
username USER connecting to project PROJECT on sourceforge for you,
this being a new project, and the files you wish to see in the project
being stored under directory OLDTREE on your computer, and in the
correct tree structure.

First, set up relevant environment variables, which can be dropped into
your ~/.bashrc file if desired:

     export CVSROOT=:pserver:USER@cvs.PROJECT.sf.net:/cvsroot/PROJECT
     export CVS_RSH=`which ssh`

Next, create a local directory for this project, and make it current:

     mkdir ~/PROJECT
     cd ~/PROJECT

Next, check out the project as it currently stands, checking out ALL
local directories:

     cvs co .

At this point, you have a copy of the current repository ready for making
any desired changes. Next, define a bash function that will make the rest
of this procedure easier:

     function cvs_include() {
          local ITEM HERE=`pwd`
          cd "$1"
          for ITEM in * ; do
               cvs add "${ITEM}"
               if [ -d "${ITEM}" ]; then
                    cvs_include "${ITEM}"
               fi
          done
          cd "${HERE}"
     }

Next, create all the desired directories and files under the new local
tree, then add them all to the CVS repository:

     ( cd OLDTREE ; tar c * ) | tar xv
     cvs_include .

Finally, commit these changes to the SourceForge repository:

     cvs commit -m 'Upload initial tree.'

Best wishes from Riley.
---
 * Nothing as pretty as a smile, nothing as ugly as a frown.

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.483 / Virus Database: 279 - Release Date: 19-May-2003

