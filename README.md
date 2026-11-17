# Keygen-Mail

POP3-Anfragen anhand von Betreff-Triggern bearbeiten und per SMTP beantworten.

**Version:** 1.0.3  
**System:** Debian 13 (trixie), Python 3, systemd, debconf  
**Status:** Quellcode aus dem zuletzt getesteten Debian-Paket rekonstruiert; GitHub-Veröffentlichung vorbereitet, nicht live getestet.

## Funktionen

- Python 3 und SMTP-Versand mit optionalem STARTTLS
- `Date`- und `Message-ID`-Header sowie konfigurierbarer Absendername
- Automatisierung über `keygen.timer` und `keygen.service`
- Konfiguration über Debian debconf (`dpkg-reconfigure keygen-mail`)

## Paket bauen

```bash
./build-deb.sh
sudo apt install ./dist/keygen-mail_1.0.3_all.deb
```

Zum erneuten Einrichten:

```bash
sudo DEBIAN_FRONTEND=readline dpkg-reconfigure -plow keygen-mail
```

Testlauf und Protokoll:

```bash
sudo systemctl start keygen.service
sudo journalctl -u keygen.service -n 50 --no-pager -l
```

## Quellcode

- `debian-package/usr/lib/`: Python-Anwendung
- `debian-package/usr/lib/systemd/system/`: systemd-Units
- `debian-package/DEBIAN/`: Paket-Metadaten und debconf-Installer
- `debian-package/etc/`: mitgelieferte Standarddateien, sofern vorhanden

## Voraussetzungen und Hinweise

Ein extern installiertes UMSKT-Programm wird vorausgesetzt. Es werden keine SMTP- oder POP3-Zugangsdaten im Repository veröffentlicht. Produktive Konfigurationen werden beim Installieren erzeugt und gehören nicht ins Git.

**Wichtig:** Die ursprünglichen Trigger, Link- und Antworttexte wurden für die Veröffentlichung durch neutrale Beispiele ersetzt. Bitte vor produktivem Einsatz eigene Werte einsetzen; die öffentliche Quellfassung ist deshalb nicht vollständig identisch mit dem bisherigen Paket.



## Lizenz

MIT-Lizenz, Copyright (c) 2026 arminmoradi96. Siehe [LICENSE](LICENSE). Externe Abhängigkeiten behalten ihre eigenen Lizenzbedingungen.
