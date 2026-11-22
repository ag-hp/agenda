#!/usr/bin/python3
from pathlib import Path

import gi

gi.require_version("Gtk", "3.0")
gi.require_version("WebKit2", "4.1")
from gi.repository import Gio, GLib, Gtk, WebKit2

APP_ID = "com.agenda.personal"
PAGE = (Path(__file__).resolve().parents[1] / "web" / "index.html").as_uri()


class Agenda(Gtk.Application):
    def __init__(self):
        super().__init__(application_id=APP_ID, flags=Gio.ApplicationFlags.FLAGS_NONE)

    def do_activate(self):
        window = self.get_active_window()
        if window:
            window.present()
            return

        data = Path(GLib.get_user_data_dir()) / APP_ID
        cache = Path(GLib.get_user_cache_dir()) / APP_ID
        manager = WebKit2.WebsiteDataManager(
            base_data_directory=str(data), base_cache_directory=str(cache)
        )
        context = WebKit2.WebContext.new_with_website_data_manager(manager)
        view = WebKit2.WebView.new_with_context(context)
        settings = view.get_settings()
        settings.set_enable_write_console_messages_to_stdout(False)
        settings.set_javascript_can_open_windows_automatically(False)
        view.connect("decide-policy", self.decide_policy)

        window = Gtk.ApplicationWindow(application=self, title="Agenda")
        window.set_default_size(900, 740)
        window.set_size_request(340, 440)
        window.set_icon_name(APP_ID)
        window.add(view)
        window.show_all()
        view.load_uri(PAGE)

    @staticmethod
    def decide_policy(_view, decision, decision_type):
        if decision_type == WebKit2.PolicyDecisionType.NEW_WINDOW_ACTION:
            decision.ignore()
            return True
        if decision_type == WebKit2.PolicyDecisionType.NAVIGATION_ACTION:
            uri = decision.get_navigation_action().get_request().get_uri()
            if uri.partition("#")[0] != PAGE:
                decision.ignore()
                return True
        return False


if __name__ == "__main__":
    raise SystemExit(Agenda().run())
