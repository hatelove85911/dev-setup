;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <redwolf85911@gmail.com>
;
; Script Function:
;   Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



#InstallKeybdHook
#InstallMouseHook


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; initialize global variables
; intialization must be done before any hot key definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Mode = 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;Esc to Capslock;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;Caps lock to Esc and control;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$Escape::CapsLock


;SetCapsLockState, AlwaysOff
Capslock::
Send {LControl Down}
KeyWait, CapsLock
Send {LControl Up}
if ( A_PriorKey = "CapsLock" )
{
    Send {Esc}
}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;toggle proxy for critical applications;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



!p::
    ToggleProxy("http://proxy.sin.sap.corp:8080")
return


; 0: no proxy , 1: singapore proxy, 2: corporate proxy: http://proxy:8030

ToggleProxy(ProxyAddress){
    global Mode

    if(Mode = 0) {
        Mode = 1
    } else if (Mode = 1) {
        Mode = 2
    } else if (Mode = 2){
        Mode = 0
    }

    bypassString := "localhost;127.0.0.1;*.local;*.sap.corp;10.*;*.corp.sap;*.co.sap.com;*.sap.biz;<local>"


    EnvGet, HomeDir, USERPROFILE
    proxyOnScriptPath = "\Dropbox\mymeta\mothership\win\onProxy.ps1"
    proxyOffScriptPath = "\Dropbox\mymeta\mothership\win\offProxy.ps1"

    if(Mode = 0) {
        RegDelete, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Internet Settings, AutoConfigURL
        RegWrite,REG_DWORD,HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Internet Settings,ProxyEnable, 0
        Run, powershell.exe -windowstyle hidden %HomeDir%%proxyOffScriptPath%
        TrayTip No Proxy, No Proxy
    } else if (Mode = 1) {
        RegDelete, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Internet Settings, AutoConfigURL
        RegWrite,REG_SZ,HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Internet Settings,ProxyServer, %ProxyAddress%
        RegWrite,REG_DWORD,HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Internet Settings,ProxyEnable, 1
        RegWrite,REG_SZ,HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Internet Settings,ProxyOverride, %bypassString%

        Run, powershell.exe -windowstyle hidden %HomeDir%%proxyOnScriptPath% -proxyaddr %ProxyAddress%
        TrayTip Proxy Enabled, %ProxyAddress%, 3
    } else if (Mode = 2){
        RegWrite,REG_SZ,HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Internet Settings,AutoConfigURL, http://proxy:8083
        RegWrite,REG_DWORD,HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Internet Settings,ProxyEnable, 0
        Run, powershell.exe -windowstyle hidden %HomeDir%%proxyOnScriptPath% -proxyaddr %ProxyAddress%
        TrayTip Corporate Proxy, http://proxy:8083, 3
    }    

    Return
}


mid$(input, startPos, replacement) {
   Return, SubStr(input,1,startPos-1) . replacement . SubStr(input,startPos+StrLen(replacement))
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;right alt to ctrl;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; comment out, probably won't used, I'll still need right alt to be alt
; RAlt::Control 
