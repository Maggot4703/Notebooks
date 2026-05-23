# Raspberry Pi Shell Commands

**Source:** [raspberrypi.com/documentation](https://www.raspberrypi.com/documentation/)

---

## System Health & Diagnostics

```bash
uname -a                          # kernel version and architecture
cat /etc/os-release               # OS name and version
free -h                           # RAM usage (human-readable)
df -h                             # disk usage (human-readable)
ip -br a                          # brief network interface summary
ip route                          # routing table
```

---

## vcgencmd (VideoCore GPU Tool)

```bash
vcgencmd commands                 # list all available vcgencmd subcommands
vcgencmd version                  # firmware build date and version
vcgencmd get_throttled            # undervoltage/throttling bitmask (see table below)
vcgencmd measure_temp             # SoC temperature
vcgencmd measure_temp pmic        # PMIC temperature (Pi 4 only)
vcgencmd measure_clock arm        # CPU (Arm core) frequency
vcgencmd measure_clock core       # GPU core frequency
vcgencmd measure_volts core       # VC4 core voltage
vcgencmd measure_volts sdram_c    # SDRAM core voltage
vcgencmd get_config total_mem     # total memory in MB
vcgencmd get_mem arm              # Arm-addressable memory
vcgencmd get_mem gpu              # GPU-addressable memory
vcgencmd otp_dump                 # dump OTP memory (32-bit values, index 8–64)
```

### get_throttled Bit Meanings

| Bit | Hex     | Meaning                         |
|-----|-------- |---------------------------------|
| 0   | 0x1     | Undervoltage detected           |
| 1   | 0x2     | Arm frequency capped            |
| 2   | 0x4     | Currently throttled             |
| 3   | 0x8     | Soft temperature limit active   |
| 16  | 0x10000 | Undervoltage has occurred       |
| 17  | 0x20000 | Arm frequency capping occurred  |
| 18  | 0x40000 | Throttling has occurred         |
| 19  | 0x80000 | Soft temperature limit hit      |

---

## Display Utilities

```bash
kmsprint                          # connected monitor details
kmsprint -m                       # all supported display modes per monitor
aplay -L | grep sysdefault        # list ALSA audio output devices
kmsprint | grep Connector         # list DRM video output devices
```

---

## GPU / VideoCore Logs

```bash
sudo vclog --msg                  # VideoCore GPU message log
sudo vclog --assert               # VideoCore GPU assertion log
```

---

## raspi-config (Interactive & Non-Interactive)

```bash
sudo raspi-config                 # launch interactive configuration tool
```

### Non-interactive (scripted) usage

```bash
sudo raspi-config nonint do_ssh 0           # enable SSH (0=enable, 1=disable)
sudo raspi-config nonint do_boot_wait 1     # wait for network at boot
sudo raspi-config nonint do_boot_behaviour B2  # boot to console with autologin
  # B1=console, B2=console autologin, B3=desktop, B4=desktop autologin
sudo raspi-config nonint do_vnc 0           # enable VNC server
sudo raspi-config nonint do_expand_rootfs   # expand root filesystem to fill SD card
```

---

## Software Management (APT)

```bash
sudo apt update                          # refresh package lists
sudo apt full-upgrade                    # upgrade all packages (use full-upgrade, not upgrade)
sudo apt install <package>               # install a package
sudo apt remove <package>                # remove a package
sudo apt purge <package>                 # remove package and configuration files
sudo apt clean                           # delete cached .deb files
apt-cache search <keyword>               # search available packages
apt-cache show <package>                 # show package details
sudo apt install --reinstall raspi-firmware  # reinstall firmware (rollback)
```

---

## Network

```bash
hostname -I                              # local IP address(es)
nmcli device show                        # full network interface info (Network Manager)
ping raspberrypi.local                   # find Pi by mDNS hostname
sudo nmap -sn 192.168.1.0/24            # scan subnet for all devices
ip -4 addr show dev eth0 | grep inet     # Ethernet IPv4 address
ip route | awk '/default/ {print $3}'    # gateway/router IP
cat /etc/resolv.conf                     # DNS server(s) in use
ethtool -P eth0                          # Ethernet MAC address
grep Serial /proc/cpuinfo | cut -d ' ' -f 2 | cut -c 9-16  # Pi serial number
```

---

## SSH

```bash
ssh <username>@<ip>                      # connect to remote terminal
ssh -Y <username>@<ip>                   # connect with X11 forwarding (GUI apps)
ssh-keygen                               # generate RSA keypair (~/.ssh/id_rsa)
ssh-add ~/.ssh/id_rsa                    # add key to ssh-agent
eval "$(ssh-agent -s)"                   # start ssh-agent
ssh-copy-id <username>@<ip>             # copy public key to Pi (passwordless login)
ls ~/.ssh                                # list existing SSH keys
```

---

## File Transfer

```bash
# SCP — copy over SSH
scp myfile.txt <user>@<ip>:              # copy file to Pi home directory
scp myfile.txt <user>@<ip>:project/     # copy file to specific directory
scp <user>@<ip>:myfile.txt .            # copy file from Pi to current directory
scp *.txt <user>@<ip>:                  # copy multiple files by wildcard
scp -r project/ <user>@<ip>:           # copy a folder recursively

# rsync — synchronise folders
rsync -avz -e ssh <user>@<pi>:/folder/ /local/folder/  # sync Pi folder → local
```

---

## systemd Service Management

```bash
systemctl --type=service --state=running --no-pager  # list running services
systemctl --failed --no-pager                         # list failed services
systemctl list-unit-files --type=service --no-pager   # all services and their state
sudo systemctl status <service>                       # service status
sudo systemctl start <service>                        # start a service
sudo systemctl stop <service>                         # stop a service
sudo systemctl enable <service>                       # enable at boot
sudo systemctl disable <service>                      # disable at boot
sudo systemctl daemon-reload                          # reload unit files after edits
journalctl -p 3 -xb --no-pager                       # boot errors (priority ≥ error)
journalctl -f                                         # follow live log
journalctl -u <service> --no-pager                   # logs for a specific service
```

---

## Python & Virtual Environments

```bash
python -m venv env                       # create virtual environment named 'env'
source env/bin/activate                  # activate virtual environment
deactivate                               # exit virtual environment
pip list                                 # list installed packages in venv
sudo apt install python3-<package>       # install Python package system-wide via apt
```

---

## GPIO (gpiozero library)

```python
from gpiozero import LED, Button

led = LED(17)           # LED on GPIO17
led.on()
led.off()
led.toggle()
led.blink()

button = Button(2)      # Button on GPIO2
button.is_pressed       # True/False
button.when_pressed = led.on
button.when_released = led.off
```

---

## Media Playback (VLC)

```bash
vlc video.mp4                            # play in VLC GUI
vlc --play-and-exit video.mp4            # close VLC when done
vlc --play-and-exit --fullscreen video.mp4
cvlc --play-and-exit audio.mp3           # play without GUI
cvlc --play-and-exit -A alsa --alsa-audio-device sysdefault:CARD=Headphones audio.mp3
cvlc --play-and-exit --drm-vout-display HDMI-A-1 video.mp4
ffmpeg -r 30 -i video.h264 -c:v copy video.mp4  # wrap H.264 stream in MP4 container
```

| ALSA Device | Output |
| --- | --- |
| `sysdefault:CARD=Headphones` | 3.5 mm headphone jack |
| `sysdefault:CARD=vc4hdmi` | HDMI (single-HDMI models) |
| `sysdefault:CARD=vc4hdmi0` | HDMI0 (Pi 4 and newer) |
| `sysdefault:CARD=vc4hdmi1` | HDMI1 (Pi 4 and newer) |

| DRM Device | Output |
| --- | --- |
| `HDMI-A-1` | HDMI on Pi Zero/1/2/3, or HDMI0 on Pi 4/5 |
| `HDMI-A-2` | HDMI1 on Pi 4 and newer |
| `DSI-1` | Raspberry Pi Touch Display |

---

## Firmware Updates

```bash
sudo rpi-update           # update to latest pre-release firmware (use with caution)
sudo reboot               # required after rpi-update
# To roll back firmware:
sudo apt update
sudo apt install --reinstall raspi-firmware
```

---

## Snapshot Diagnostic Block

Run all at once for a quick system snapshot:

```bash
uname -a
cat /etc/os-release
vcgencmd get_throttled
vcgencmd measure_temp
free -h
df -h
ip -br a
systemctl --failed --no-pager
journalctl -p 3 -xb --no-pager
```
