#!/bin/bash -v

# Verbose and exit on errors
set -ex

# Do additional tasks that are common across all images, 
# but not suitable for inclusion in install.sh
echo "Running install_common.sh"

# Limit the maximum length of systemd-journald logs
mkdir -p /etc/systemd/journald.conf.d
cat > /etc/systemd/journald.conf.d/60-limit-log-size.conf <<EOF
# Added by Photonvision to keep the logs to a reasonable size
[Journal]
SystemMaxUse=100M
EOF

# Add a helpful message to the logon screen
# ASCII Art generated by: https://www.asciiart.eu/image-to-ascii
cp -f ./files/issue.txt /etc/issue
cp -f /etc/issue /etc/issue.net
sed -i 's/#Banner none/Banner \/etc\/issue.net/g' /etc/ssh/sshd_config
