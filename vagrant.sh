set -e
set -x

wget http://apache.mirror.anlx.net/maven/maven-3/3.2.1/binaries/apache-maven-3.2.1-bin.tar.gz
tar -zxf apache-maven-3.2.1-bin.tar.gz
export PATH=${PATH}:$PWD/apache-maven-3.2.1/bin
sudo apt-get update
echo yes | sudo apt-get install python-software-properties
echo yes | sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true |  sudo debconf-set-selections
echo yes | sudo apt-get install --force-yes libgd2-xpm ia32-libs ia32-libs-multiarch xvfb oracle-java7-installer
Xvfb :99 -ac -screen 0 1024x768x24 &
export DISPLAY=:99.0
cd /vagrant
mvn -e install -Dtycho.showEclipseLog=true -Dtarget.platform=kepler
