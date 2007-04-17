From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Error compiling aprsd-2.2.6-4 from CVS
Date: Tue, 17 Apr 2007 18:52:47 +0200
Message-ID: <4624FB5F.1030508@ccr.jussieu.fr>
References: <20070313115537.GA10921@linux-mips.org> <20070324.125436.115921208.davem@davemloft.net> <4624D993.1060006@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4624D993.1060006@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-hams@vger.kernel.org

Hi All,

In aprsd directory captured from CVS sourceforge (aprsd-2.2.6-4)
I changed boostrap.sh file permission to a+x and ran the script.
It built configure script and then I was able to run ./configure and ma=
ke.

However I got an error during compile :

if g++ -DHAVE_CONFIG_H -I. -I. -I.. -I../src    -g -O2 -Wall
-march=3Dpentium -fPIC -DPIC -pedantic -pipe -pthread -MT aprsd.o -MD -=
MP
-MF ".deps/aprsd.Tpo" -c -o aprsd.o aprsd.cpp; \
         then mv -f ".deps/aprsd.Tpo" ".deps/aprsd.Po"; else rm -f
".deps/aprsd.Tpo"; exit 1; fi
refcount.hpp:185: error: extra =91;=92
make[2]: *** [aprsd.o] Erreur 1

I removed extra ';' on line 185 of src/refcount.hpp
and also replaced in all concerned files

#include <iostream>
by
#include <sstream>

to remove warnings about deprecated header <iostream>.

Then I ran make and I have still error messages :


if g++ -DHAVE_CONFIG_H -I. -I. -I.. -I../src    -g -O2 -Wall
-march=3Dpentium -fPIC -DPIC -pedantic -pipe -pthread -MT aprsd.o -MD -=
MP
-MF ".deps/aprsd.Tpo" -c -o aprsd.o aprsd.cpp; \
         then mv -f ".deps/aprsd.Tpo" ".deps/aprsd.Po"; else rm -f
".deps/aprsd.Tpo"; exit 1; fi
 aprsd.cpp: In function =91void serverQuit()=92:
 aprsd.cpp:139: error: =91cout=92 was not declared in this scope
 aprsd.cpp: In function =91int serverConfig(const std::string&)=92:
 aprsd.cpp:212: error: =91cout=92 was not declared in this scope
 aprsd.cpp:565: error: =91cerr=92 was not declared in this scope
 aprsd.cpp:569: error: =91cerr=92 was not declared in this scope
 aprsd.cpp: In function =91int daemonInit()=92:
 aprsd.cpp:645: error: =91cout=92 was not declared in this scope
 aprsd.cpp:660: error: =91cout=92 was not declared in this scope
 aprsd.cpp: In function =91int main(int, char**)=92:
 aprsd.cpp:732: error: =91cout=92 was not declared in this scope
 aprsd.cpp:942: error: =91cerr=92 was not declared in this scope
 aprsd.cpp:976: error: =91cerr=92 was not declared in this scope
 aprsd.cpp:980: error: =91cerr=92 was not declared in this scope
 make[2]: *** [aprsd.o] Erreur 1

I would appreciate any help for compiling aprsd.

73 de Bernard, f6bvp

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
