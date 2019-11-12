#!/usr/bin/awk -f

  ######################################################################
 ######################################################################
## Author: Adam Michael Danischewski 
## GitHub: https://github.com/AdamDanischewski/scriptsandoneliners
## Created Date: 2019-11-12
## Name: colorfiles.awk
## Version: v0.01
## Last Modified: 2019-11-12
## Issues: If you find any issues emai1 me at <my first name> (dot) 
##         <my last name> (at) gmail (dot) com. 
##
## Requirements: awk 
## 
## Allows the user to fine tune and customize their color scheme for 
## files. LS_COLORS only allows for a small subset of file types. This 
## script allows specific colors for all files and can be utilized in 
## pipelines to color output after processing with tools that do not 
## have a color option. 
## 
## This script includes a color template that can be applied to 
## pipelines on the command line or to replace coloring features 
## of shell utilities. Edit/hack to your preference. 
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
##
## Released under Creative Commons License: CC BY-SA 4.0
## https://creativecommons.org/licenses/by-sa/4.0/
 ######################################################################
  ######################################################################

function init_colormap() {
 colormap["pdf"]="108;107;21"
 startcolor="\033[38;2;"         ## TrueColor RGB triplet prefix 
 endcolor="\033[0m"
 colormap["jpg"]="0;85;0" 	
 colormap["gif"]=colormap["jpg"] ## Grouping images, change as you wish.
 colormap["png"]=colormap["jpg"]
 colormap["jpeg"]=colormap["jpg"] 
 colormap["jpe"]=colormap["jpg"] ## JFIF
 colormap["blend"]="251;143;21"
 colormap["mp3"]="157;0;193"
 colormap["bsh"]="85;229;0"
 colormap["sh"]=colormap["bsh"]
 colormap["awk"]=colormap["bsh"]
 colormap["php"]=colormap["bsh"]
 colormap["js"]=colormap["bsh"]
 colormap["pl"]=colormap["bsh"]
 colormap["py"]=colormap["bsh"]
 colormap["vtt"]="0;85;157" 	
 colormap["tex"]="0;0;229" 	
 colormap["nzb"]="85;229;0" 	
 colormap["deb"]="193;12;199" 	
 colormap["txt"]="215;215;21" 	
 colormap["mp4"]="85;0;193" 	
 colormap["log"]="193;85;12" 	
 colormap["c"]="0;121;229" 	
 colormap["cc"]=colormap["c"]
 colormap["cpp"]=colormap["c"]
 colormap["h"]=colormap["c"]
 colormap["avi"]=colormap["mp4"]
 colormap["mov"]=colormap["mp4"]
 colormap["mkv"]=colormap["mp4"] 
 colormap["webm"]=colormap["mp4"] 
 colormap["html"]="157;0;193"
 colormap["css"]=colormap["html"]
 colormap["pdf"]="229;85;0"
 colormap["dir"]="0;157;229"    ## Directories - ending in / 
 colormap["links"]="251;22;143" ## Symbolic links - ending in @
 colormap["part"]="157;0;85"
 colormap["tar"]="229;0;193"
 colormap["tar.gz"]=colormap["tar"]
 colormap["tgz"]=colormap["tar"]
 colormap["tar.xz"]=colormap["tar"]
 colormap["tar.bz2"]=colormap["tar"]
 colormap["xz"]="229;0;85"
 colormap["gz"]=colormap["xz"]
 colormap["7z"]=colormap["xz"]
 colormap["iso"]=colormap["xz"]
 colormap["rar"]=colormap["xz"]
 colormap["par2"]=colormap["xz"]
 colormap["bz2"]=colormap["xz"]
 colormap["zip"]=colormap["xz"]
 colormap["kgb"]=colormap["xz"] # Future standard compression (PAQ)
 return
} 

