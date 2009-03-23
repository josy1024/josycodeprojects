@rem cscript suche_sub_tree.wsf "%userprofile%\Desktop" 1 "regex" "\.lnk" "writeline"
@rem cscript suche_sub_tree.wsf "%userprofile%\Desktop" 1 "regex" "\.lnk" "writelinefullpath"
@rem cscript suche_sub_tree.wsf "%userprofile%\Desktop" 1 "regex" "\.lnk" "writelinelinktargets"
@rem cscript suche_sub_tree.wsf "%userprofile%\Desktop" 1 "regex" "\.lnk" "writelinelinktargets"
@rem cscript suche_sub_tree.wsf "%userprofile%\Desktop" 1 "regex" "\.url" "writelinelinktargets"
@rem cscript suche_sub_tree.wsf "%userprofile%\Desktop" 1 "regex" "\.lnk|\.url" "writelinelinktargets"
@rem cscript suche_sub_tree.wsf "%userprofile%\Desktop" 1 "regex" "daten_lokal.*[\.lnk|\.url]" "del"
@rem cscript suche_sub_tree.wsf "%userprofile%\Desktop" 1 "regex" "daten_lokal.*[\.lnk|\.url]" "delmissingtargets"
@rem cscript suche_sub_tree.wsf "%userprofile%\Desktop" 1 "regex" "\.lnk" "delmissingtargets"
@cscript suche_sub_tree.wsf "%userprofile%\Desktop" 1 "regex" "\.lnk" "delmissingtargets"




