set from=G:
set to=F:\HD_METADATA
robocopy /E %from% %to% /XD $recycle.bin /XD "System Volume Information"