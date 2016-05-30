using Clutter;

int main(string[] args)
{
    Clutter.init(ref args);
    var stage = new Stage() {width = 512, height = 512 };
    string[] colors = {};

    var file = File.new_for_path ("colors.txt");

    if (!file.query_exists ())
    {
      return 1;
    }

    try
    {
      var dis = new DataInputStream(file.read());
      string line;
      while ((line = dis.read_line (null)) != null)
      {
        colors += line;
      }
    }
    catch (Error e)
    {
      error ("%s", e.message);
    }

    var rectangles = new Rectangle[colors.length];

    var x = 0;
    var y = 0;

    for (int i = 0; i < colors.length; i++) {
      var r = new Rectangle ();

      r.width = 64;
      r.height = 64;

      r.color = Color.from_string (colors[i]);
      r.x = x;
      r.y = y;

      x += 64;

      if (x >= 512)
      {
        x = 0;
        y += 64;
      }

      stage.add_actor (r);

      rectangles[i] = r;
    }

    stage.show_all();
    stage.destroy.connect(Clutter.main_quit);
    Clutter.main();
    return 0;
}
