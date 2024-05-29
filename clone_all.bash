mkdir sys_ws
cd sys_ws

URL_PREFIX=https://github.com/SaddlebackCollegeRobotics/

echo "Cloning base station..."
git clone $URL_PREFIX/base-station-gui.git -q
cd base-station-gui
git pull 
cd ..

echo "Cloning autonomy..."
git clone $URL_PREFIX/autonomy_2023_24.git -q
cd autonomy_2023_24
git pull 
cd ..

echo "Cloning televideo..."
git clone $URL_PREFIX/televideo_2023_24.git -q
cd televideo_2023_24
git pull 
cd ..

echo "Cloning science..."
git clone $URL_PREFIX/science_2023_24.git -q
cd science_2023_24
git pull 
cd ..

echo "Cloning arm..."
git clone $URL_PREFIX/arm_2023_24.git -q
cd arm_2023_24
git pull 
cd ..

echo "Cloning drive..."
git clone $URL_PREFIX/drive_2023_24.git -q
cd drive_2023_24
git pull 
cd ..


rosdep install -i --from-paths .