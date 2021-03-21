#!/bin/sh

ipfs init
ipfs daemon &
waitForIpfs
ipfs pin remote service add origin $ENDPOINT $ACCESS_TOKEN
CID=$(ipfs add -r -q $UPLOAD_PATH | tail -1)
ipfs pin remote add --service=origin --name=$NAME $CID

echo "::set-output name=cid::$CID"