set -euo pipefail
URL=http://localhost:8080/api/text/ci-smoke-test
# post
echo "hello-ci" | curl -sS -X POST -H "Content-Type: text/plain" --data-binary @- "$URL" -o /tmp/post.out || { cat ci-artifacts/server_ci.log || true; exit 1; }
# get
curl -fsS "$URL" -o /tmp/get.out || { cat ci-artifacts/server_ci.log || true; exit 1; }
if ! grep -q "hello-ci" /tmp/get.out; then
  echo "persist GET mismatch" >&2
  cat /tmp/get.out
  exit 2
fi
# delete by posting empty body
curl -sS -X POST -H "Content-Type: text/plain" --data-binary @- "$URL" </dev/null || true
sleep 0.5
if curl -fsS "$URL" | grep -q '.'; then
  echo "delete failed" >&2
  exit 3
fi
