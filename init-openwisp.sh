#! /bin/sh

mkdir /dev/net
mknod /dev/net/tun c 10 200

sed \
  -i /etc/config/openwisp \
  -e "s+option url '.*+option url '${OPENWISP_URL}'+g" \
  -e "s+option uuid '.*+option uuid '${OPENWISP_UUID}'+g" \
  -e "s+option key '.*+option key '${OPENWISP_KEY}'+g"

if ! grep "INIT-OPENWISP DONE" /usr/sbin/openwisp_config > /dev/null; then
  sed \
    -i /usr/sbin/openwisp_config \
    -e 's+\(FETCH_COMMAND=".*\) --capath $CAPATH"+if echo $URL | grep http:// > /dev/null; then \1"; else \1 --capath $CAPATH"; fi+g'
  echo "# INIT-OPENWISP DONE" >> /usr/sbin/openwisp_config
fi

exec /sbin/init
