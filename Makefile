#CC=g++
CC=i686-w64-mingw32-g++
CCFLAGS=-O2 -Wall
CFILES=game.cpp gamestate.cpp gui.cpp image.cpp main.cpp panel.cpp player.cpp resources.cpp screen.cpp sector.cpp sound.cpp tutorial.cpp utils.cpp TinyXML/tinyxml.cpp TinyXML/tinyxmlerror.cpp TinyXML/tinyxmlparser.cpp
HFILES=game.h gamestate.h gui.h image.h panel.h player.h resources.h screen.h sector.h sound.h tutorial.h utils.h common.h stdafx.h TinyXML/tinyxml.h
OFILES=game.o gamestate.o gui.o image.o panel.o player.o resources.o screen.o sector.o sound.o tutorial.o utils.o main.o TinyXML/tinyxml.o TinyXML/tinyxmlerror.o TinyXML/tinyxmlparser.o
APP=gigalomania
INC=`sdl2-config --cflags`
#LINKPATH=`sdl2-config --libs` -static -L/usr/X11R6/lib/ -L/usr/lib
LINKPATH=-static -L/mingw32/lib

#LIBS=-lSDL2_image -lSDL2_mixer -lshlwapi
LIBS=-lm -lmingw32 -lSDL2 -lSDL2main -lSDL2_image -lFLAC -lSDL2_mixer -lmodplug -lmikmod -logg -lvorbisfile -lvorbis -lsmpeg2 -lsmpeg -lfluidsynth -luser32 -lgdi32 -lwinmm -limm32 -lole32 -loleaut32 -lshell32 -luuid -lversion -lfreetype -lharfbuzz -lbz2 -lglib-2.0 -lintl -lgraphite2 -lharfbuzz-gobject -lharfbuzz-icu -liconv -ltiff -ljpeg -llzma -lpng16 -lstdc++ -lwebp -lwinpthread -lz -larchive -lwinmm -lgdi32 -ldxguid -lasprintf -lcharset -lcrypto -lcurl -lexpat -lffi -lFLAC++ -lFLAC -lfontconfig -lformw -lfreeglut_static -lgdbm -lgettextlib -lgettextpo -lgif -lgio-2.0 -lglew32 -lglew32mx -lgmodule-2.0 -lgmp -lgmpxx -lgnurx -lgnutls -lgnutlsxx -lgobject-2.0 -lgthread-2.0 -lhistory -lhogweed -lidn -lisl -ljansson  -ljsoncpp -llua  -llzo2  -lmenuw -lmetalink -lminizip -lmpc -lmpfr -lnettle -lnghttp2 -logg -lopenal -lpanelw -lphysfs -lpixman-1 -lreadline -lregex -lrtmp -lssh2 -lssl -lsystre -ltasn1 -ltclstub86 -ltermcap -ltheora -ltheoradec -ltheoraenc -ltkstub86 -ltre -lturbojpeg -lvorbisenc -lwebpdecoder -lwebpdemux -lwebpmux -lole32 -lws2_32 -lshlwapi -mwindows

all: $(APP)

$(APP): $(OFILES) $(HFILES) $(CFILES)
	$(CC) $(OFILES) $(CCFLAGS) $(LINKPATH) $(LIBS) -o $(APP)

.cpp.o:
	$(CC) $(CCFLAGS) -O2 $(INC) -c $< -o $@

# REMEMBER to update debian/dirs if the system directories that we use are changed!!!
install: $(APP)
	mkdir -p $(DESTDIR)/opt/gigalomania # -p so we don't fail if folder already exists
	cp $(APP) $(DESTDIR)/opt/gigalomania
	cp readme.html $(DESTDIR)/opt/gigalomania
	cp -a gfx/ $(DESTDIR)/opt/gigalomania # -a need to copy permissions etc
	cp -a islands/ $(DESTDIR)/opt/gigalomania
	cp -a music/ $(DESTDIR)/opt/gigalomania
	cp -a sound/ $(DESTDIR)/opt/gigalomania
	# needed for DESTDIR option:
	mkdir -p $(DESTDIR)/usr/share/applications
	cp gigalomania.desktop $(DESTDIR)/usr/share/applications/
	#cp gigalomania_fullscreen.desktop $(DESTDIR)/usr/share/applications/
	# needed for DESTDIR option:
	mkdir -p $(DESTDIR)/usr/share/pixmaps
	cp gigalomania64.png $(DESTDIR)/usr/share/pixmaps/
