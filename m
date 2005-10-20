From: "liva@katamail.com" <liva@katamail.com>
Subject: Newbie: how to write a program to exchange files with HF modem?
Date: Thu, 20 Oct 2005 12:57:38 +0000
Message-ID: <140.105.16.64.1168608606.1129813058@webmail.katamail.com>
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I'm trying to write in C a linux program to exchange files via hf radio using hal dsp4100 modems, just to learn to do something like that. The modems use the Clover protocol. I don't know how this programs are usually done. In a few words, in my program the sender split the file to be sent in packets and send them to the modem, the receiver collects them from the modem and merge them in one file. The problem is that I'm not able to synchronize the receiver with the sender, so almost always the receiver start to read the data from the modem too soon, reading the old data in the modem buffer instead of the data to come. If I wait too long, the modem buffer becomes full and I loose data. Of course there is some simple way to solve these problems, but I hasn't been able to find it. Thank you for your help,
Marco Liva

________________________________________________________________________
Offro&Cerco: CASA, LAVORO, VACANZE, ELETTRONICA, INCONTRI. Tutti gli 
annunci sono online su Kataweb all'indirizzo http://www.offroecerco.it



