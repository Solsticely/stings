# Sting

This is a fork of ST with extra patches and my personal config. History is erased
because it included personal information at some point.

`st.png` includes property of the copyright owners of House M.D.. Please get in
contact if you'd like it removed, I'd gladly oblige.

Any changes I have made that aren't part of patches are to be licensed under CC0. I
don't think there's much, but I'm including this paragraph just in case. Changes I
*know* I've made:

- `config.mk` — Changed prefix setup
- `st.desktop`, `Makefile` — Changed desktop icon and made prefix dynamic
- `config.h` — Personal settings
- `config.h`, `config.def.h`, `x.c` — Change clipping rectangle

## Required building dependencies

I'm not sure if these are actually correct. These are just so you can find the
missing dependencies quicker than browsing [pkgs.org](https://pkgs.org); They
may contain more than what you actually need.

- Debian et. al.:
  ```bash
  sudo apt install libgd-dev libxft-dev x11proto-dev libharfbuzz-dev libfontconfig-dev libfreetype-dev
  ```
- RHEL et. al.:
  ```bash
  sudo dnf install gd-devel libXft-devel xorg-x11-proto-devel harfbuzz-devel fontconfig-devel freetype-devel
  ```

## Applied patches

- ~~https://st.suckless.org/patches/clipboard/~~
  - ~~Have no idea what it does but im hoping it helps with my clipboard?~~
  - ~~Was the first patch I applied so I decided to go with something simple~~
  - This patch was undone because I *just* realised what it was doing.
    This puts what you select into wayland's clipboard, :P
- https://st.suckless.org/patches/anysize/
  - Centres the text :D
- https://st.suckless.org/patches/desktopentry/
  - Makes a desktop entry
- https://st.suckless.org/patches/netwmicon/
  - Embeds an icon into the app
- https://st.suckless.org/patches/boxdraw/
  - Draws boxes better
- https://st.suckless.org/patches/ligatures/
  - Draw ligatures :D and shape text properly
  - Boxdraw compatibility patch needed!
- https://st.suckless.org/patches/clickurl/
  - Click on URLs :D
- https://st.suckless.org/patches/dynamic-cursor-color/
  - Dynamic cursor colour :D
- https://st.suckless.org/patches/undercurl/
  - Squiggly error lines
  - I only took the curly undercurls from this patch, this patch was unnecessarily
  huge
