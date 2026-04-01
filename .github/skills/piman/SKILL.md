---
name: piman
description: "Use when: working on Raspberry Pi 5 setup, diagnostics, optimization, and recovery playbooks."
---

# piman Skill

## Purpose
Support Raspberry Pi 5 setup, diagnostics, optimization, and recovery workflows with reusable checklists and command patterns.

## Use When
- Setting up a new Raspberry Pi 5 (headless or desktop).
- Troubleshooting boot failures, undervoltage, thermal throttling, or storage/network issues.
- Hardening a Pi 5 for always-on service workloads.
- Validating Docker, MQTT, web API, or automation stacks on Pi 5.
- Scanning documentation or notes for Raspberry Pi-related web links.

## Quick Checklists

### 1) Baseline Health
- Verify OS and kernel:
  - `uname -a`
  - `cat /etc/os-release`
- Check firmware and throttling:
  - `vcgencmd version`
  - `vcgencmd get_throttled`
  - `vcgencmd measure_temp`
- Confirm memory, disk, and network:
  - `free -h`
  - `df -h`
  - `ip -br a`

### 2) Boot And Storage
- Confirm boot source and storage health.
- For SD cards: check filesystem errors and free space.
- For NVMe/USB boot: validate power, cable/adapter quality, and firmware support.

### 3) Performance And Thermals
- Monitor temperature and CPU frequency under load.
- Verify active cooling and case airflow.
- Resolve undervoltage before tuning workloads.

### 4) Service Reliability
- Inspect running services:
  - `systemctl --type=service --state=running --no-pager`
- Inspect boot targets and failures:
  - `systemctl --failed --no-pager`
  - `journalctl -p 3 -xb --no-pager`
- Verify startup enablement:
  - `systemctl list-unit-files --type=service --no-pager`

### 5) Security Minimums
- Change default credentials.
- Enable SSH key-based login.
- Disable password auth where possible.
- Keep system updated and reboot on kernel/firmware updates.

## Reusable Command Blocks

### Snapshot Diagnostics
```bash
uname -a
cat /etc/os-release
vcgencmd get_throttled
vcgencmd measure_temp
free -h
df -h
ip -br a
```

### Service Audit
```bash
systemctl --type=service --state=running --no-pager
systemctl --failed --no-pager
journalctl -p 3 -xb --no-pager
```

### Network Sanity
```bash
ip -br a
ip route
ping -c 3 1.1.1.1
ping -c 3 github.com
```

### Documentation Link Scan
```bash
rg -n --no-heading -o 'https?://[^)"[:space:]>]+' Manuals/ .github/ || true
```

### Raspberry Pi Link Scan Only
```bash
rg -n --no-heading -o 'https?://[^)"[:space:]>]+' Manuals/ .github/ | rg 'raspberrypi\.com|raspberry\.org' || true
```

## Notes
- Prioritize power integrity first for Pi 5 instability symptoms.
- Treat `get_throttled` flags as high-signal diagnostics.
- Use small, reversible changes and re-check health after each step.
- For doc scans, prefer exact URL extraction over manual eyeballing so results are reproducible.
