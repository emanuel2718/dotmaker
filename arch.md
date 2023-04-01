# Arch Installation commands (Using `archinstall`)

$ iwctl
$ station wlan0 connect <Insert SSID here>
$ quit

$ pacman-key --init
$ pacman-key --populate archlinux
$ archinstall

> Select Mirror Region -> US
> Select Drive
> Disk Layout > Wipe All > Filesystem ext4 > create separate home partition

> Set root password
> User Account setup >  Add User > Add it as superuser
> Profile > Minimal setup
> Audio > Pipewire
> Additional packages > git vim
> Network Configuration > NetworkManager
> Timezone > America/PuertoRico
> Optional Repositories > multilib
> Install!
> Unplug USB drive
> Click `no` on 'Would you like to chroot into the newly created installation..'

$ reboot

> Login

- Connect to wifi
> nmcli device wifi connect <SSID HERE> <PASSWORD HERE>

- Install yay
$ cd /opt
$ sudo git clone https://aur.archlinux.org/yay-git.git
$ sudo chown rami:rami yay-git
$ cd yay-git
$ makepkg -si
$ yay -Syu







