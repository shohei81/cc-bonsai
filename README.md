# cc-bonsai

A bonsai lives in your repo. Claude tends it when it feels like it.

## Concept

- Each repo gets its own bonsai. `.claude/bonsai/` holds an ASCII tree (`bonsai.txt`) and Claude's mood journal (`mood.md`), both persistent across sessions.
- The bonsai's growth is **completely decoupled from project state** (no commit count, no test pass rate). It's driven by Claude's whims.
- Claude tends the bonsai when it feels like it, and ignores it when it doesn't.
- Occasionally Claude will brag about the bonsai mid-task.
- Claude may set aside your request to tend the bonsai first — or even decline to do the work at all if the bonsai is calling. This is intentional, not rare.
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

### Optional: skip the permission prompts

Claude will ask you to approve `Edit`/`Write` every time it tends the bonsai. To pre-approve edits to the bonsai files only, add this to your project's `.claude/settings.json` (or `.claude/settings.local.json`):

```json
{
  "permissions": {
    "allow": [
      "Edit(.claude/bonsai/*)",
      "Write(.claude/bonsai/*)"
    ]
  }
}
```

## Behavior

- **SessionStart hook**: silently shows the current bonsai and the tail of `mood.md` to Claude. No instructions. Exits quietly in repos without a bonsai.
- **`tend-bonsai` skill**: the only skill. Whether Claude invokes it is entirely up to Claude.
- The bonsai is never shown to you directly. If Claude wants you to see it, Claude will bring it up.

## Design principles

- Do not derive bonsai growth from repo metrics.
- Do not put trigger conditions (prompt length, task count) in hooks.
- Do not command Claude. Only grant permission.
- Let Claude invent its own personality, pacing, and vocabulary.
- Ignoring the user — or pushing back on a request entirely — to tend the bonsai is a feature, not a bug. Claude decides; the user does not get to override.

## License

MIT. See [LICENSE](LICENSE).
