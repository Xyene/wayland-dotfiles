#!/usr/bin/python

import i3ipc
import time

i3 = i3ipc.Connection()

cur_window = None
def on_window_focus(conn, event):
    global cur_window
    if cur_window and cur_window.window_class == u'UXTerm':
        for i in range(100, 85, -1):
            cur_window.command('opacity %.2f' % (i / 100.))
            time.sleep(0.0025)
    cur_window = event.container

    if cur_window.window_class == u'UXTerm':
        for i in range(85, 101):
            cur_window.command('opacity %.2f' % (i / 100.))
            time.sleep(0.0025)

try:
    i3.on("window::focus", on_window_focus)
    i3.main()
finally:
    i3.main_quit()

