rd /S /Q c:\temp\gigalomania\

mkdir c:\temp\gigalomania\

set src="."
set dst="c:\temp\gigalomania"

copy %src%\Release\gigalomania.exe %src%\gigalomania.exe
copy %src%\gigalomania.exe %dst%\gigalomania.exe
copy %src%\readme.html %dst%
copy %src%\gigalomania_debugwindow.bat %dst%
copy %src%\gigalomania_windowed.bat %dst%
copy %src%\gpl.txt %dst%

REM copy %src%\fmod.dll %dst%
REM copy %src%\fmodex.dll %dst%
REM copy %src%\FreeImage.dll %dst%

REM copy %src%\SDL.dll %dst%
copy %src%\SDL2.dll %dst%

REM copy %src%\SDL_image.dll %dst%
copy %src%\SDL2_image.dll %dst%
REM copy %src%\jpeg.dll %dst%
REM copy %src%\libtiff.dll %dst%
REM copy %src%\libpng12.dll %dst%
copy %src%\libjpeg-9.dll %dst%
copy %src%\libpng16-16.dll %dst%
copy %src%\zlib1.dll %dst%

REM copy %src%\SDL_mixer.dll %dst%
copy %src%\SDL2_mixer.dll %dst%
copy %src%\libogg-0.dll %dst%
copy %src%\libvorbis-0.dll %dst%
copy %src%\libvorbisfile-3.dll %dst%

mkdir %dst%\islands\
copy %src%\islands\ %dst%\islands\

mkdir %dst%\gfx
copy %src%\gfx\ %dst%\gfx\

mkdir %dst%\music
copy %src%\music\ %dst%\music\

mkdir %dst%\sound
copy %src%\sound\ %dst%\sound\

REM exit
