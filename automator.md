* Automator
* New Quick Action
* Run AppleScript
* Paste code from below
* Save "Generate Email"

* System Preferences
* Keyboard
* Shortcuts
* Services
* Generate Email
* control + command + e

```
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
	tell application appName
		return appName & " " & the name of the front window
	end tell
	return appName
end appName

on appNameSlug(aLength)
	set commandString to "~/.bin/slugify \"" & appName() & "\" | cut -c -" & aLength as string
	return do shell script commandString
end appNameSlug

on run {input, parameters}
	set email to randomString(5) & "." & appNameSlug(15)
	tell application "System Events" to keystroke email
	do shell script "afplay /System/Library/Sounds/Bottle.aiff"
	return input
end run
```
