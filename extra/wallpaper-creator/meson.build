
project('wallpaper-creator', 'vala', 'c')

dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gee-0.8'),
    dependency('gtk+-3.0'),
    dependency('gstreamer-1.0'),
    dependency('clutter-gtk-1.0'),
    dependency('clutter-gst-3.0'),
    dependency('webkit2gtk-4.1'),
]

sources = files(
    'OnScreen/FinalPage.vala',
    'OnScreen/InitialPage.vala',
    'OnScreen/NewWallpaperWindow.vala',
    'OnScreen/OptionsPage.vala',
    'OnScreen/VideoPlayer.vala'
    )


executable('wallpaper-creator', 'Main.vala', sources, dependencies: dependencies)