From: ggb112 <gerard.borg@anu.edu.au>
Subject: networking with baycom usb
Date: Wed, 08 Dec 2004 10:47:46 +1100
Message-ID: <41B64122.5050308@anu.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hello all

I am trying to get the baycomusb modem working under RedHats 8 and 9 
with 2.4.18-14
and 2.4.26 kernels.

I would like to find information about how to set up the network 
parameters and  start
communicating with it.

I have downloaded baycomusb-0.10.tar.gz and unpacked. I then did the 
following to install...

cd baycomusb-0.10
./configure
make
make install (as root)

This produced /usr/local/sbin/baycomusb which I have used to check the 
proper operation
of the modem  The modem appears to function correctly according to 
various tests.

I have read the baycomusb man page which says that ax25 and mkiss have 
to be installed in the kernel.
No problem here. I also have baycoimfpga_init.so installed from 
baycomepp-0.10-1.i386.rpm.

What next?  How do I set up network info such as IP address?

The baycomusb.initscript seems not to need ip address information. I 
have launched baycomusbserv
but as  it has no man page I am not sure how to use it. Both baycomusb 
and baycomusbserv seem
to need /etc/ax25/baycomusb.conf but I can see no way to generate it. 
Moreover is the file
bayconusb.conf or baycomusb.xml?

There is a line in baycomusb.initscript which (though commented out) 
wants to do

modprobe baycom_usb

Is baycom_usb.o an important module? The above configure/make/make 
install does not produce it
as it thinks that nothing has  to be done for the kerneldrv subdirectory.
.
Are there any other drivers needed apart from ax25 and mkiss (and of 
course the USB drivers)? I have
prior exerience in running packet over serial port using mkiss.

Thanks for any suggestions

Cheers

Gerard Borg


