#
# helm installed?
#
helm_installed() {
  installed=$(command -v helm)
  if [ "${installed}" = 1 ]; then
    echo "helm does not appear to be installed. Please see: https://helm.sh/docs/intro/install"
    exit 1
  fi
}
