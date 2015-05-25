set sourceText to "<a href=€"https://github.com/€">github</a>
<a href=€"https://gist.github.com/€">gist</a>
<a href=€"http://veadardiary.blog29.fc2.com/€">my blog</a>"

extractURL(sourceText, "gi") of me

(*
result
{"https://github.com/", "https://gist.github.com/"}
*)

on extractURL(sourceText, filterText)
	set theList to makeList(sourceText, "€"")
	set tmpList to {}
	repeat with i from 1 to number of items in theList
		set this_item to item i of theList
		if this_item contains "http" then
			if this_item does not contain "
" then
				if this_item contains filterText then
					set end of tmpList to this_item
				end if
			end if
		end if
	end repeat
	
	return tmpList
end extractURL

on makeList(theText, theDelimiter) --ƒeƒLƒXƒg‚ğw’èŒê‹å‚Å‹æØ‚è”z—ñ‚ÉŠi”[‚·‚é
	set tmp to AppleScript's text item delimiters
	set AppleScript's text item delimiters to theDelimiter
	set theList to every text item of theText
	set AppleScript's text item delimiters to tmp
	return theList
end makeList