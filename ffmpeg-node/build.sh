IMAGE='octoguild/ffmpeg-nodejs'
NODE_VERSION=18
FFMPEG_VERSION="6.0"

BUILD_VERSION=1

IMAGE_WITH_VERSION="${IMAGE}:${NODE_VERSION}-${FFMPEG_VERSION}"

docker build \
  --squash \
  --build-arg NODE_VERSION="$NODE_VERSION" \
  --build-arg FFMPEG_VERSION="$FFMPEG_VERSION" \
  . \
  -t "$IMAGE_WITH_VERSION" \
  -t "${IMAGE_WITH_VERSION}-${BUILD_VERSION}" \
  -t "${IMAGE}:latest"

