net STOP dnscache
ping –n 1 localhost > nul
net START > services_2.txt
fc services_1.txt services_2.txt > services_diff.txt
net START dnscache