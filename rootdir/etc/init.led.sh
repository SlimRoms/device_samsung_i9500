#!/system/bin/sh

echo "Force Disable Pulsing LED..."
echo 0 > /sys/class/sec/led/led_pattern
