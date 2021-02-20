## Setup Automator

* Automator
* New Quick Action
* Run AppleScript
* Paste code from below
* Save "Generate Email"

## Setup Keyboard shortcut

* System Preferences
* Keyboard
* Shortcuts
* Services
* Generate Email
* control + command + e

## Code

Download the [Sluggify Binary](./bin/slugify) from this repo.

```applescript
on randomString(aLength)
	set randomChars to {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}
	set aString to ""
	
	repeat aLength times
		set aString to aString & some item of randomChars
	end repeat
	
	return aString
end randomString

on appName()
	tell application "System Events"
		set frontmostProcess to first process where it is frontmost
		set appName to name of frontmostProcess
	end tell
	if appName is equal to "Safari" then
		tell application "Safari"
			return the URL of the current tab of the front window
		end tell
	else if appName is equal to "Google Chrome" then
		tell application "Google Chrome"
			return the URL of the active tab of the front window
		end tell
	end if
	return appName
end appName

on appNameSlug(aLength)
	set commandString to "~/.bin/slugify \"" & appName() & "\" | cut -c -" & aLength as string
	return do shell script commandString
end appNameSlug

on run {input, parameters}
	set email to randomString(5) & "." & appNameSlug(15) & "@privaterelay.example.com"
	set the clipboard to email
	tell application "System Events" to keystroke "v" using command down
	(* tell application "System Events" to keystroke email *)
	do shell script "afplay /System/Library/Sounds/Bottle.aiff"
	return input
end run
```
