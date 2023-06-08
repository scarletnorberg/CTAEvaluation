echo "======================================"
echo " calyptia-fluentd Installation Script "
echo "======================================"
echo "This script requires superuser access to install apt packages."
echo "You will be prompted for your password by sudo."

# clear any previous sudo permission
sudo -k

if [ -f /etc/system-release-cpe ]; then
    distribution=$(cat /etc/system-release-cpe | awk '{print substr($0, index($1, "o"))}' | cut -d: -f2)
    version=$(cat /etc/system-release-cpe | awk '{print substr($0, index($1, "o"))}' | cut -d: -f4)
fi

major_version=0
release_ver="7"
case "$distribution" in
    "redhat")
	rhel_ver=$(rpm --eval '%{?rhel:%{rhel}}%{!?rhel:8}')
	major_version=${rhel_ver}
	;;
    *)
	centos_ver=$(rpm --eval '%{?centos_ver:%{centos_ver}}%{!?centos_ver:8}')
	major_version=${centos_ver}
	;;
esac


# run inside sudo
sudo sh <<SCRIPT
  curl --output /tmp/calyptia-fluentd-yum-release-2021.5.1-release.noarch.rpm https://calyptia-fluentd.s3.us-east-2.amazonaws.com/1/redhat/${major_version}/calyptia-fluentd-yum-release-2021.5.1-release.noarch.rpm
  yum install -y /tmp/calyptia-fluentd-yum-release-2021.5.1-release.noarch.rpm
  rm /tmp/calyptia-fluentd-yum-release-2021.5.1-release.noarch.rpm

  # update your sources
  yum check-update

  # install the calyptia-fluentd package
  yum install -y calyptia-fluentd-${release_ver}

SCRIPT

# message
if [ $? -eq 0 ]; then
  echo ""
  echo "Installation completed. Happy Logging!"
  echo ""
else
  echo ""
  echo "Installation incompleted. Check above messages."
  echo ""
fi
