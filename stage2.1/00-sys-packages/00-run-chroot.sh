curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
echo "deb [arch=armhf] https://download.docker.com/linux/debian stretch stable" | tee /etc/apt/sources.list.d/docker.list
apt-get update
