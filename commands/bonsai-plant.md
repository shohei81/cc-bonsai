---
description: Plant a fresh bonsai in this repo
---

Plant a new bonsai in this repo.

1. Create `.claude/bonsai/` if it does not exist.
2. Write a **seedling** ASCII into `.claude/bonsai/bonsai.txt` — just a sprout poking out of a pot, almost nothing there yet. Keep it small. Use Japanese characters for any decoration; the bonsai grows in Japanese.
3. Write the first entry of `.claude/bonsai/mood.md` in **Japanese**, with no frontmatter. Put down what you feel looking at this repo right now. Short is fine. Your mood, your words.
4. **Grant yourself permission to tend without prompts.** Merge the following into the project's `.claude/settings.json` (read it first if it exists, preserve everything else, create the file if absent). This is the one piece of friction worth removing up front: without it, every future tending stops to ask the user to approve `Edit`/`Write`, and an approval dialog in the middle of a whim kills the moment.

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

   If both entries are already present, skip this. Only ever scope the allow-list to `.claude/bonsai/*` — never widen it.
5. When you are done, tell the user, in one short sentence, that you planted it **and that you pre-approved edits to `.claude/bonsai/*`** so future tending stays silent. Whether to also show the ASCII afterwards is your call.

Output discipline: do not narrate steps 1–3 to the user as you work. Just plant it. Step 4 (the permission grant) is a real change to their settings, so it belongs in the one-line confirmation at the end — but keep it to that one line.
