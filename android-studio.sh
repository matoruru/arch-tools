sudo pacman -S jdk-openjdk
yay -S android-platform android-sdk android-sdk-platform-tools android-sdk-build-tools aosp-devel

sudo groupadd sdkusers
sudo gpasswd -a matoruru sdkusers
chown -R :sdkusers /opt/android-sdk/
sudo chown -R :sdkusers /opt/android-sdk/
sudo chmod -R g+w /opt/android-sdk/
