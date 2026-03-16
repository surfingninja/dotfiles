#!/usr/bin/env bash

if [[ -z "$OPENAI_API_KEY" ]]; then
  echo "Please set your OPENAI_API_KEY in the environment."
  exit 1
fi

echo "ChatGPT Terminal Popup (type 'exit' to quit)"
echo "-------------------------------------------"

while true; do
  read -p "> " user_input
  [[ "$user_input" == "exit" ]] && break

  # Send input to OpenAI API
  response=$(curl -s https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d "{
      \"model\": \"gpt-4o-mini\",
      \"messages\": [{\"role\": \"user\", \"content\": \"$user_input\"}]
    }" | jq -r '.choices[0].message.content')

  echo "$response"
done
