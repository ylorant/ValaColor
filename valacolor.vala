public class ValaColor
{
	public void run ()
	{
		// The dialog
		Gtk.ColorChooserDialog dialog = new Gtk.ColorChooserDialog ("ValaColor", null);
		
		dialog.response.connect ((response_id) =>
		{
			if (response_id == Gtk.ResponseType.OK)
			{
				Gdk.RGBA color = dialog.get_rgba ();
				string color_str = "#%02X%02X%02X".printf ((uint)(color.red * 255), (uint)(color.green * 255), (uint)(color.blue * 255));
			
				Gtk.Clipboard clipboard = Gtk.Clipboard.get_for_display (Gdk.Display.get_default (), Gdk.SELECTION_CLIPBOARD);
				clipboard.set_text (color_str, -1);
			}
			

			dialog.close ();
			if (response_id == Gtk.ResponseType.DELETE_EVENT)
				Gtk.main_quit ();
		});
		
		dialog.run ();
	}

	public static int main (string[] args)
	{
		Gtk.init (ref args);

		ValaColor app = new ValaColor ();
		app.run ();
		Gtk.main ();
		return 0;
	}
}
