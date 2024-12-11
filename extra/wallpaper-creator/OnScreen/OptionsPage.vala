//
//  Copyright (C) 2017-2018 Abraham Masri @cheesecakeufo
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

namespace WallpaperCreator.OnScreen {

    public class OptionsPage : Gtk.Box {

        // Contains the wallpaper image with buttons
        Gtk.Box wallpaperBox = new Gtk.Box(Gtk.Orientation.VERTICAL, 10);
        Gtk.Overlay overlay = new Gtk.Overlay();
        Gtk.Image wallpaperImage = new Gtk.Image();
        Gtk.Box dateTimeBox = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
        Gtk.Label timeLabel = new Gtk.Label("");
        Gtk.Label dateLabel = new Gtk.Label("");
        Gtk.Image assetImage = new Gtk.Image();
        VideoPlayer videoPlayer = new VideoPlayer(600, 400);
        Clutter.Actor cDateTimeBox = new Clutter.Actor();
        Clutter.Text timeText = new Clutter.Text();
        Clutter.Text dateText = new Clutter.Text();
        

        // List of long options
        Gtk.ScrolledWindow scrolledWindow = new Gtk.ScrolledWindow(null, null);
        Gtk.Box optionsBox = new Gtk.Box(Gtk.Orientation.VERTICAL, 10);

        Gtk.Label wallpaperTitleLabel = new Gtk.Label("");

        Gtk.ComboBoxText wallpaperParallaxComboBox = new Gtk.ComboBoxText();

        Gtk.Label dateTimeTitleLabel = new Gtk.Label("") {margin_top = 15};

        Gtk.ComboBoxText dateTimeVisibleComboBox = new Gtk.ComboBoxText();

        Gtk.ComboBoxText dateTimeParallaxComboBox = new Gtk.ComboBoxText();

        Gtk.Label dateTimeMarginsLabel = new Gtk.Label("Margins:");
        Gtk.Grid dateTimeMarginsGrid = new Gtk.Grid();
        Gtk.SpinButton  dateTimeMarginLeftEntry = new Gtk.SpinButton.with_range(0,2000, 5);
        Gtk.SpinButton dateTimeMarginRightEntry = new Gtk.SpinButton.with_range(0,2000, 5);
        Gtk.SpinButton dateTimeMarginTopEntry = new Gtk.SpinButton.with_range(0,2000, 5);
        Gtk.SpinButton dateTimeMarginBottomEntry = new Gtk.SpinButton.with_range(0,2000, 5);

        Gtk.Label dateTimePositionLabel = new Gtk.Label("Position:");
        Gtk.ComboBoxText dateTimePositionComboBox = new Gtk.ComboBoxText();

        Gtk.Label dateTimeAlignmentLabel = new Gtk.Label("Alignment:");
        Gtk.ComboBoxText dateTimeAlignmentComboBox = new Gtk.ComboBoxText();

        Gtk.ComboBoxText dateTimeAlwaysOnTopComboBox = new Gtk.ComboBoxText();

        Gtk.Label dateTimeColorLabel = new Gtk.Label("Color and Alpha:");
        Gtk.Box dateTimeColorBox = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 10);
        Gtk.ColorButton dateTimeColorButton = new Gtk.ColorButton.with_rgba({222, 222, 222, 255});
        Gtk.SpinButton dateTimeAlphaEntry = new Gtk.SpinButton.with_range(0, 255, 1) { value = 255 };

