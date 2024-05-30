set +x

sudo touch /etc/udev/rules.d/99-ublox-gnss.rules
echo 'ATTRS{idVendor}=="1546", ATTRS{idProduct}=="01a9", MODE="0666", GROUP="plugdev"' | sudo tee /etc/udev/rules.d/99-ublox-gnss.rules > /dev/null

echo "Wrote udev rule for GPS USB permissions. Please reboot..."