#!/bin/bash
# Class Lab – Bash Commands
# 1. List all running nginx processes
ps -C nginx -o pid,cmd

# 2. Kill all processes named my_script.sh
pkill -f my_script.sh

# 3. Run backup.sh in background after logout
nohup ./backup.sh > backup.log 2>&1 &

# 4. Get PID of sshd
pidof sshd

# 5. View process hierarchy
pstree -p

# 6. List open files for PID 1234
lsof -p 1234

# 7. Check docker daemon status
systemctl is-active docker

# 8. Run heavy_calc.sh with lowest priority
nice -n 19 ./heavy_calc.sh

# 9. Recursive copy directory
cp -r /var/www/html /backup/

# 10. Copy file preserving attributes
cp -a secret.key /tmp/

# 11. Sync directories using rsync
rsync -au src/ dest/

# 12. Copy only newer files
cp -u dir1/* dir2/

# 13. Copy file to remote server
scp app.conf user@192.168.1.50:/etc/

# 14. Archive and compress logs
tar -czf var-log.tar.gz /var/log

# 15. Find files larger than 500MB
find /home -type f -size +500M

# 16. Find files modified in last 7 days
find /var/log -type f -mtime -7

# 17. Find files owned by user jenkins
find /tmp -type f -user jenkins

# 18. Delete empty directories
find /data -type d -empty -delete

# 19. Find files with 777 permissions
find . -maxdepth 1 -type f -perm 0777

# 20. Find and copy jpg files
find . -maxdepth 1 -type f -name "*.jpg" -exec cp {} /images/ \;

# 21. Extract email addresses
grep -Eo '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' contacts.txt

# 22. Case-insensitive search for error
grep -i "error" syslog

# 23. Lines starting with root
grep '^root' config.ini

# 24. Invert match for IP
grep -v "192.168.1.1" access.log

# 25. Recursive grep TODO
grep -R "TODO" .

# 26. Replace localhost with 127.0.0.1
sed -i 's/localhost/127.0.0.1/g' hosts.txt

# 27. Show file without comments
grep -v '^#' config.conf

# 28. Find IPv4 addresses
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' file.txt

# 29. Show processes running as root
ps aux | grep '^root'

# 30. Find log files containing "Critical"
find . -type f -name "*.log" -exec grep -l "Critical" {} \;