# REMEMBER to update debian/dirs if the system directories that we use are changed!!!

uninstall:
	rm -rf $(DESTDIR)/opt/gigalomania # -f so we don't fail if folder doesn't exist
	rm -f $(DESTDIR)/usr/share/applications/gigalomania.desktop
	#rm -f $(DESTDIR)/usr/share/applications/gigalomania_fullscreen.desktop
	rm -f $(DESTDIR)/usr/share/pixmaps/gigalomania64.png

install_maemo: $(APP)
	mkdir -p $(DESTDIR)/opt/gigalomania # -p so we don't fail if folder already exists
	cp $(APP) $(DESTDIR)/opt/gigalomania
	cp -a gfx/ $(DESTDIR)/opt/gigalomania # -a need to copy permissions etc
	cp -a islands/ $(DESTDIR)/opt/gigalomania
	cp -a music/ $(DESTDIR)/opt/gigalomania
	cp -a sound/ $(DESTDIR)/opt/gigalomania
	mkdir -p $(DESTDIR)/usr/share/applications/hildon/
	cp gigalomania_maemo.desktop $(DESTDIR)/usr/share/applications/hildon/
	mkdir -p $(DESTDIR)/usr/share/pixmaps
	cp gigalomania48.png $(DESTDIR)/usr/share/pixmaps/
	chmod a+x gigalomania_mobile.sh # workaround for permissions not set in zip file!
	mkdir -p $(DESTDIR)/usr/bin/
	cp gigalomania_mobile.sh $(DESTDIR)/usr/bin/gigalomania_mobile.sh

uninstall_maemo:
	rm -rf $(DESTDIR)/opt/gigalomania # -f so we don't fail if folder doesn't exist
	rm -f $(DESTDIR)/usr/share/applications/hildon/gigalomania_maemo.desktop
	rm -f $(DESTDIR)/usr/share/pixmaps/gigalomania48.png
	rm -f $(DESTDIR)/usr/bin/gigalomania_mobile.sh

install_meego: $(APP)
	mkdir -p $(DESTDIR)/opt/gigalomania # -p so we don't fail if folder already exists
	cp $(APP) $(DESTDIR)/opt/gigalomania
	cp -a gfx/ $(DESTDIR)/opt/gigalomania # -a need to copy permissions etc
	cp -a islands/ $(DESTDIR)/opt/gigalomania
	cp -a music/ $(DESTDIR)/opt/gigalomania
	cp -a sound/ $(DESTDIR)/opt/gigalomania
	mkdir -p $(DESTDIR)/usr/share/applications
	cp gigalomania_maemo.desktop $(DESTDIR)/usr/share/applications/
	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/48x48/apps/
	cp gigalomania48.png $(DESTDIR)/usr/share/icons/hicolor/48x48/apps/
	chmod a+x gigalomania_mobile.sh # workaround for permissions not set in zip file!
	mkdir -p $(DESTDIR)/usr/bin/
	cp gigalomania_mobile.sh $(DESTDIR)/usr/bin/gigalomania_mobile.sh

uninstall_meego:
	rm -rf $(DESTDIR)/opt/gigalomania # -f so we don't fail if folder doesn't exist
	rm -f $(DESTDIR)/usr/share/applications/gigalomania_maemo.desktop
	rm -f $(DESTDIR)/usr/share/icons/hicolor/48x48/apps/gigalomania48.png
	rm -f $(DESTDIR)/usr/bin/gigalomania_mobile.sh

clean:
	rm -rf *.o
	rm -f $(APP)