function wrap_color(s) { 
 if (tolower(s) ~ /\.jpg[*]?$/) { 
  selc=colormap["jpg"]
 } else if (tolower(s) ~ /\.jpe[*]?$/) { 
  selc=colormap["jpe"]	 
 } else if (tolower(s) ~ /\.gif[*]?$/) { 
  selc=colormap["gif"]	 
 } else if (tolower(s) ~ /\.tar[*]?$/)    { 
  selc=colormap["tar"]	 
 } else if (tolower(s) ~ /\.tar\.gz[*]?$/) { 
  ## Make sure these are before their respective 
  ## compression conditionals to avoid tar's 
  ## from being treated as simply compressed. 
  selc=colormap["tar.gz"]	 
 } else if (tolower(s) ~ /\.tar.bz2[*]?$/)  { 
  selc=colormap["tar.bz2"]	 
 } else if (tolower(s) ~ /\.tar.xz[*]?$/)  { 
  selc=colormap["tar.xz"]	 
 } else if (tolower(s) ~ /\.tgz[*]?$/)  { 
  selc=colormap["tgz"]	 
 } else if (tolower(s) ~ /\.jpeg[*]?$/) { 
  selc=colormap["jpeg"]	 
 } else if (tolower(s) ~ /\.png[*]?$/)   { 
  selc=colormap["png"]	              
 } else if (tolower(s) ~ /\.sh[*]?$/)   { 
  selc=colormap["sh"]	             
 } else if (tolower(s) ~ /\.mp4[*]?$/)   { 
  selc=colormap["mp4"]	             
 } else if (tolower(s) ~ /\.rar[*]?$/)   { 
  selc=colormap["rar"]	        
 } else if (tolower(s) ~ /\.par2[*]?$/)   { 
  selc=colormap["par2"]	        
 } else if (tolower(s) ~ /\.log[*]?$/)   { 
  selc=colormap["log"]	        
 } else if (tolower(s) ~ /\.mp3[*]?$/)   { 
  selc=colormap["mp3"]	        
 } else if (tolower(s) ~ /\.deb[*]?$/)   { 
  selc=colormap["deb"]	 
 } else if (tolower(s) ~ /\.mov[*]?$/)   { 
  selc=colormap["mov"]	 
 } else if (tolower(s) ~ /\.bsh[*]?$/)   { 
  selc=colormap["bsh"]	 
 } else if (tolower(s) ~ /\.mkv[*]?$/)   { 
  selc=colormap["mkv"]	 
 } else if (tolower(s) ~ /\.pdf[*]?$/)   { 
  selc=colormap["pdf"]	 
 } else if (tolower(s) ~ /\.c[*]?$/)   { 
  selc=colormap["c"]	 
 } else if (tolower(s) ~ /\.cpp[*]?$/)   { 
  selc=colormap["cpp"]	 
 } else if (tolower(s) ~ /\.cc[*]?$/)   { 
  selc=colormap["cc"]	 
 } else if (tolower(s) ~ /\.h[*]?$/)   { 
  selc=colormap["h"]	 
 } else if (tolower(s) ~ /\.txt[*]?$/)   { 
  selc=colormap["txt"]	 
 } else if (tolower(s) ~ /\.vtt[*]?$/)   { 
  selc=colormap["vtt"]	 
 } else if (tolower(s) ~ /\.tex[*]?$/)   { 
  selc=colormap["tex"]	 
 } else if (tolower(s) ~ /\.nzb[*]?$/)  { 
  selc=colormap["nzb"]	 
 } else if (tolower(s) ~ /\.bz2[*]?$/)  { 
  selc=colormap["bz2"]	 
 } else if (tolower(s) ~ /\.iso[*]?$/)  { 
  selc=colormap["iso"]	 
 } else if (tolower(s) ~ /\.html[*]?$/)  { 
  selc=colormap["html"]	 
 } else if (tolower(s) ~ /\.css[*]?$/)  { 
  selc=colormap["css"]	 
 } else if (tolower(s) ~ /@$/)  { 
  selc=colormap["links"]	 
 } else if (tolower(s) ~ /\.webm[*]?$/)  { 
  selc=colormap["webm"]	 
 } else if (tolower(s) ~ /\.awk[*]?$/)    { 
  selc=colormap["awk"]	 
 } else if (tolower(s) ~ /\.php[*]?$/)    { 
  selc=colormap["php"]	 
 } else if (tolower(s) ~ /\.js[*]?$/)    { 
  selc=colormap["js"]	 
 } else if (tolower(s) ~ /\.pl[*]?$/)    { 
  selc=colormap["pl"]	 
 } else if (tolower(s) ~ /\.py[*]?$/)    { 
  selc=colormap["py"]	 
 } else if (tolower(s) ~ /\.part[*]?$/)    { 
  selc=colormap["part"]	 
 } else if (tolower(s) ~ /\.kgb[*]?$/)    { 
  selc=colormap["kgb"]	 
 } else if (tolower(s) ~ /\.xz[*]?$/)  { 
  selc=colormap["xz"]	 
 } else if (tolower(s) ~ /\.7z[*]?$/)  { 
  selc=colormap["7z"]	 
 } else if (tolower(s) ~ /\.gz[*]?$/)  { 
  selc=colormap["gz"]	 
 } else if (tolower(s) ~ /\.zip[*]?$/)  { 
  selc=colormap["zip"]	 
 } else if (tolower(s) ~ /\/$/)  { 
  selc=colormap["dir"]	 
 }
 else { 
  return s
 }  
 return (startcolor selc "m" s endcolor)
}

function usage() {
 usage_str=("\nUsage: /bin/ls -f1 | colorfiles.awk \n\n \
   Options: \n\
             -?    Help.\n\n\
Note: Make sure colors are not already present- you can sed the input.\n\
      Eg. $> ls --color| sed 's/\\x1B[[0-9;]\\+[A-Za-z]//g' |colorfiles.awk\n\
          $> alias colorfiles='sed \"s/\x1B[[0-9;]\\+[A-Za-z]//g\"|colorfiles.awk'\n\
          $> alias lsd='find \"$(pwd)\" -maxdepth 1 -type d -printf \"%T@\t%Tc %f/\\n\" 2>/dev/null|sort -n|cut -f 2-|tail -50|colorfiles'\n\
          $> alias lsf='find \"$(pwd)\" -maxdepth 1 -type f -printf \"%T@\t%Tc %f\\n\" 2>/dev/null|sort -n|cut -f 2-|tail -50|colorfiles'\n\
          $> alias ls='_(){ /bin/ls -F -f1 $@ |colorfiles;};_'\n")
 return usage_str
}

BEGIN {if(v_opt1=="-?"){print usage();exit 1;}else{init_colormap();};}

## Main
{
 print wrap_color($0) 
}
