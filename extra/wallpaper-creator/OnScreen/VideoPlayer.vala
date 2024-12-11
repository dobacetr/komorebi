namespace WallpaperCreator.OnScreen {
public class VideoPlayer : Gtk.EventBox {

    
    public signal void size_changed(Clutter.Size newSize);

    protected Clutter.Stage stage { get; private set; }
    protected Clutter.Actor videoActor { get; private set; }
    protected ClutterGst.Playback playback { get; set; }

    protected GtkClutter.Embed embed;

    private bool isLooping = false;

    public VideoPlayer(int width=600, int height=400) {

        embed = new GtkClutter.Embed ();

        // Prepare the stage
        stage = (Clutter.Stage) embed.get_stage ();
        stage.background_color = {0, 0, 0, 0};
        playback = new ClutterGst.Playback ();
        playback.set_seek_flags (ClutterGst.SeekFlags.ACCURATE);

        ClutterGst.Content videoContent = new ClutterGst.Content();

        videoContent.player = playback;

        videoActor = new Clutter.Actor ();
        videoActor.set_content(videoContent);
        videoActor.height = height;
        videoActor.width = width;
        stage.set_size (width, height);

        stage.add_child (videoActor);
    
        add (embed);
        show_all ();

        stage.notify["size"].connect(()=>size_changed(stage.size));

        playback.notify["progress"].connect_after(()=>{
            on_progress();
        });
    }


    public void add_child(Clutter.Actor child){
        stage.add_child(child);
    }

    public bool get_playing(){
        return playback.get_playing();
    }

    public void set_playing(bool inPlaying){
        if (playback.playing!=inPlaying){
            playback.set_playing(inPlaying);
        }
    }

    private void on_progress(){
        if(isLooping){
            if(playback.progress >= 1.0) {
                playback.progress = 0.0;
                playback.playing = true;
            }
        }
    }

    public void set_looping(bool inLooping){
        
        if(isLooping==inLooping){
            return;
        }
        isLooping = inLooping;
    }

    public void get_position(out float x, out float y){
        stage.get_position(out x,out y);
    }
    
    public double get_progress () {
        return playback.progress;
    }

    public void set_video_uri(string inUri){
        playback.uri = inUri;
    }

    public float get_width(){
        return stage.get_width();
    }

    public float get_height(){
        return stage.get_height();
    }

}
}