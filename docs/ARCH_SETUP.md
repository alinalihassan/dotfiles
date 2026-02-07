# Arch Linux System Configuration

System-level configuration changes for Arch Linux (CachyOS).

---

## Login Experience - Skip SDDM

Auto-login to Niri and use Noctalia's lock screen instead of SDDM.

**1. Configure SDDM auto-login** (`/etc/sddm.conf`):
```ini
[Autologin]
User=hassanalinali
Session=niri.desktop
```

**2. Add lock screen to autostart** (`niri/cfg/autostart.kdl`):
```kdl
spawn-sh-at-startup "sleep 2 && qs -c noctalia-shell ipc call lockScreen lock"
```

**3. Reboot**

---
