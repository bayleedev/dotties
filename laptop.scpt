# 1) Change the Keyboard Repeat Rate
# 2) Change the Keyboard Repeat Delay
# 3) Change "Caps Lock" key to "Ctrl"
# 4) Use the Dark Menu Bar
# 5) Change the Dock to use the smallest size
# 6) Enable the dock to have magnification when hovering
# 7) Change the dock magnification size
# 8) Let the dock auto hide when not hovering

tell application "System Preferences"
  activate
  set current pane to pane "com.apple.preference.keyboard"
end tell

tell application "System Events"
  tell application process "System Preferences"
    tell first window

      # 1) Change the Keyboard Repeat Rate
      tell tab group 1
        # Delay Until Repeat
        tell slider 1
          set value to 10.0
        end tell

        # 2) Change the Keyboard Repeat Delay
        tell slider 2
          set value to 10.0
        end tell
      end tell

      # 3) Change "Caps Lock" key to "Ctrl"
      tell tab group 1
        click button "Modifier Keys…"
      end tell
      tell sheet 1
        click pop up button 4
        click menu item 2 of menu 1 of pop up button 4
        click button "OK"
      end tell

    end tell
  end tell
end tell

tell application "System Preferences"
  set current pane to pane "com.apple.preference.general"
end tell

tell application "System Events"
  tell application process "System Preferences"
    tell first window
      # 4) Use the Dark Menu Bar
      tell checkbox 3
        set checkboxStatus to value as boolean
        if checkboxStatus is false then click
      end tell
    end tell
  end tell
end tell

tell application "System Preferences"
  set current pane to pane "com.apple.preference.dock"
end tell

tell application "System Events"
  tell application process "System Preferences"
    tell first window

      # 5) Change the Dock to use the smallest size
      tell slider 1
        set value to 0.0
      end tell

      # 6) Enable the dock to have magnification when hovering
      tell checkbox 1
        set checkboxStatus to value as boolean
        if checkboxStatus is false then click
      end tell

      # 7) Change the dock magnification size
      tell slider 2
        set value to 0.5
      end tell

      # 8) Let the dock auto hide when not hovering
      tell checkbox 4
        set checkboxStatus to value as boolean
        if checkboxStatus is false then click
      end tell

    end tell
  end tell
end tell

tell application "System Events"
  tell application "System Preferences" to quit
end tell
