(*
改行ごとに文字列を配列に入れる
空行は削除
*)

set hoge to "テスト。

↑の空行が削除されて配列に格納される。"

deleteEmptyLine(hoge)

--result -> {"テスト。", "↑の空行が削除されて配列に格納される。"}

on deleteEmptyLine(x) --x文字列
	
	set y to every paragraph of x
	
	set z to {}
	
	repeat with i from 1 to length of y
		if item i of y is not "" then
			set end of z to item i of y
		end if
	end repeat
	
	return z --as string をつければ文章で返る
end deleteEmptyLine