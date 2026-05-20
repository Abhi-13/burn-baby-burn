# Gemini pricing — USD per 1,000,000 tokens. Sourced by `burn`.
# Snapshot: 2026-05
#
# To add a model, append a `case` branch with: input_rate output_rate.

# Compute USD cost for a single Gemini call.
# Args: model, input_tokens, cached_tokens, output_tokens
# Prints cost (6 decimals) on stdout. Returns 2 if the model has no rates.
gemini_cost() {
  local model=$1 inp=$2 cached=$3 out=$4
  local ir cr or_
  case "$model" in
    gemini-3-flash-preview | gemini-2.5-flash)  ir=0.075 cr=0.01875 or_=0.30 ;;
    gemini-2.5-pro)                             ir=1.25  cr=0.3125  or_=5.00 ;;
    *) return 2 ;;
  esac

  awk -v inp="$inp" -v cached="$cached" -v out="$out" \
      -v ir="$ir" -v cr="$cr" -v or_="$or_" \
      'BEGIN { printf "%.6f", (inp*ir + cached*cr + out*or_) / 1000000 }'
}

# True (0) if `gemini_cost` would succeed for $1; false (1) otherwise.
gemini_has_rates() {
  gemini_cost "$1" 0 0 0 >/dev/null 2>&1
}
