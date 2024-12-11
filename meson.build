
project('komorebi', 'vala', 'c',
 subproject_dir  : 'extra' )

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
    'src/OnScreen/BackgroundWindow.vala',
    'src/OnScreen/DateTimeBox.vala',
    'src/OnScreen/DesktopIcons.vala',
    'src/OnScreen/ResponsiveGrid.vala',
    'src/OnScreen/Icon.vala',
    'src/OnScreen/InfoWindow.vala',
    'src/OnScreen/RowLabel.vala',
    'src/OnScreen/WallpapersSelector.vala',
    'src/OnScreen/Thumbnail.vala',
    'src/OnScreen/BubbleMenu.vala',
    'src/OnScreen/BubbleMenuItem.vala',
    'src/OnScreen/AssetActor.vala',
    'src/OnScreen/PreferencesWindow.vala',
    'src/Utilities.vala'
    )

executable('komorebi', 'src/Main.vala', sources, dependencies: dependencies)
