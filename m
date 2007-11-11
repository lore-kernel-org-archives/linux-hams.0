From: don <don_reid@comcast.net>
Subject: Re: Soundmedem-.10 file not uncompressing
Date: Sun, 11 Nov 2007 08:49:36 -0800
Message-ID: <20071111164936.GA27687@reid1.localdomain>
References: <000f01c822ce$311842a0$4642a30a@MOTORHOME> <2e19719f0711100023p78762ce7t41abd4cb3fd4cbd7@mail.gmail.com> <fc22d18f0711100039lcb7dfedv6a540f3561a533c7@mail.gmail.com> <000a01c823be$39735fc0$035fa30a@MOTORHOME>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="LQksG6bCIzRHxTLp"
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000a01c823be$39735fc0$035fa30a@MOTORHOME>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
To: Phil <phillor@telstra.com>
Cc: linux-hams@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 11, 2007 at 03:19:42AM +1000, Phil wrote:
> ...
> tar -zxvf soundmodem-0.10.tar.gz failed but tar -zxvf soundmodem-0.7.tar.gz
> uncompressed without a problem, so I thought that the file
> soundmodem-0.10.tar.gz must be faulty in some way. The solution was to 
> first
> gunzip soundmodem-0.10.tar.gz and then pass the result to tar, as was
> suggested.

Maybe you have a corrupted file?

The copy of soundmodem-0.10.tar.gz which I just downloaded from

http://www.baycom.org/~tom/ham/soundmodem/soundmodem-0.10.tar.gz

Is 491112 bytes.  The command "md5sum soundmodem-0.10.tar.gz" returns

6bf9acaf19c55e57628a49bdff79c8f9  soundmodem-0.10.tar.gz

The above tar command works just fine.


Maybe your tar program is damaged?  

I have attached a small test file which you can try to untar.

-- 
Don - W7DMR

--LQksG6bCIzRHxTLp
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="test.tar.gz"
Content-Transfer-Encoding: base64

H4sIAHUyN0cAA+3OMQ6DMBBE0a05hY+wG2xzHkuAhEQSKZiC24OlFKkiUWCa/5pppvh5WLJc
TA/R+7LWBf3dryCmnYXYmvkoahr1IU6vDivWJaePc9K/X39/Y3pO81ajqKo+5aG5OwIAAAAA
AAAAAAAAAAAAcNoOlU/X4QAoAAA=

--LQksG6bCIzRHxTLp--