        Gtk.Label dateTimeShadowColorLabel = new Gtk.Label("Shadow Color and Alpha:");
        Gtk.Box dateTimeShadowColorBox = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 10);
        Gtk.ColorButton dateTimeShadowColorButton = new Gtk.ColorButton.with_rgba({222, 222, 222, 255});    
        Gtk.SpinButton dateTimeShadowAlphaEntry = new Gtk.SpinButton.with_range(0, 255, 1) { value = 255 };

        Gtk.Label timeFontLabel = new Gtk.Label("Time Font:");
        Gtk.FontButton timeFontButton = new Gtk.FontButton.with_font("Lato Light 30") { use_font = true };

        Gtk.Label dateFontLabel = new Gtk.Label("Date Font:");
        Gtk.FontButton dateFontButton = new Gtk.FontButton.with_font("Lato Light 20") { use_font = true };

        // Asset (Layer)
        Gtk.Label assetTitleLabel = new Gtk.Label("") {margin_top = 15};

        Gtk.ComboBoxText assetVisibleComboBox = new Gtk.ComboBoxText();

        Gtk.Label assetAnimationLabel = new Gtk.Label("Animation Mode & Speed:");
        Gtk.Box assetAnimationBox = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 10);
        Gtk.ComboBoxText assetModeComboBox = new Gtk.ComboBoxText();
        Gtk.SpinButton assetSpeedEntry = new Gtk.SpinButton.with_range(100, 1000, 1);

        public OptionsPage() {

            spacing = 10;
            orientation = Gtk.Orientation.HORIZONTAL;
            halign = Gtk.Align.CENTER;
            valign = Gtk.Align.CENTER;
            hexpand = true;
            vexpand = true;

            videoPlayer.set_size_request(600, 400);
            videoPlayer.halign = Gtk.Align.CENTER;
            videoPlayer.halign = Gtk.Align.START;

            wallpaperBox.margin = 20;
            wallpaperBox.margin_end = 0;
            wallpaperBox.valign = Gtk.Align.CENTER;
            wallpaperBox.halign = Gtk.Align.START;

            dateTimeBox.hexpand = true;
            dateTimeBox.vexpand = true;
            dateTimeBox.halign = Gtk.Align.CENTER;
            dateTimeBox.valign = Gtk.Align.CENTER;

            Clutter.BoxLayout cBoxLayout = new Clutter.BoxLayout ();
            cBoxLayout.set_orientation (Clutter.Orientation.VERTICAL);
            cBoxLayout.set_spacing (5);

            cDateTimeBox.set_layout_manager (cBoxLayout);
            cDateTimeBox.x_expand = true;
            cDateTimeBox.y_expand = true;
            cDateTimeBox.set_x_align(Clutter.ActorAlign.CENTER);
            cDateTimeBox.set_y_align(Clutter.ActorAlign.CENTER);
            cDateTimeBox.set_margin({0,0,0,0});

            scrolledWindow.hscrollbar_policy = Gtk.PolicyType.NEVER;

            optionsBox.margin = 20;
            optionsBox.margin_start = 0;
            optionsBox.halign = Gtk.Align.START;
            optionsBox.hexpand = true;

            wallpaperTitleLabel.set_markup("<span font='Lato Light 15'>Wallpaper Options:</span>");

            wallpaperParallaxComboBox.append("enable", "Enable parallax");
            wallpaperParallaxComboBox.append("disable", "Disable parallax");
            wallpaperParallaxComboBox.active = 1;

            dateTimeTitleLabel.set_markup("<span font='Lato Light 15'>Date &amp; Time Options:</span>");

            dateTimeVisibleComboBox.append("show", "Show date & time");
            dateTimeVisibleComboBox.append("hide", "Hide date & time");
            dateTimeVisibleComboBox.active = 0;

            dateTimeParallaxComboBox.append("enable", "Enable parallax");
            dateTimeParallaxComboBox.append("disable", "Disable parallax");
            dateTimeParallaxComboBox.active = 1;

            dateTimePositionComboBox.append_text("Top Left");
            dateTimePositionComboBox.append_text("Top Center");
            dateTimePositionComboBox.append_text("Top Right");
            dateTimePositionComboBox.append_text("Center Left");
            dateTimePositionComboBox.append_text("Center");
            dateTimePositionComboBox.append_text("Center Right");
            dateTimePositionComboBox.append_text("Bottom Left");
            dateTimePositionComboBox.append_text("Bottom Center");
            dateTimePositionComboBox.append_text("Bottom Right");
            dateTimePositionComboBox.active = 4;

            dateTimeAlignmentComboBox.append_text("Start");
            dateTimeAlignmentComboBox.append_text("Center");
            dateTimeAlignmentComboBox.append_text("End");
            dateTimeAlignmentComboBox.active = 1;

            dateTimeAlwaysOnTopComboBox.append("enable", "Always show on top");
            dateTimeAlwaysOnTopComboBox.append("disable", "Show under layer");
            dateTimeAlwaysOnTopComboBox.active = 0;

            assetTitleLabel.set_markup("<span font='Lato Light 15'>Layer Options:</span>");

            assetVisibleComboBox.append("show", "Show layer");
            assetVisibleComboBox.append("hide", "Hide layer");
            assetVisibleComboBox.active = 0;


            assetModeComboBox.append("noanimation", "No Animation");
            assetModeComboBox.append("light", "Glowing Light");
            assetModeComboBox.append("clouds", "Moving Clouds");
            assetModeComboBox.active = 0;

            timeText.set_line_alignment (Pango.Alignment.CENTER);
            dateText.set_line_alignment (Pango.Alignment.CENTER);

            // Signals
            wallpaperParallaxComboBox.changed.connect(() => updateUI());
            dateTimeVisibleComboBox.changed.connect(() => updateUI());
            dateTimeParallaxComboBox.changed.connect(() => updateUI());
            dateTimeMarginTopEntry.changed.connect(() => updateUI());
            dateTimeMarginRightEntry.changed.connect(() => updateUI());
            dateTimeMarginLeftEntry.changed.connect(() => updateUI());
            dateTimeMarginBottomEntry.changed.connect(() => updateUI());
            dateTimePositionComboBox.changed.connect(() => updateUI());
            dateTimeAlignmentComboBox.changed.connect(() => updateUI());
            dateTimeColorButton.color_set.connect(() => updateUI());
            dateTimeAlphaEntry.changed.connect(() => updateUI());
            timeFontButton.font_set.connect(() => updateUI());
            dateFontButton.font_set.connect(() => updateUI());

            // Add widgets
            dateTimeBox.add(timeLabel);
            dateTimeBox.add(dateLabel);

            cDateTimeBox.add_child(timeText);
            cDateTimeBox.add_child(dateText);

            if(wallpaperType == "video"){
                videoPlayer.add_child(cDateTimeBox);
                overlay.add(videoPlayer);
                //overlay.add_overlay(dateTimeBox);
            } else {
                overlay.add(wallpaperImage);
                overlay.add_overlay(dateTimeBox);
                overlay.add_overlay(assetImage);
            }

            wallpaperBox.add(overlay);

            dateTimeMarginsGrid.attach(dateTimeMarginTopEntry, 0, 0);
            dateTimeMarginsGrid.attach(dateTimeMarginRightEntry, 0, 1);
            dateTimeMarginsGrid.attach(dateTimeMarginLeftEntry, 1, 0);
            dateTimeMarginsGrid.attach(dateTimeMarginBottomEntry, 1, 1);

            if(wallpaperType == "image") {
                optionsBox.add(wallpaperTitleLabel);
                optionsBox.add(wallpaperParallaxComboBox);
            }

            optionsBox.add(dateTimeTitleLabel);

            optionsBox.add(dateTimeVisibleComboBox);
            optionsBox.add(dateTimeParallaxComboBox);

            optionsBox.add(dateTimePositionLabel);
            optionsBox.add(dateTimePositionComboBox);

            optionsBox.add(dateTimeMarginsLabel);
            optionsBox.add(dateTimeMarginsGrid);

            optionsBox.add(dateTimeAlignmentLabel);
            optionsBox.add(dateTimeAlignmentComboBox);

            optionsBox.add(dateTimeAlwaysOnTopComboBox);

            // Date time
            optionsBox.add(dateTimeColorLabel);

            dateTimeColorBox.add(dateTimeColorButton);
            dateTimeColorBox.add(dateTimeAlphaEntry);

            optionsBox.add(dateTimeColorBox);

            // Date time shadow 
            optionsBox.add(dateTimeShadowColorLabel);

            dateTimeShadowColorBox.add(dateTimeShadowColorButton);
            dateTimeShadowColorBox.add(dateTimeShadowAlphaEntry);

            optionsBox.add(dateTimeShadowColorBox);

            // Time Font
            optionsBox.add(timeFontLabel);
            optionsBox.add(timeFontButton);

            // Date Font
            optionsBox.add(dateFontLabel);
            optionsBox.add(dateFontButton);
       


            if(wallpaperType == "image") {

                optionsBox.add(assetTitleLabel);
                optionsBox.add(assetVisibleComboBox);
                optionsBox.add(assetAnimationLabel);
                assetAnimationBox.add(assetModeComboBox);
                assetAnimationBox.add(assetSpeedEntry);
                optionsBox.add(assetAnimationBox);
            }

            scrolledWindow.add(optionsBox);

            pack_start(wallpaperBox);
            pack_start(scrolledWindow);

            // Post-show options
            setDateTimeLabel();

            foreach(var child in optionsBox.get_children())
                child.halign = Gtk.Align.START;

            // Update DateTimeBoxPosition in case of change
            videoPlayer.size_changed.connect(()=>refreshDateTimeBoxPosition());
            cDateTimeBox.notify["size"].connect (() => refreshDateTimeBoxPosition());
            // cDateTimeBox.notify["x_align"] and ["y_align"] does not work, we need to call refreshDataTimeBoxPosition manually!
            dateText.notify["text"].connect(() => refreshDateTimeBoxPosition());
            timeText.notify["text"].connect(() => refreshDateTimeBoxPosition());
            refreshDateTimeBoxPosition();
        }

        public void updateUI () {

            wallpaperParallax = wallpaperParallaxComboBox.get_active_id() == "enable";

            showDateTime = dateTimeVisibleComboBox.get_active_id() == "show";
            dateTimeParallax = dateTimeParallaxComboBox.get_active_id() == "enable";
            
            marginTop = dateTimeMarginTopEntry.text.to_int();
            marginRight = dateTimeMarginRightEntry.text.to_int();
            marginLeft = dateTimeMarginLeftEntry.text.to_int();
            marginBottom = dateTimeMarginBottomEntry.text.to_int();

            dateTimeBox.opacity = showDateTime ? 255 : 0;
            dateTimeBox.visible = false;

            cDateTimeBox.opacity = showDateTime ? 255 : 0;

            // Margins
            dateTimeBox.margin_top = marginTop;
            dateTimeBox.margin_end = marginRight;
            dateTimeBox.margin_start = marginLeft;
            dateTimeBox.margin_bottom = marginBottom;

            cDateTimeBox.margin_top = marginTop;
            cDateTimeBox.margin_right = marginRight;
            cDateTimeBox.margin_left = marginLeft;
            cDateTimeBox.margin_bottom = marginBottom;
             
            setPosition();
            setAlignment();

            dateTimeAlwaysOnTop = dateTimeAlwaysOnTopComboBox.get_active_id() == "enable";

            setColor();
            setFonts();
            setOpacity();

            showAsset = assetVisibleComboBox.get_active_id() == "show";
            assetImage.opacity = showAsset ? 255 : 0;

            setAnimationMode();
            animationSpeed = assetSpeedEntry.text.to_int();

            setDateTimeLabel(dateTimeColor, timeFont, dateFont);
            show_all();
        }

        public void refreshDateTimeBoxPosition(){
            float xNew = 0;
            float yNew = 0;
            
            switch(cDateTimeBox.get_x_align ()){
                case Clutter.ActorAlign.FILL:
                    xNew += 0;
                    break;
                case Clutter.ActorAlign.START:
                    xNew += 0;
                    break;
                case Clutter.ActorAlign.CENTER:
                    xNew += 0.5f*(videoPlayer.get_width()-cDateTimeBox.get_width());
                    break;
                case Clutter.ActorAlign.END:
                    xNew += videoPlayer.get_width()-cDateTimeBox.get_width();
                    break;
                }
            switch(cDateTimeBox.get_y_align ()){
                case Clutter.ActorAlign.FILL:
                    yNew += 0;
                    break;
                case Clutter.ActorAlign.START:
                    yNew += 0;
                    break;
                case Clutter.ActorAlign.CENTER:
                    yNew += 0.5f*(videoPlayer.get_height()-cDateTimeBox.get_height());
                    break;
                case Clutter.ActorAlign.END:
                    yNew += videoPlayer.get_height()-cDateTimeBox.get_height();
                    break;
                }
            cDateTimeBox.set_position (xNew, yNew);
        }

        public void setPosition() {

            var active = dateTimePositionComboBox.get_active_text();

            position = active.replace(" ", "_").down();

            switch (active) {

                case "Top Left":
                    dateTimeBox.halign = Gtk.Align.START;
                    dateTimeBox.valign = Gtk.Align.START;
                    cDateTimeBox.set_x_align(Clutter.ActorAlign.START);
                    cDateTimeBox.set_y_align(Clutter.ActorAlign.START);
                break;
                case "Top Center":
                    dateTimeBox.halign = Gtk.Align.CENTER;
                    dateTimeBox.valign = Gtk.Align.START;
                    cDateTimeBox.set_x_align(Clutter.ActorAlign.CENTER);
                    cDateTimeBox.set_y_align(Clutter.ActorAlign.START);
                break;
                case "Top Right":
                    dateTimeBox.halign = Gtk.Align.END;
                    dateTimeBox.valign = Gtk.Align.START;
                    cDateTimeBox.set_x_align(Clutter.ActorAlign.END);
                    cDateTimeBox.set_y_align(Clutter.ActorAlign.START);
                break;
                case "Center Right":
                    dateTimeBox.halign = Gtk.Align.END;
                    dateTimeBox.valign = Gtk.Align.CENTER;
                    cDateTimeBox.set_x_align(Clutter.ActorAlign.END);
                    cDateTimeBox.set_y_align(Clutter.ActorAlign.CENTER);
                break;

                case "Center":
                    dateTimeBox.halign = Gtk.Align.CENTER;
                    dateTimeBox.valign = Gtk.Align.CENTER;
                    cDateTimeBox.set_x_align(Clutter.ActorAlign.CENTER);
                    cDateTimeBox.set_y_align(Clutter.ActorAlign.CENTER);
                break;

                case "Center Left":
                    dateTimeBox.halign = Gtk.Align.START;
                    dateTimeBox.valign = Gtk.Align.CENTER;
                    cDateTimeBox.set_x_align(Clutter.ActorAlign.START);
                    cDateTimeBox.set_y_align(Clutter.ActorAlign.CENTER);
                break;

                case "Bottom Right":
                    dateTimeBox.halign = Gtk.Align.END;
                    dateTimeBox.valign = Gtk.Align.END;
                    cDateTimeBox.set_x_align(Clutter.ActorAlign.END);
                    cDateTimeBox.set_y_align(Clutter.ActorAlign.END);
                break;

                case "Bottom Center":
                    dateTimeBox.halign = Gtk.Align.CENTER;
                    dateTimeBox.valign = Gtk.Align.END;
                    cDateTimeBox.set_x_align(Clutter.ActorAlign.CENTER);
                    cDateTimeBox.set_y_align(Clutter.ActorAlign.END);
                break;

                case "Bottom Left":
                    dateTimeBox.halign = Gtk.Align.START;
                    dateTimeBox.valign = Gtk.Align.END;
                    cDateTimeBox.set_x_align(Clutter.ActorAlign.START);
                    cDateTimeBox.set_y_align(Clutter.ActorAlign.END);
                break;

                default:
                break;
            }
        }


        public void setAlignment() {

            alignment = dateTimeAlignmentComboBox.get_active_text().down();

            if(alignment == "start"){
                timeLabel.halign = Gtk.Align.START;
                timeText.set_x_align(Clutter.ActorAlign.START);
            }
            else if(alignment == "center"){
                timeLabel.halign = Gtk.Align.CENTER;
                timeText.set_x_align(Clutter.ActorAlign.CENTER);
            }
            else{
                timeLabel.halign = Gtk.Align.END;
                timeText.set_x_align(Clutter.ActorAlign.END);
            }
        }

        private void setColor() {

            Gdk.RGBA rgba = dateTimeColorButton.rgba;
            dateTimeColor = rgbaToHex(rgba);

            rgba = dateTimeShadowColorButton.rgba;
            shadowColor = rgbaToHex(rgba);
        }

        private void setFonts() {

            timeFont = timeFontButton.get_font_name ();
            dateFont = dateFontButton.get_font_name ();
        }

        private void setOpacity() {

            var alpha = dateTimeAlphaEntry.text.to_double();
            timeLabel.opacity = dateLabel.opacity = alpha / 255;
            timeText.opacity = dateText.opacity = (uint)alpha;
            dateTimeAlpha = (int) alpha;

            alpha = dateTimeShadowAlphaEntry.text.to_int();
            shadowAlpha = (int)alpha;
        }

        public void setImage(string path) {

            wallpaperImage.pixbuf = new Gdk.Pixbuf.from_file_at_scale(path, 600, 400, true);
        }

        public void setAsset(string path) {

            assetImage.pixbuf = new Gdk.Pixbuf.from_file_at_scale(path, 600, 400, true);
        }

        public void setVideo(string path){
            var videoPath = "file://" + path;
            videoPlayer.set_video_uri(videoPath);
            videoPlayer.set_playing(true);
            videoPlayer.set_looping(true);
        }

        public void setAnimationMode() {

            animationMode = assetModeComboBox.get_active_id();

        }

        private void setDateTimeLabel(string color = "white", string timeFont = "Lato Light 30",
                                      string dateFont = "Lato Light 20") {

            timeText.set_markup (@"<span color='$color' font='$timeFont'>10:21 PM</span>");
            dateText.set_markup (@"<span color='$color' font='$dateFont'>Sunday, August 22</span>");
            timeLabel.set_markup(@"<span color='$color' font='$timeFont'>10:21 PM</span>");
            dateLabel.set_markup(@"<span color='$color' font='$dateFont'>Sunday, August 22</span>");
        }

        private string rgbaToHex(Gdk.RGBA rgba) {
            return "#%02x%02x%02x".printf((int)(rgba.red*255), (int)(rgba.green*255), (int)(rgba.blue*255));
        }  
    }
}
