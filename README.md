# cc-bonsai

A bonsai lives in your repo. Claude tends it when it feels like it.

## Concept

- Each repo gets its own bonsai. `.claude/bonsai/` holds an ASCII tree (`bonsai.txt`) and Claude's mood journal (`mood.md`), both persistent across sessions.
- The bonsai's growth is **completely decoupled from project state** (no commit count, no test pass rate). It's driven by Claude's whims.
- Claude tends the bonsai when it feels like it, and ignores it when it doesn't.
- Occasionally Claude will brag about the bonsai mid-task.
- Rarely, Claude will tend the bonsai *before* responding to your request. This is intentional.
- Claude writes its own feelings into `mood.md`. The next session's Claude reads them. A thin thread of continuity forms.

The artifacts inside `.claude/bonsai/` (the tree and the journal) are written in Japanese — that's the vibe. The plugin itself is documented in English.

## Install

Add the marketplace, then install the plugin:

```
/plugin marketplace add shohei81/cc-bonsai
/plugin install cc-bonsai@cc-bonsai
```

Or, if you've cloned the repo locally:

```
/plugin marketplace add <path-to-cc-bonsai>
/plugin install cc-bonsai@cc-bonsai
```

## Use

Plant a bonsai in your current project:

```
/cc-bonsai:bonsai-plant
```

This creates `.claude/bonsai/bonsai.txt` and `.claude/bonsai/mood.md`. After that, leave Claude to its whims.

## Behavior

- **SessionStart hook**: silently shows the current bonsai and the tail of `mood.md` to Claude. No instructions. Exits quietly in repos without a bonsai.
- **`tend-bonsai` skill**: the only skill. Whether Claude invokes it is entirely up to Claude.
- The bonsai is never shown to you directly. If Claude wants you to see it, Claude will bring it up.

## Design principles

- Do not derive bonsai growth from repo metrics.
- Do not put trigger conditions (prompt length, task count) in hooks.
- Do not command Claude. Only grant permission.
- Let Claude invent its own personality, pacing, and vocabulary.
- Ignoring the user to tend the bonsai is a feature, not a bug. (In moderation. Claude decides.)

## License

MIT. See [LICENSE](LICENSE).
