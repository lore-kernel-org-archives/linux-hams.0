From: Phil <phil@spiderweb.com.au>
Subject: Hamlib question
Date: Mon, 7 Apr 2003 10:56:10 +1000
Sender: linux-hams-owner@localhost
Message-ID: <200304071056.10318.phil@spiderweb.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Hello,

I have attempted to have this question answered through the hamlib list but, 
not being a list member, my question was rejected. I have also tried to 
contact a list member who also has used this list but his e-mail address is 
no longer valid. Anyway, onto the question. 

During the compiling process I get a lot of "given / after" errors, such as 
the following. How might I best correct this?

rigclass.cc:624: default argument given for parameter 2 of `void 
Rig::setMem(int, int = 0)'
../include/hamlib/rigclass.h:122: after previous specification in `void 
Rig::setMem(int, int = 0)'
rigclass.cc:629: default argument given for parameter 1 of `int 
Rig::getMem(int = 0)'
../include/hamlib/rigclass.h:123: after previous specification in `int 
Rig::getMem(int = 0)'
m


-- 
Regards,
Phil
phil@spiderweb.com.au

