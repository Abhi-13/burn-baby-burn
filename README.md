# Burn, baby, burn

![burn-baby-burn](burn.png)


A bash one-liner that burns Claude Code tokens on purpose.

```bash
burn 50000
```

That's it. It calls `claude -p` in a loop with garbage prompts until your
target is hit. Real numbers come back from the API, so the total is the
total that hits your bill.

---

## Features

- 📈 **Make the CEO see how productive you are.** 🔥
- 💸 **Investors will see how AI-innovative your company is.** 🚀
- 🏆 **Top the internal Claude Code leaderboard.** 👑
- 📊 **Pad your OKRs.** ✅
- 🦄 **Justify next year's bigger AI budget.** 💰

---

## Install

```bash
brew tap dtnewman/burn https://github.com/dtnewman/burn_baby_burn
brew install burn
```

Needs [Claude Code](https://docs.claude.com/claude-code) authenticated on
your `PATH` and `jq` (brew pulls it in).

---

## Usage

```bash
burn 10000                  # the minimum
burn 50000 --model haiku    # cheap and fast
burn 100000 --model sonnet  # walk away
```

---

## License

MIT. Burn responsibly. 🔥
