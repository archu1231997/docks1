!/bin/bash

# Your deployment commands go here
# For example:
echo "Starting deployment..."

# Simulate deployment (Replace this with your actual deployment process)
DEPLOYMENT_SUCCESS=true  # Set this based on actual deployment result

# Google Chat webhook URL (Replace with your actual webhook URL)
WEBHOOK_URL="https://chat.googleapis.com/v1/spaces/AAAAB7ywqPU/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=8kzhcjp7oEWLuM3yZJakRTBEXg92PAqG2k2MYOV1nWY"



if [ "$DEPLOYMENT_SUCCESS" = true ]; then
    # Notify success
    curl -X POST -H 'Content-Type: application/json' \
    --data '{"text": "Deployment successful!"}' \
    "$WEBHOOK_URL"
else
    # Notify failure
    curl -X POST -H 'Content-Type: application/json' \
    --data '{"text": "Deployment failed!"}' \
    "$WEBHOOK_URL"
fi

