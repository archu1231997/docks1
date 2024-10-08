#!/bin/bash

# Define your variables
WEBHOOK_URL="<https://chat.googleapis.com/v1/spaces/AAAAB7ywqPU/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=8kzhcjp7oEWLuM3yZJakRTBEXg92PAqG2k2MYOV1nWY>"
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
ACTOR=$(git config user.name)
COMMIT_MESSAGE=$(git log -1 --pretty=%B)

# Notify Start
echo "Sending start notification..."
bash /home/archu/dock/notify-start.sh "$WEBHOOK_URL" "$BRANCH_NAME" "$ACTOR" "$COMMIT_MESSAGE"

if [ $? -eq 0 ]; then
  # Notify Success
  echo "Sending success notification..."
  bash /home/archu/dock/notify-success.sh "$WEBHOOK_URL" "$BRANCH_NAME" "$ACTOR" "$COMMIT_MESSAGE"
else
  # Notify Failure
  echo "Sending failure notification..."
  bash /home/archu/dock/notify-failure.sh "$WEBHOOK_URL" "$BRANCH_NAME" "$ACTOR" "$COMMIT_MESSAGE"
fi

