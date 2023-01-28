echo off
cls
title Domination II
color 07
mode con cols=40 lines=23
setlocal enabledelayedexpansion
set wmax=5
set w1f=11
set w1s=11
set w2f=22
set w2s=22
set w3f=33
set w3s=33
set w4f=44
set w4s=44
set w5f=##
set w5s=@@
set floor=--
set sky=..
set model=n
set nosave=n
if not exist "Data\save.bat" set nosave=y
if "%nosave%"=="y" set score=0
if "%nosave%"=="y" set render=6
if "%nosave%"=="y" echo set score=%score% >"Data\save.bat"
if "%nosave%"=="y" echo set render=%render% >>"Data\save.bat"
if exist "Data\save.bat" call "Data\save.bat"
if exist "Data\save.bat" set /a score-=1
if exist "Data\save.bat" set /a score+=1
if exist "Data\save.bat" set /a render-=1
if exist "Data\save.bat" set /a render+=1
goto menu
:menu
if exist "Y:\" net use Y: /delete
cls
set input=0
echo Domination II Menu
echo -------------------
echo 1 = Game Options
echo 2 = Map Builder
echo 3 = Controls
echo 4 = Exit
set /p input=INPUT:
if "%input%"=="1" goto gameoptions
if "%input%"=="2" goto menub
if "%input%"=="3" goto controls
if "%input%"=="4" exit
goto menu
:gameoptions
cls
set input=0
echo Game Options
echo ------------------------
echo %username% [%score%]
echo ------------------------
echo 1 = Create Game
echo 2 = Join Game
echo 3 = Settings
echo 4 = Back
set /p input=INPUT:
if "%input%"=="1" goto creategame
if "%input%"=="2" goto connect
if "%input%"=="3" goto renderdistanceset
if "%input%"=="4" goto menu
goto gameoptions
:renderdistanceset
echo set score=%score% >"Data\save.bat"
echo set render=%render% >>"Data\save.bat"
if %render% gtr 7 set render=7
if %render% lss 5 set render=5
if "%render%"=="7" set levels=High
if "%render%"=="6" set levels=Medium
if "%render%"=="5" set levels=Low
cls
set input=0
echo Domination Settings
echo ---------------------------
echo Render Distance: %render%
echo Overall Quality: %levels%
echo ---------------------------
echo 1 = Increase
echo 2 = Decrease
echo 3 = Back
set /p input=INPUT:
if "%input%"=="1" set /a render+=1
if "%input%"=="2" set /a render-=1
if "%input%"=="3" goto gameoptions
goto renderdistanceset
:menub
cls
set input=0
echo Domination Map Builder
echo -----------------------
echo 1 = Create Map
echo 2 = Delete Map
echo 3 = Back
set /p input=INPUT:
if "%input%"=="1" goto startsetb
if "%input%"=="2" goto removeselectb
if "%input%"=="3" goto menu
goto menub
:removeselectb
cls
set select=0
if not exist "Maps" goto nomapb
if not exist "Maps\map1.bat" if not exist "Maps\map2.bat" if not exist "Maps\map3.bat" if not exist "Maps\map4.bat" if not exist "Maps\map5.bat" if not exist "Maps\map6.bat" if not exist "Maps\map7.bat" if not exist "Maps\map8.bat" if not exist "Maps\map9.bat" rd "Maps"&goto nomapb
echo Select A Map
echo ---------------------
if exist "Maps\map1.bat" call "Maps\map1.bat"
if exist "Maps\map1.bat" echo 1 = %map%
if exist "Maps\map2.bat" call "Maps\map2.bat"
if exist "Maps\map2.bat" echo 2 = %map%
if exist "Maps\map3.bat" call "Maps\map3.bat"
if exist "Maps\map3.bat" echo 3 = %map%
if exist "Maps\map4.bat" call "Maps\map4.bat"
if exist "Maps\map4.bat" echo 4 = %map%
if exist "Maps\map5.bat" call "Maps\map5.bat"
if exist "Maps\map5.bat" echo 5 = %map%
if exist "Maps\map6.bat" call "Maps\map6.bat"
if exist "Maps\map6.bat" echo 6 = %map%
if exist "Maps\map7.bat" call "Maps\map7.bat"
if exist "Maps\map7.bat" echo 7 = %map%
if exist "Maps\map8.bat" call "Maps\map8.bat"
if exist "Maps\map8.bat" echo 8 = %map%
if exist "Maps\map9.bat" call "Maps\map9.bat"
if exist "Maps\map9.bat" echo 9 = %map%
echo ---------------------
echo 0 = Back
set /p select=INPUT:
if "%select%"=="0" goto menub
if exist "Maps\map%select%.bat" del "Maps\map%select%.bat"&rd "Maps"&goto deletedb
goto removeselectb
:deletedb
cls
if not exist "Maps\map%select%.bat" echo Map Has Been Deleted!
if not exist "Maps\map%select%.bat" echo ---------------------
if exist "Maps\map%select%.bat" echo Map Failed To Be Deleted!
if exist "Maps\map%select%.bat" echo -------------------------
timeout /t 3 >nul
goto menub
:startsetb
cls
echo Creating Map...
echo ---------------
set build=1
set cx=1
set cy=1
set bx=0
set by=1
goto startb
:startb
set /a bx+=1
set x%bx%x%by%=.
if "%bx%"=="20" set /a by+=1
if "%bx%"=="20" set bx=0
if "%by%"=="13" goto mainb
goto startb
:mainb
cls
set x%cx%x%cy%=@
echo %x1x1%%x2x1%%x3x1%%x4x1%%x5x1%%x6x1%%x7x1%%x8x1%%x9x1%%x10x1%%x11x1%%x12x1%%x13x1%%x14x1%%x15x1%%x16x1%%x17x1%%x18x1%%x19x1%%x20x1%
echo %x1x2%%x2x2%%x3x2%%x4x2%%x5x2%%x6x2%%x7x2%%x8x2%%x9x2%%x10x2%%x11x2%%x12x2%%x13x2%%x14x2%%x15x2%%x16x2%%x17x2%%x18x2%%x19x2%%x20x2%
echo %x1x3%%x2x3%%x3x3%%x4x3%%x5x3%%x6x3%%x7x3%%x8x3%%x9x3%%x10x3%%x11x3%%x12x3%%x13x3%%x14x3%%x15x3%%x16x3%%x17x3%%x18x3%%x19x3%%x20x3%
echo %x1x4%%x2x4%%x3x4%%x4x4%%x5x4%%x6x4%%x7x4%%x8x4%%x9x4%%x10x4%%x11x4%%x12x4%%x13x4%%x14x4%%x15x4%%x16x4%%x17x4%%x18x4%%x19x4%%x20x4%
echo %x1x5%%x2x5%%x3x5%%x4x5%%x5x5%%x6x5%%x7x5%%x8x5%%x9x5%%x10x5%%x11x5%%x12x5%%x13x5%%x14x5%%x15x5%%x16x5%%x17x5%%x18x5%%x19x5%%x20x5%
echo %x1x6%%x2x6%%x3x6%%x4x6%%x5x6%%x6x6%%x7x6%%x8x6%%x9x6%%x10x6%%x11x6%%x12x6%%x13x6%%x14x6%%x15x6%%x16x6%%x17x6%%x18x6%%x19x6%%x20x6%
echo %x1x7%%x2x7%%x3x7%%x4x7%%x5x7%%x6x7%%x7x7%%x8x7%%x9x7%%x10x7%%x11x7%%x12x7%%x13x7%%x14x7%%x15x7%%x16x7%%x17x7%%x18x7%%x19x7%%x20x7%
echo %x1x8%%x2x8%%x3x8%%x4x8%%x5x8%%x6x8%%x7x8%%x8x8%%x9x8%%x10x8%%x11x8%%x12x8%%x13x8%%x14x8%%x15x8%%x16x8%%x17x8%%x18x8%%x19x8%%x20x8%
echo %x1x9%%x2x9%%x3x9%%x4x9%%x5x9%%x6x9%%x7x9%%x8x9%%x9x9%%x10x9%%x11x9%%x12x9%%x13x9%%x14x9%%x15x9%%x16x9%%x17x9%%x18x9%%x19x9%%x20x9%
echo %x1x10%%x2x10%%x3x10%%x4x10%%x5x10%%x6x10%%x7x10%%x8x10%%x9x10%%x10x10%%x11x10%%x12x10%%x13x10%%x14x10%%x15x10%%x16x10%%x17x10%%x18x10%%x19x10%%x20x10%
echo %x1x11%%x2x11%%x3x11%%x4x11%%x5x11%%x6x11%%x7x11%%x8x11%%x9x11%%x10x11%%x11x11%%x12x11%%x13x11%%x14x11%%x15x11%%x16x11%%x17x11%%x18x11%%x19x11%%x20x11%
echo %x1x12%%x2x12%%x3x12%%x4x12%%x5x12%%x6x12%%x7x12%%x8x12%%x9x12%%x10x12%%x11x12%%x12x12%%x13x12%%x14x12%%x15x12%%x16x12%%x17x12%%x18x12%%x19x12%%x20x12%
echo ----------------------
if "%build%"=="1" echo Build: No
if "%build%"=="2" echo Build: Yes
echo T = Toggle Build
echo X = Save And Exit
echo W,S,A,D = Move
choice /c:wsadtx /n /m ""
if "%errorlevel%"=="1" goto upb
if "%errorlevel%"=="2" goto downb
if "%errorlevel%"=="3" goto leftb
if "%errorlevel%"=="4" goto rightb
if "%errorlevel%"=="5" goto toggleb
if "%errorlevel%"=="6" goto saveb
goto mainb
:toggleb
set /a build+=1
if "%build%"=="3" set build=1
goto mainb
:upb
if "%build%"=="1" set x%cx%x%cy%=.
if "%build%"=="2" set x%cx%x%cy%=#
set /a cy-=1
if %cy% lss 1 set cy=1
goto mainb
:downb
if "%build%"=="1" set x%cx%x%cy%=.
if "%build%"=="2" set x%cx%x%cy%=#
set /a cy+=1
if %cy% gtr 12 set cy=12
goto mainb
:leftb
if "%build%"=="1" set x%cx%x%cy%=.
if "%build%"=="2" set x%cx%x%cy%=#
set /a cx-=1
if %cx% lss 1 set cx=1
goto mainb
:rightb
if "%build%"=="1" set x%cx%x%cy%=.
if "%build%"=="2" set x%cx%x%cy%=#
set /a cx+=1
if %cx% gtr 20 set cx=20
goto mainb
:saveb
cls
set map=Map
if not exist "Maps" md "Maps"
echo Save Map As:
echo -------------
set /p map=Map Name:
cls
echo Saving Map...
echo -------------
set find=0
goto findmapb
:findmapb
if "%find%"=="9" goto toomanyb
set /a find+=1
if exist "Maps\map%find%.bat" goto findmapb
goto saveallb
:nomapb
cls
echo You Have No Maps!
echo -----------------
timeout /t 3 >nul
goto menub
:toomanyb
cls
echo Too Many Maps!
echo --------------
timeout /t 3 >nul
goto menub
:saveallb
echo set map=%map%>"Maps\map%find%.bat"
set x%cx%x%cy%=.
set sx=0
set sy=1
goto writeb
:writeb
set /a sx+=1
set zone=!x%sx%x%sy%!
if "%zone%"=="." set zone=n
if "%zone%"=="#" set zone=5
echo set m%sx%m%sy%=!zone!>>"Maps\map%find%.bat"
if "%sx%"=="20" set /a sy+=1
if "%sx%"=="20" set sx=0
if "%sy%"=="13" del "temp.bat"
if "%sy%"=="13" goto doneb
goto writeb
:doneb
cls
if exist "Maps\map%find%.bat" echo Map Has Been Saved!
if exist "Maps\map%find%.bat" echo -------------------
if not exist "Maps\map%find%.bat" echo Map Failed To Save!
if not exist "Maps\map%find%.bat" echo -------------------
timeout /t 3 >nul
goto menub
:controls
cls
set input=0
echo Controls:
echo -------------------------
echo Move: 'W','S','A','D'
echo Turn: 'Q','E'
echo Fire: 'F'
echo View: 'V'
echo Exit: 'X'
echo -------------------------
echo 1 = Back
set /p input=INPUT:
if "%input%"=="1" goto menu
goto controls
:connect
cls
set ip=0
set name=none
echo Connect To Game
echo ----------------------
set /p ip=Host IP Address:
if exist "Y:\" net use Y: /delete
cls
echo Connecting...
echo -------------
net use Y: "\\%ip%\Users\Public"
if not exist "Y:\" goto noconnect
set game=Y:
goto setupgame
:setupgame
set p1x=0
set p1y=0
set p2x=0
set p2y=0
set p3x=0
set p3y=0
set p4x=0
set p4y=0
if exist "%game%\Domination II Game\map.bat" if exist "%game%\Domination II Game\players.bat" if not exist "%game%\Domination II Game\start.dat" goto connecting
if exist "%game%\Domination II Game\start.dat" goto startedgame
goto nogame
:nogame
cls
echo Game Wasn't Ready To Connect!
echo -----------------------------
timeout /t 3 >nul
goto menu
:maxgame
cls
echo That Game Lobby Is Full!
echo ------------------------
timeout /t 3 >nul
goto menu
:startedgame
cls
echo That Game Already Started!
echo --------------------------
timeout /t 3 >nul
goto menu
:creategame
cls
echo Creating Game...
echo ----------------
set p1x=0
set p1y=0
set p2x=0
set p2y=0
set p3x=0
set p3y=0
set p4x=0
set p4y=0
set game=%public%
if exist "%game%\Domination II Game" goto openupgame
md "%game%\Domination II Game"&goto setmap
goto create
:openupgame
del "%game%\Domination II Game\p1.bat"
del "%game%\Domination II Game\p1d.bat"
del "%game%\Domination II Game\p1dead.dat"
del "%game%\Domination II Game\p2.bat"
del "%game%\Domination II Game\p2d.bat"
del "%game%\Domination II Game\p2dead.dat"
del "%game%\Domination II Game\p3.bat"
del "%game%\Domination II Game\p3d.bat"
del "%game%\Domination II Game\p3dead.dat"
del "%game%\Domination II Game\p4.bat"
del "%game%\Domination II Game\p4d.bat"
del "%game%\Domination II Game\p4dead.dat"
del "%game%\Domination II Game\players.bat"
del "%game%\Domination II Game\lobby.dat"
del "%game%\Domination II Game\start.dat"
del "%game%\Domination II Game\map.bat"
rd "%game%\Domination II Game"
goto creategame
:connecting
call "%game%\Domination II Game\players.bat"
set /a players-=1
set /a players+=1
if %players% lss 4 goto join
goto maxgame
:noconnect
cls
echo Failed To Connect
echo -----------------
timeout 3 >nul
goto menu
:create
set host=y
set player=1
echo set players=1 >"%game%\Domination II Game\players.bat"
echo 1: %username% [%score%]>"%game%\Domination II Game\lobby.dat"
goto setstart
:join
cls
echo Joining Game...
echo ---------------
set host=n
set /a update=%players%+1
set player=%update%
echo set players=%update% >"%game%\Domination II Game\players.bat"
echo %update%: %username% [%score%]>>"%game%\Domination II Game\lobby.dat"
goto setstart
:setmap
cls
set input=0
if not exist "Maps" goto nomap
if not exist "Maps\map1.bat" if not exist "Maps\map2.bat" if not exist "Maps\map3.bat" if not exist "Maps\map4.bat" if not exist "Maps\map5.bat" if not exist "Maps\map6.bat" if not exist "Maps\map7.bat" if not exist "Maps\map8.bat" if not exist "Maps\map9.bat" rd "Maps"&goto nomap
echo Select A Map
echo -----------------------
if exist "Maps\map1.bat" call "Maps\map1.bat"
if exist "Maps\map1.bat" echo 1 = %map%
if exist "Maps\map2.bat" call "Maps\map2.bat"
if exist "Maps\map2.bat" echo 2 = %map%
if exist "Maps\map3.bat" call "Maps\map3.bat"
if exist "Maps\map3.bat" echo 3 = %map%
if exist "Maps\map4.bat" call "Maps\map4.bat"
if exist "Maps\map4.bat" echo 4 = %map%
if exist "Maps\map5.bat" call "Maps\map5.bat"
if exist "Maps\map5.bat" echo 5 = %map%
if exist "Maps\map6.bat" call "Maps\map6.bat"
if exist "Maps\map6.bat" echo 6 = %map%
if exist "Maps\map7.bat" call "Maps\map7.bat"
if exist "Maps\map7.bat" echo 7 = %map%
if exist "Maps\map8.bat" call "Maps\map8.bat"
if exist "Maps\map8.bat" echo 8 = %map%
if exist "Maps\map9.bat" call "Maps\map9.bat"
if exist "Maps\map9.bat" echo 9 = %map%
echo -----------------------
set /p input=INPUT:
if exist "Maps\map%input%.bat" copy "Maps\map%input%.bat" "%game%\Domination II Game\map.bat"&goto create
goto setmap
:nomap
cls
echo You Do Not Have Any Maps
echo ------------------------
timeout /t 3 >nul
goto closegame
:setstart
call "Y:\Domination II Game\map.bat"
set /a turn=%random%*4/32768+1
set life=100
if exist "%game%\Domination II Game\p1.bat" call "%game%\Domination II Game\p1.bat"
if exist "%game%\Domination II Game\p2.bat" call "%game%\Domination II Game\p2.bat"
if exist "%game%\Domination II Game\p3.bat" call "%game%\Domination II Game\p3.bat"
if exist "%game%\Domination II Game\p4.bat" call "%game%\Domination II Game\p4.bat"
if exist "%game%\Domination II Game\p1.bat" set /a p1x-=1
if exist "%game%\Domination II Game\p1.bat" set /a p1x+=1
if exist "%game%\Domination II Game\p1.bat" set /a p1y-=1
if exist "%game%\Domination II Game\p1.bat" set /a p1y+=1
if exist "%game%\Domination II Game\p2.bat" set /a p2x-=1
if exist "%game%\Domination II Game\p2.bat" set /a p2x+=1
if exist "%game%\Domination II Game\p2.bat" set /a p2y-=1
if exist "%game%\Domination II Game\p2.bat" set /a p2y+=1
if exist "%game%\Domination II Game\p3.bat" set /a p3x-=1
if exist "%game%\Domination II Game\p3.bat" set /a p3x+=1
if exist "%game%\Domination II Game\p3.bat" set /a p3y-=1
if exist "%game%\Domination II Game\p3.bat" set /a p3y+=1
if exist "%game%\Domination II Game\p4.bat" set /a p4x-=1
if exist "%game%\Domination II Game\p4.bat" set /a p4x+=1
if exist "%game%\Domination II Game\p4.bat" set /a p4y-=1
if exist "%game%\Domination II Game\p4.bat" set /a p4y+=1
if exist "%game%\Domination II Game\p1.bat" set m%p1x%m%p1y%=1
if exist "%game%\Domination II Game\p2.bat" set m%p1x%m%p1y%=2
if exist "%game%\Domination II Game\p3.bat" set m%p1x%m%p1y%=3
if exist "%game%\Domination II Game\p4.bat" set m%p1x%m%p1y%=4
set /a cx=%random%*20/32768+1
set /a cy=%random%*12/32768+1
if not "!m%cx%m%cy%!"=="n" goto setstart
echo set p%player%x=%cx% >"%game%\Domination II Game\p%player%.bat"
echo set p%player%y=%cy% >>"%game%\Domination II Game\p%player%.bat"
goto lobby
:lobby
cls
if "%host%"=="n" if not exist "Y:\" goto nogame
if not exist "%game%\Domination II Game" goto closedgame
if exist "%game%\Domination II Game\start.dat" goto starting
set input=0
echo Domination II Lobby
echo ---------------------------
type "%game%\Domination II Game\lobby.dat"
echo Map: %map%
echo ---------------------------
if "%host%"=="n" timeout /t 2 >nul
if "%host%"=="n" goto lobby
if "%host%"=="y" echo 1 = Start Game
if "%host%"=="y" echo 2 = Refresh
if "%host%"=="y" echo 3 = Close
if "%host%"=="y" set /p input=INPUT:
if "%host%"=="y" if "%input%"=="1" goto startgame
if "%host%"=="y" if "%input%"=="2" goto lobby
if "%host%"=="y" if "%input%"=="3" goto closegame
goto lobby
:closedgame
cls
echo Game Has Closed
echo ---------------
timeout /t 3 >nul
goto menu
:startgame
call "%game%\Domination II Game\players.bat"
set /a players-=1
set /a players+=1
if "%players%"=="1" goto moreplayer
echo.>"%game%\Domination II Game\start.dat"
goto lobby
:moreplayer
cls
echo You Need Atleast 2 Players To Start
echo -----------------------------------
timeout /t 3 >nul
goto lobby
:starting
cls
echo Game Is Starting...
echo -------------------
call "%game%\Domination II Game\players.bat"
set /a players-=1
set /a players+=1
goto render
:render
call "%game%\Domination II Game\map.bat"
set fire=n
set x=0
set y=1
echo set p%player%x=%cx% >"%game%\Domination II Game\p%player%.bat"
echo set p%player%y=%cy% >>"%game%\Domination II Game\p%player%.bat"
if exist "%game%\Domination II Game\p1.bat" call "%game%\Domination II Game\p1.bat"
if exist "%game%\Domination II Game\p2.bat" call "%game%\Domination II Game\p2.bat"
if exist "%game%\Domination II Game\p3.bat" call "%game%\Domination II Game\p3.bat"
if exist "%game%\Domination II Game\p4.bat" call "%game%\Domination II Game\p4.bat"
if exist "%game%\Domination II Game\p1.bat" set /a p1x-=1
if exist "%game%\Domination II Game\p1.bat" set /a p1x+=1
if exist "%game%\Domination II Game\p1.bat" set /a p1y-=1
if exist "%game%\Domination II Game\p1.bat" set /a p1y+=1
if exist "%game%\Domination II Game\p2.bat" set /a p2x-=1
if exist "%game%\Domination II Game\p2.bat" set /a p2x+=1
if exist "%game%\Domination II Game\p2.bat" set /a p2y-=1
if exist "%game%\Domination II Game\p2.bat" set /a p2y+=1
if exist "%game%\Domination II Game\p3.bat" set /a p3x-=1
if exist "%game%\Domination II Game\p3.bat" set /a p3x+=1
if exist "%game%\Domination II Game\p3.bat" set /a p3y-=1
if exist "%game%\Domination II Game\p3.bat" set /a p3y+=1
if exist "%game%\Domination II Game\p4.bat" set /a p4x-=1
if exist "%game%\Domination II Game\p4.bat" set /a p4x+=1
if exist "%game%\Domination II Game\p4.bat" set /a p4y-=1
if exist "%game%\Domination II Game\p4.bat" set /a p4y+=1
if not exist "%game%\Domination II Game\p1dead.dat" if exist "%game%\Domination II Game\p1.bat" set m%p1x%m%p1y%=1
if not exist "%game%\Domination II Game\p2dead.dat" if exist "%game%\Domination II Game\p2.bat" set m%p2x%m%p2y%=2
if not exist "%game%\Domination II Game\p3dead.dat" if exist "%game%\Domination II Game\p3.bat" set m%p3x%m%p3y%=3
if not exist "%game%\Domination II Game\p4dead.dat" if exist "%game%\Domination II Game\p4.bat" set m%p4x%m%p4y%=4
set m%cx%m%cy%=n
goto setgun
:setgun
set model=Data\model1
:draw
if "%host%"=="n" if not exist "Y:\" goto nogame
if not exist "%game%\Domination II Game" goto closedgame
call "Data\Shade_Engine.bat"
set /a life+=1
if %life% gtr 100 set life=100
if exist "%game%\Domination II Game\p%player%d.bat" call "%game%\Domination II Game\p%player%d.bat"
if exist "%game%\Domination II Game\p%player%d.bat" del "%game%\Domination II Game\p%player%d.bat"
if %life% lss 1 goto dead
if "%turn%"=="1" echo Compass: North
if "%turn%"=="2" echo Compass: East
if "%turn%"=="3" echo Compass: South
if "%turn%"=="4" echo Compass: West
echo Health.: %life%
goto main
:main
if "%fire%"=="y" goto bullet
if "%players%"=="1" goto win
if "%players%"=="2" if "%player%"=="1" if exist "%game%\Domination II Game\p2dead.dat" goto win
if "%players%"=="2" if "%player%"=="2" if exist "%game%\Domination II Game\p1dead.dat" goto win
if "%players%"=="3" if "%player%"=="1" if exist "%game%\Domination II Game\p2dead.dat" if exist "%game%\Domination II Game\p3dead.dat" goto win
if "%players%"=="3" if "%player%"=="2" if exist "%game%\Domination II Game\p1dead.dat" if exist "%game%\Domination II Game\p3dead.dat" goto win
if "%players%"=="3" if "%player%"=="3" if exist "%game%\Domination II Game\p1dead.dat" if exist "%game%\Domination II Game\p2dead.dat" goto win
if "%players%"=="4" if "%player%"=="1" if exist "%game%\Domination II Game\p2dead.dat" if exist "%game%\Domination II Game\p3dead.dat" if exist "%game%\Domination II Game\p4dead.dat" goto win
if "%players%"=="4" if "%player%"=="2" if exist "%game%\Domination II Game\p1dead.dat" if exist "%game%\Domination II Game\p3dead.dat" if exist "%game%\Domination II Game\p4dead.dat" goto win
if "%players%"=="4" if "%player%"=="3" if exist "%game%\Domination II Game\p1dead.dat" if exist "%game%\Domination II Game\p2dead.dat" if exist "%game%\Domination II Game\p4dead.dat" goto win
if "%players%"=="4" if "%player%"=="4" if exist "%game%\Domination II Game\p1dead.dat" if exist "%game%\Domination II Game\p2dead.dat" if exist "%game%\Domination II Game\p3dead.dat" goto win
choice /c:wsadqefvxt /n /m "" /d t /t 3
if "%errorlevel%"=="1" goto up
if "%errorlevel%"=="2" goto down
if "%errorlevel%"=="3" goto left
if "%errorlevel%"=="4" goto right
if "%errorlevel%"=="5" goto tleft
if "%errorlevel%"=="6" goto tright
if "%errorlevel%"=="7" goto fire
if "%errorlevel%"=="8" goto view
if "%errorlevel%"=="9" goto dead
goto render
:fire
set fire=y
set range=0
set model=Data\model2
set bx=%cx%
set by=%cy%
goto draw
:bullet
if "%range%"=="6" goto render
set /a range+=1
if "%turn%"=="1" set /a by-=1
if "%turn%"=="2" set /a bx+=1
if "%turn%"=="3" set /a by+=1
if "%turn%"=="4" set /a bx-=1
set zone=!m%bx%m%by%!
if "%zone%"=="5" goto render
if "%zone%"=="1" echo set /a life-=20>>"%game%\Domination II Game\p1d.bat"&goto render
if "%zone%"=="2" echo set /a life-=20>>"%game%\Domination II Game\p2d.bat"&goto render
if "%zone%"=="3" echo set /a life-=20>>"%game%\Domination II Game\p3d.bat"&goto render
if "%zone%"=="4" echo set /a life-=20>>"%game%\Domination II Game\p4d.bat"&goto render
goto bullet
:up
if "%turn%"=="1" set /a cy-=1
if "%turn%"=="2" set /a cx+=1
if "%turn%"=="3" set /a cy+=1
if "%turn%"=="4" set /a cx-=1
set zone=!m%cx%m%cy%!
if not "%zone%"=="n" if "%turn%"=="1" set /a cy+=1
if not "%zone%"=="n" if "%turn%"=="2" set /a cx-=1
if not "%zone%"=="n" if "%turn%"=="3" set /a cy-=1
if not "%zone%"=="n" if "%turn%"=="4" set /a cx+=1
goto render
:down
if "%turn%"=="1" set /a cy+=1
if "%turn%"=="2" set /a cx-=1
if "%turn%"=="3" set /a cy-=1
if "%turn%"=="4" set /a cx+=1
set zone=!m%cx%m%cy%!
if not "%zone%"=="n" if "%turn%"=="1" set /a cy-=1
if not "%zone%"=="n" if "%turn%"=="2" set /a cx+=1
if not "%zone%"=="n" if "%turn%"=="3" set /a cy+=1
if not "%zone%"=="n" if "%turn%"=="4" set /a cx-=1
goto render
:left
if "%turn%"=="1" set /a cx-=1
if "%turn%"=="2" set /a cy-=1
if "%turn%"=="3" set /a cx+=1
if "%turn%"=="4" set /a cy+=1
set zone=!m%cx%m%cy%!
if not "%zone%"=="n" if "%turn%"=="1" set /a cx+=1
if not "%zone%"=="n" if "%turn%"=="2" set /a cy+=1
if not "%zone%"=="n" if "%turn%"=="3" set /a cx-=1
if not "%zone%"=="n" if "%turn%"=="4" set /a cy-=1
goto render
:right
if "%turn%"=="1" set /a cx+=1
if "%turn%"=="2" set /a cy+=1
if "%turn%"=="3" set /a cx-=1
if "%turn%"=="4" set /a cy-=1
set zone=!m%cx%m%cy%!
if not "%zone%"=="n" if "%turn%"=="1" set /a cx-=1
if not "%zone%"=="n" if "%turn%"=="2" set /a cy-=1
if not "%zone%"=="n" if "%turn%"=="3" set /a cx+=1
if not "%zone%"=="n" if "%turn%"=="4" set /a cy+=1
goto render
:tleft
set /a turn-=1
if "%turn%"=="0" set turn=4
goto render
:tright
set /a turn+=1
if "%turn%"=="5" set turn=1
goto render
:win
set /a score+=%players%-1
echo set score=%score% >"Data\save.bat"
echo set render=%render% >>"Data\save.bat"
cls
echo You Are The Dominator
echo ---------------------
timeout /t 5 >nul
goto closegame
:view
cls
set input=0
echo Domination II Game
echo ---------------------------
type "%game%\Domination II Game\lobby.dat"
echo Map: %map%
echo ---------------------------
echo 1 = Back
set /p input=INPUT:
if "%input%"=="1" goto render
goto view
:dead
if "%players%"=="1" goto win
if "%players%"=="2" if "%player%"=="1" if exist "%game%\Domination II Game\p2dead.dat" goto win
if "%players%"=="2" if "%player%"=="2" if exist "%game%\Domination II Game\p1dead.dat" goto win
if "%players%"=="3" if "%player%"=="1" if exist "%game%\Domination II Game\p2dead.dat" if exist "%game%\Domination II Game\p3dead.dat" goto win
if "%players%"=="3" if "%player%"=="2" if exist "%game%\Domination II Game\p1dead.dat" if exist "%game%\Domination II Game\p3dead.dat" goto win
if "%players%"=="3" if "%player%"=="3" if exist "%game%\Domination II Game\p1dead.dat" if exist "%game%\Domination II Game\p2dead.dat" goto win
if "%players%"=="4" if "%player%"=="1" if exist "%game%\Domination II Game\p2dead.dat" if exist "%game%\Domination II Game\p3dead.dat" if exist "%game%\Domination II Game\p4dead.dat" goto win
if "%players%"=="4" if "%player%"=="2" if exist "%game%\Domination II Game\p1dead.dat" if exist "%game%\Domination II Game\p3dead.dat" if exist "%game%\Domination II Game\p4dead.dat" goto win
if "%players%"=="4" if "%player%"=="3" if exist "%game%\Domination II Game\p1dead.dat" if exist "%game%\Domination II Game\p2dead.dat" if exist "%game%\Domination II Game\p4dead.dat" goto win
if "%players%"=="4" if "%player%"=="4" if exist "%game%\Domination II Game\p1dead.dat" if exist "%game%\Domination II Game\p2dead.dat" if exist "%game%\Domination II Game\p3dead.dat" goto win
echo.>"%game%\Domination II Game\p%player%dead.dat"
set /a score-=1
echo set score=%score% >"Data\save.bat"
echo set render=%render% >>"Data\save.bat"
cls
echo You Have Been Dominated
echo -----------------------
timeout /t 5 >nul
goto gameoptions
:closegame
del "%game%\Domination II Game\p1.bat"
del "%game%\Domination II Game\p1d.bat"
del "%game%\Domination II Game\p1dead.dat"
del "%game%\Domination II Game\p2.bat"
del "%game%\Domination II Game\p2d.bat"
del "%game%\Domination II Game\p2dead.dat"
del "%game%\Domination II Game\p3.bat"
del "%game%\Domination II Game\p3d.bat"
del "%game%\Domination II Game\p3dead.dat"
del "%game%\Domination II Game\p4.bat"
del "%game%\Domination II Game\p4d.bat"
del "%game%\Domination II Game\p4dead.dat"
del "%game%\Domination II Game\players.bat"
del "%game%\Domination II Game\lobby.dat"
del "%game%\Domination II Game\start.dat"
del "%game%\Domination II Game\map.bat"
rd "%game%\Domination II Game"
goto gameoptions
:nogame
cls
echo Connection To Game Has Been Lost
echo --------------------------------
timeout /t 3 >nul
goto gameoptions
