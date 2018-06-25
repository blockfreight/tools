# Checking if docker is installed
if ! [ -x "$(command -v docker)" ]; then
  echo 'Error: docker is not installed.' >&2
  exit 1
fi

# Downloading Tendermint Docker Image
docker pull tendermint/tendermint:0.20.0

# Downloading Blockfreight Docker Image
docker pull blockfreight/go-bftx:rc1

