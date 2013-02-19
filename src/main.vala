using Gtk;
using GLib;

public class Main : Object {

  private static const string VERSION = "0.0.0";

  private static bool version;
  private static string? maildir = "~/Maildir";
	[CCode (array_length = false, array_null_terminated = true)]
	private static string[]? folders = {"INBOX", null};

  private const GLib.OptionEntry[] options = {
		{ "version", 'v', 0, OptionArg.NONE, ref version, "Display version number",
      null },

    { "maildir", 'm', 0, OptionArg.FILENAME, ref maildir,
      "Path to maildir, defaults to ~/Maildir", "DIRECTORY" },

    { "folder", 'f', 0, OptionArg.FILENAME_ARRAY, ref folders,
      "List of folders names to watch, defaults to INBOX", "FOLDER..."},

		{ null }
	};

  public static int main (string[] args) {
    try {
			var ctx = new OptionContext ("- It's pretty much what you think.");
			ctx.set_help_enabled(true);
			ctx.add_main_entries (options, null);
			ctx.parse(ref args);

      if(version) {
        stderr.printf("maildirnotify-%s\n", Main.VERSION);
        return 0;
      }

		} catch (OptionError e) {
			stderr.printf("error: %s\n", e.message);
			stderr.printf("Run '%s --help' to see a full list of available command line options.\n",
                    args[0]);
			return 1;
		}

    // TODO: Something useful.

    return 0;
  }
}