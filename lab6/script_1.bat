mkdir LAB6
wmic OS GET VERSION > LAB6\wmic_os_version.txt
wmic OS GET FreeVirtualMemory,TotalVirtualMemorySize > LAB6\wmic_memory.txt
wmic LOGICALDISK GET Name,Description > LAB6\wmic_disks.txt

mkdir TEST
copy LAB6\* TEST\*

copy LAB6\* full_info.txt

del LAB6\wmic_os_Caption.txt
del LAB6\wmic_os_Memory.txt
del LAB6\wmic_logicaldisk_Discs.txt
del TEST\wmic_os_Caption.txt
del TEST\wmic_os_Memory.txt
del TEST\wmic_logicaldisk_Discs.txt
rmdir LAB6
rmdir TEST
