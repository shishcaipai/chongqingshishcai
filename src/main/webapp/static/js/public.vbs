function numbertomoney(moneyStr)
'将数字格式化为货币形式
	numbertomoney=FormatCurrency(moneyStr,,-1,0,-1)
end function

function moneytonumber(str)
'将货币形式格式化为数字
	moneytonumber=Formatnumber(str,,-1,0,-1)
end function

function mydatediff(interval,date1,date2)
	mydatediff = datediff(interval,date1,date2)
end function

function FormatpercentNumber(num)
	FormatpercentNumber = Formatpercent(num,0,-1,0,-1)
end function