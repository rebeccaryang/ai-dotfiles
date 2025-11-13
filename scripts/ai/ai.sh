#!/usr/bin/env bash
# AI utility commands for shell workflows.

# Unified AI command
ai() {
  local input="$*"
  if [[ -z "$input" ]]; then
    printf "Usage: ai <prompt>\n"
    return 1
  fi

  # Prefer Claude if installed
  if command -v claude >/dev/null 2>&1; then
    claude "$input"
    return
  fi

  # Fallback to OpenAI if installed
  if command -v openai >/dev/null 2>&1; then
    openai chat.completions.create -m gpt-4.1 -g user "$input"
    return
  fi

  printf "No AI CLI found (install claude or openai)\n"
}

# Generate commit messages
aic() {
  local diff
  diff=$(git diff --cached)
  ai "Write a concise commit message for the following diff:\n\n$diff"
}

