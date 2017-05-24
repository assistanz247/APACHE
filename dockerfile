#THIS DOCKER FILE IS DEVELOPED BY ASSISTANZ NETWORKS

#SPECIFY THE CONTAINER IMAGE
FROM microsoft/windowsservercore

#COPY THE APACHE INSTALLATION FILES INTO THE CONTAINER
ADD ./setup c:/apache

#INSTALLING APACHE
RUN ["msiexec.exe", "/i", "C:\\apache\\httpd-2.2.25-win32-x86-no_ssl.msi", "/qn"]

#APACHE CONFIGURATION

RUN powershell.exe -command \

#COPY CUSTOMIZE HTTPD CONFIGURTION FILE TO APACHE conf FOLDER
copy-item c:/apache/httpd.conf -destination '"c:/program files (x86)/Apache Software Foundation/Apache2.2/conf"'; \

#INSTALLING APACHE SERVICE USING BATCH FILE
cmd.exe /c c:/apache/service.bat; \

#SET APACHE SERVICE TO RUN UNDER LOCAL SYSTEM ACCOUNT
sc.exe config apache2.2 obj=LocalSystem; \

#REMOVE THE APACHE SETUP FILES DIRECTORY
remove-item c:/apache -Recurse