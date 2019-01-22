install_java() {
  local version="$1"
  local dir="$2"
  local download_url="http://download.oracle.com/otn-pub/java/jdk/11.0.2+9/f51449fcd52f4d52b93a989c5c56ed3c/jdk-11.0.2_linux-x64_bin.tar.gz"
  local download_url_old="https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz"
  echo "Downloading JAVA [$download_url]"
  curl  --silent --fail --retry 5 --retry-max-time 15 -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "$download_url" -o /tmp/java.tar.gz || (echo "Unable to download java; does it exist?" && false)
  echo "Download complete!"

  echo "Installing JAVA"
  mkdir /tmp/jdk
  mkdir $dir
  tar xzf /tmp/java.tar.gz -C /tmp/jdk
  rm -rf $dir/*
  mv /tmp/jdk/jdk11.0.2/* $dir
  chmod +x $dir/bin
  echo "Installation complete!"	
}