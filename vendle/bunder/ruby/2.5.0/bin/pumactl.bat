@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\Users\Ruby25\bin\ruby.exe" "C:/Users/wsc17/app4/vendle/bunder/ruby/2.5.0/bin/pumactl" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\Users\Ruby25\bin\ruby.exe" "%~dpn0" %*