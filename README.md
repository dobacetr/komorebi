<p align="center"><img src="https://raw.githubusercontent.com/dobacetr/komorebi/master/screenshots/komorebi-icon.png" width="130"></p>
<h2 align="center">Komorebi - Animated Wallpapers for Linux</h2>
<p align="center">(n) sunlight filtering through trees.</p>

<div style="text-align: center">
<!-- This empty space is important for badges below --> 
[![Platform](https://img.shields.io/badge/platform-GNU/Linux-blue.svg)](http://www.kernel.org) [![Ubuntu-24.04 Build](https://github.com/dobacetr/komorebi/actions/workflows/Ubuntu_24_04_CMake_build_test.yml/badge.svg)](https://github.com/dobacetr/komorebi/actions/workflows/Ubuntu_24_04_CMake_build_test.yml)
</div>

## About the Fork

This is a personal fork that I have made to use myself:

* Updated dependencies for Ubuntu 24.04.
* Added video-preview to wallpaper-creator
* Changed program directory from /System/... to ~/komorebi/System/...
* Added _meson_ build files for linting using vala-language-server.


<a href="https://github.com/cheesecakeufo/komorebi">Original Repo</a>

Rest of the README is taken mostly from the original, with links replaced to this repository.

## What is Komorebi?

Komorebi is an awesome animated wallpapers manager for all Linux platforms.
It provides fully customizeable image, video, and web page wallpapers that can be tweaked at any time!

![s1](https://raw.githubusercontent.com/dobacetr/komorebi/master/screenshots/collage.jpg)


## How do I install Komorebi?

Two ways:

### Packaged install

1. Download `Komorebi` from the [Komorebi releases page](https://github.com/dobacetr/komorebi/releases).
2. Install Komorebi using your favorite package installer (aka. double click on it)
3. Launch Komorebi!

### Building and Installing from Source

Run the following:
```
# If you dont have a c compiler
sudo apt install build-essential
# If you dont have cmake
sudo apt install cmake
## Install direct dependencies
sudo apt install valac libgtk-3-dev libgee-0.8-dev libclutter-gtk-1.0-dev \
libclutter-1.0-dev libwebkit2gtk-4.1-dev libunwind-dev libclutter-gst-3.0-dev
# Clone the repo
git clone https://github.com/dobacetr/komorebi.git
# Configure and build
cd komorebi
cmake -B build
cmake --build build
# Install (to ~/Komorebi/System/Application)
cmake --install build
```

## Change Wallpaper & Desktop Preferences
To change desktop preferences or your wallpaper, right click anywhere on the desktop to show the menu.

![s1](https://raw.githubusercontent.com/dobacetr/komorebi/main/screenshots/preferences.jpg)

## How do I create my own wallpaper?

Komorebi provides a simple tool to create your own wallpapers! Simply, open your apps and search for 'Wallpaper Creator'

![s1](https://raw.githubusercontent.com/dobacetr/komorebi/main/screenshots/wallpaper_creator.jpg)

You can use either an image, a video, or a web page as a wallpaper and you have many different options to customize your very own wallpaper!

## Uninstall

### If you installed a packaged version of Komorebi

1. Open Terminal
2. `sudo apt remove komorebi`

### If you installed Komorebi from the source

You can remove the <code>~/Komorebi</code> folder.

## Questions? Issues?

### Komorebi is slow. What can I do about it?

Komorebi includes support for video wallpapers that might slow your computer down. You can disable support for video wallpapers in 'Desktop Preferences' → uncheck 'Enable Video Wallpapers'.

_note: you need to quit and re-open Komorebi after changing this option_


### After uninstalling, my desktop isn't working right (blank or no icons)

The latest Komorebi should already have a fix for this issue. If you've already uninstalled Komorebi and would like to fix the issue, simply run this (in the Terminal):
```
curl -s https://raw.githubusercontent.com/dobacetr/komorebi/main/data/Other/postrm | \
bash -s
```
If your issue has not already been reported, please report it *[`here`](https://github.com/dobacetr/komorebi/issues/new)* and I'll try my best to fix them.

### Thanks To:

Pete Lewis ([@PJayB](https://github.com/PJayB)) for adding mult-monitor support
Abraham Masri([@cheesecakeufo](https://github.com/cheesecakeufo)) for komorebi
