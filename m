From: Peter Barrett <vk6fun@gmail.com>
Subject: ax25-tools 0.0.10rc2 won't compile
Date: Thu, 10 Feb 2011 17:51:59 +0800
Message-ID: <AANLkTi=pyfVjOmvbbuXKtErQD6yYFw=+wAgYGAsnM06u@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=7XM+SaA3eHhHuDa30cG7sUm5C2+YhvscvQhNZg7FD9E=;
        b=RZQTzITegbOklOiIgpmzEG11mj3YAEeixOGdYY3SwHALbuHykVEJGT+VQtj49SiA0O
         DPF5A5ub2uSUtlZPHwqMaTCkUOO8qGHx8d34UVB2elZed29teBvHajOF60v8Vgi44q3E
         3DE9U5guT8qk66NtVI6hbPlgQSTtMCcH6Gy1Q=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

trying to compile with puppeee 504 (gcc 4.2.2, make 3.81) can anyone help me?

here is the show-stopper (actually there is a big page of similar
undefined references):

/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:379:
undefined reference to `Fl_Valuator::step(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:380:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:381:
undefined reference to `Fl_Valuator::value(double)'
collect2: ld returned 1 exit status
make[3]: *** [xfsmmixer] Error 1
make[3]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2/hdlcutil'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2'
make: *** [all] Error 2

73devk6fun
pete
north baandee
