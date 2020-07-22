set /A curMinute=%TIME:~3,2%
set /A curHour=%TIME:~0,2%
if %curMinute% == 59
(
	set curMinute=0
	if %curHour% == 23
	(
		set curHour=0
	)
	else
	(
		set /A curHour=%curHour%+1
	)
)
else
(
	set /A curMinute=%curMinute%+1
)
if %curHour% LSS 10
(
	set curHour=0%curHour%
)
if %curMinute% LSS 10
(
	set curMinute=0%curMinute%
)

schtasks /Create /SC ONCE /TN test_task /TR "D:\Users\wxwx0\Desktop\lab6\script2_1.bat" /ST %curHour%:%curMinute%
