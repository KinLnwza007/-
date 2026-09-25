@echo off
title Vanguard Hub - Local Server
echo ===================================================
echo     VANGUARD HUB - Cardfight!! Vanguard Deck Builder
echo     Inspired by BotTCG (Deck Code: 7u6qTjDeVBwr)
echo ===================================================
echo.
echo Starting development server...
set "PATH=C:\Program Files\nodejs;%PATH%"
start http://localhost:5173/?deck=7u6qTjDeVBwr
call npm run dev
pause
