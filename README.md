# Photoshop Drag Focus Helper

Experimental AutoHotkey v2 helper that activates Photoshop while dragging over the taskbar rectangle.

Windows and AutoHotkey v2 are required. Run PSlistener.ahk manually only when you want
global left-mouse tracking and its 100 ms taskbar timer. Exit through the AHK tray menu.
This checks the whole taskbar rectangle, not the exact Photoshop button. It may activate Photoshop
whenever a drag crosses that rectangle; no startup installation is performed by the source.

The public copy fixes MouseGetPos output references, Screen CoordMode, and explicit global dragging
updates in the two hotkey callbacks. API contracts: [MouseGetPos](https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm)
and [function variable scope](https://www.autohotkey.com/docs/v2/Functions.htm#Global).

See VALIDATION.md for actual checks.
