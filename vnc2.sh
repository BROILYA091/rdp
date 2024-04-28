#!/bin/bash

# Обновляем список пакетов
sudo apt-get update -y

# Устанавливаем окружение рабочего стола KDE Plasma
sudo apt-get install kde-plasma-desktop -y

# Устанавливаем VNC сервер
sudo apt-get install tightvncserver -y

# Запускаем VNC сервер, чтобы создать первоначальные настройки
vncserver << EOF
q1qq1q
q1qq1q
n
EOF

# Останавливаем VNC сервер
vncserver -kill :1

# Создаем конфигурационный файл xstartup
echo "
#!/bin/sh
xrdb $HOME/.Xresources
startkde &
" > ~/.vnc/xstartup

# Делаем файл исполняемым
sudo chmod +x ~/.vnc/xstartup

# Запускаем VNC сервер с новыми настройками
vncserver :1