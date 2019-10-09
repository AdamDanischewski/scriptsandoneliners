## Git Version -- Alias 
### Provides the latest release version or tag from any github project. 
------------------------------------------------------------------------
Add the alias to your Bash aliases file. Otherwise you can pull the function. 

```bash
$> gitv: <org> [<repo> def=<org>] [<get tag> [prev nth tag: n=1,2,3..]]>]
```
![gitv screenshot](https://github.com/AdamDanischewski/scriptsandoneliners/blob/assets/gitv.png)

To get the latest release of a project: 

`$> gitv neovim neovim` 

If the project and repo are the same simply put the org name: 

`$> gitv neovim` 


To get the latest tag of a project: 

`$> gitv neovim neovim 1` 

To get the previous tag before the current: 

`$> gitv neovim neovim 2` 

To get 10 tags back: 

`$> gitv neovim neovim 10` 
