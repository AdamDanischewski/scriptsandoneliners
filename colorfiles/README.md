# Colorize 

#### An awk based file coloring utility. 
```awk 
colorfiles.awk -vv_opt1="-?"

Usage: /bin/ls -f1 | colorfiles.awk

    Options:
             -?    Help.

Note: Make sure colors are not already present- you can sed the input.
      Eg. $> ls --color| sed 's/\x1B[[0-9;]\+[A-Za-z]//g' |colorfiles.awk
          $> alias colorfiles='sed "s/0-9;]\+[A-Za-z]//g"|colorfiles.awk'
          $> alias lsd='find "$(pwd)" -maxdepth 1 -type d -printf "%T@  %Tc %f/\n" 2>/dev/null|sort -n|cut -f 2-|tail -50|colorfiles'
          $> alias lsf='find "$(pwd)" -maxdepth 1 -type f -printf "%T@  %Tc %f\n" 2>/dev/null|sort -n|cut -f 2-|tail -50|colorfiles'
          $> alias ls='/bin/ls -F -f1|colorfiles'
```

![colorfiles screenshot](https://raw.githubusercontent.com/AdamDanischewski/scriptsandoneliners/assets/colorfiles_sshot1.png)
