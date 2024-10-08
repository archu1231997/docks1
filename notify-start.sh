#!/bin/bash

# Get the arguments
WEBHOOK_URL=$1
BRANCH_NAME=$2
ACTOR=$3
COMMIT_MESSAGE=$4

# Create the JSON payload
PAYLOAD=$(cat <<EOF
{
  "text": "Build started by $ACTOR on branch '$BRANCH_NAME'. Commit message: \"$COMMIT_MESSAGE\""
}
EOF
)

# Send the notification
curl -X POST -H 'Content-Type: application/json' -d "$PAYLOAD" "$WEBHOOK_URL"

