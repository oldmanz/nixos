## Install

### Setup Nix 
```
sudo su
passwd    ## For ssh
nix-shell -p neovim  ## If vim needed
```

### Pull this repo and Install
```
HOST=PZ && \
git clone https://github.com/oldmanz/nixos.git && \
cd nixos && \
bash ./install.sh $HOST
```

### Reboot
```
reboot
```


## Post Install

### SSH Keys
```
ssh-keygen -t ed25519 -C "travis@oldmanz.com"
cat .ssh/id_ed25519.pub
```
Add to Github

### Clone Config
```
git clone git@github.com:oldmanz/nixos.git
```

### First Build
```
sudo chown oldmanz /persist/home/oldmanz
sudo nixos-rebuild switch --flake /home/oldmanz/nixos#default
```


## Other

## tailscale
```
tailscale up --login-server=<serverUrl>  ## not working 
```




