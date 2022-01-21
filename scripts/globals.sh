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

#
# AWS Access Key ID.
#
aws_access_key_id() {
  AWS_ACCESS_KEY_ID="${1}"
}

#
# AWS Secret Access Key.
#
aws_secret_access_key() {
  AWS_SECRET_ACCESS_KEY="${1}"
}

#
# AWS Region.
#
aws_region() {
  AWS_REGION="${1}"
}

#
# AWS Profile.
#
aws_profile() {
  AWS_PROFILE="${1}"
}

#
# Cluster name.
#
cluster_name() {
  CLUSTER_NAME="${1}"
}
