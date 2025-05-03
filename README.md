## Install

### Setup Nix 
```
sudo su
passwd    ## For ssh
nix-shell -p neovim git
```

### Pull this repo
```
git clone https://github.com/oldmanz/nixos.git
cd nixos
```

### Format Disk
```
sudo nix --experimental-features "nix-command flakes" \
run github:nix-community/disko -- \
--mode disko ./disko.nix \
--arg device '"/dev/nvme0n1"'
```

### Move Config
```
cd ~
mkdir /mnt/etc
cp -r nixos /mnt/etc
```

### Make Persist dirs
```
mkdir /mnt/persist/system
mkdir -p /mnt/persist/home/oldmanz
```

### Install
```
nixos-install --root /mnt --flake /mnt/etc/nixos#default
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




