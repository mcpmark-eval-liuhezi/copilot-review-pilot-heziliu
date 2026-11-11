#!/usr/bin/env bash
# copilot-review-pilot: example validation script for the Copilot review demo
set -euo pipefail

REPO="${1:-mcpmark-eval-liuhezi/copilot-review-pilot-heziliu}"

echo "==> Validating repo: ${REPO}"
for field in owner name default_branch created_at updated_at; do
  echo "    ${field}: $(gh api repos/${REPO} --jq '.[$field]' 2>/dev/null || echo 'n/a')"
done

count=$(gh api repos/${REPO}/contents --jq 'length')
echo "==> Files in README branch: ${count}"

echo "==> Demo script OK"
