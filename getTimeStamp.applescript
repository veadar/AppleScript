display dialog my getTimeStamp()

on getTimeStamp()
set localdate to (current date)
set y to year of localdate as number
set m to month of localdate as number
set d to day of localdate as number
set h to hours of localdate as number
set mi to minutes of localdate as number
set ss to seconds of localdate as number

if (count characters of (m as text)) is 1 then set m to "0" & (m as text)
if (count characters of (d as text)) is 1 then set d to "0" & (d as text)
if (count characters of (h as text)) is 1 then set h to "0" & (h as text)
if (count characters of (mi as text)) is 1 then set mi to "0" & (mi as text)
if (count characters of (ss as text)) is 1 then set ss to "0" & (ss as text)

set msg to y & m & d & h & mi & ss
return msg as text
end getTimeStamp

-- Snow Leopard, Mac OS X 10.6
-- http://blog.goo.ne.jp/vallie/e/ee29958d856db4b3f4893eaa40f74e30