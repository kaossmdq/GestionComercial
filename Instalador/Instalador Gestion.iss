; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "LarSoft SigCo"
#define MyAppVersion "8.0.0.0"
#define MyAppPublisher "LarSoft"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{BA389221-81FA-43F6-AE42-5D70A9444A9A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName=C:\Gestion
DefaultGroupName=Larsoft
AllowNoIcons=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline
OutputBaseFilename=LarSoft Gestion Cliente - Instalar
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Files]
Source: "C:\Users\Luis\Desktop\Instalador\FEAFIP V4\*"; DestDir: "{app}\FEAFIP V4"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\Luis\Desktop\Instalador\lsplib\*"; DestDir: "{app}\lsplib"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\Luis\Desktop\Instalador\OnLineCommManager\*"; DestDir: "C:\OnLineCommManager"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\Luis\Desktop\Instalador\Install.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Luis\Desktop\Instalador\Firebird-3.0.7.33374_1_x64.exe"; DestDir: "{tmp}"; Flags: ignoreversion

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[InstallDelete]
Name: {app}\Install.bat; Type: files
Name: {tmp}\Firebird-3.0.7.33374_1_x64.exe; Type: files

[Registry]

[Run]
Filename: {app}\FEAFIP V4\Registrar.bat; Flags: runhidden;  
Filename: {app}\lsplib\Registrar.bat; Flags: runhidden;
Filename: {tmp}\Firebird-3.0.7.33374_1_x64.exe;


