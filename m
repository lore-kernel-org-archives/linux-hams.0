From: Stephane Fillod <f8cfe@free.fr>
Subject: [ANN] Hamlib 1.1.4 released
Date: Mon, 28 Apr 2003 20:47:52 +0200
Sender: linux-hams-owner@localhost
Message-ID: <20030428184751.GX29558@charybde.local>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hamlib developers <hamlib-developer@lists.sourceforge.net>
Cc: Linux HAMs <Linux-hams@vger.kernel.org>, sdrwg@arrl.org, GNU Radio mailing list <discuss-gnuradio@gnu.org>


Good news everyone!

Hamlib-1.1.4 has finally been released.

Hamlib provides a unified environment for the development of radio 
and rotator control applications. Release 1.1.4 includes improved 
rotator support, important build fixes for gcc-3.x, *BSD, Mac OS X,
and Cygwin(win32) platforms. Besides improvements and bug fixes, 
some experimental work has been started on SDR, stay tuned. 
 
Check it out at http://hamlib.org ! 
  
New in 1.1.4: 
* new backends: Drake (R8B), GNU Radio (experimental), 
		microtune, and many new rig models 
* new rotator backends: fodtrack, rotorez 
* better doxygenized documentation 
* reworked perl and tcl bindings using swig 
* vfo_t rework 
* gcc-3.x compilance 
   
Note: Kylix binding may not be uptodate. 
    
Download pages are accessible at http://sourceforge.net/projects/hamlib 
i386 rpms and .deb coming soon. DLL and VisualBasic wrapper are planned. 
     
Plan for 1.1.5: 
* add support for the SDR-1000 
* develop further the gnuradio backend 
* complete the port to mingw(win32) environement 
* enter more models of supported backends 
* add Python and Java bindings 
* etc. (any wishes?) 
      
Please, test it out and report to hamlib-developer@lists.sourceforge.net 
Developers are also invited to join the Hamlib team by subscribing to this 
mailing list. 
       
Have fun and let us know! 
        
73's de Stephane - F8CFE / the Hamlib team
