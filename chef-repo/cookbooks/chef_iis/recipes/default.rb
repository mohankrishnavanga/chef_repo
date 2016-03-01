#
# Cookbook Name:: chef_iis
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Server).InstallState -eq 'Installed'"
end

powershell_script 'Install IIS Management Console' do
  code 'Add-WindowsFeature Web-Mgmt-Console'
  guard_interpreter :powershell_script
  not_if "$MgmtConsoleState = (Get-WindowsFeature Web-Mgmt-Console).InstallState
	 If ($MgmtConsoleState -eq 'Available')
	 {
		echo $false
	 }
	 Elseif ($MgmtConsoleState -eq 'Installed')
 	 {
		echo $true
	 }"
end

powershell_script 'Get the artifacts from s3' do
  code 'Copy-S3Object -BucketName thelonebucket -Key TestApplication.zip -LocalFile C:\Users\Administrator\TestApplication.zip'
  guard_interpreter :powershell_script
end


service 'w3svc' do
  action [:enable, :start]
end

powershell_script 'Unzip and copy the files to wwwroot folder' do
  code 'Add-Type -AssemblyName System.IO.Compression.FileSystem
       function Unzip
       {
       	  param([string]$zipfile,[string]$outpath)
          [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
       }
       Unzip "C:\Users\Administrator\TestApplication.zip" "C:\inetpub\wwwroot\TestApplication"'
  guard_interpreter :powershell_script
end






