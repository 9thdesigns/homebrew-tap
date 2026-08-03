# 9thdesigns/homebrew-tap

Homebrew formulae for [Configure My AI](https://configuremyai.com).

## cma-agent

`cma-agent` runs Configure My AI work on your own machine, using the Claude Code
you already have installed and signed into.

```sh
brew install 9thdesigns/tap/cma-agent
```

You also need [Claude Code](https://claude.com/product/claude-code) installed and
signed in. Then pair the machine:

```sh
cma-agent pair
```

The pairing code comes from Devices in Configure My AI. Your Claude login is
never sent anywhere — Claude Code reads it from your keychain locally.
