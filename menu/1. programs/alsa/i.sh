#!/bin/bash
## alsa
## драйвера и прочий критичный софт для звука в Linux
pacman -S --noconfirm  alsa-lib
pacman -S --noconfirm  alsa-utils
amixer sset Master 100% unmute
