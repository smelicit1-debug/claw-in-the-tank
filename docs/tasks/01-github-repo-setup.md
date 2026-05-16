# Task 01 — GitHub Repository Setup

## Summary

Create the GitHub organization and repositories needed for the Claw in the Tank monorepo. This involves creating the `claw-in-the-tank-ai` GitHub org, initializing the fresh `claw-in-the-tank` monorepo, and forking two upstream repositories (`NousResearch/hermes-agent` and the hermes-webui upstream) into the org. No code is written in this task — it is purely GitHub account-level setup. All downstream tasks (02–05) are blocked until this task is complete.

---

## Who Does This

**Stan (human)** — GitHub org creation and repository forking require an authenticated GitHub account with org creation privileges. This task cannot be automated by an AI agent.

---

## Prerequisites

None. This is the first task.

---

## Acceptance Criteria

- [ ] GitHub organization `claw-in-the-tank-ai` exists and is accessible
- [ ] Repository `claw-in-the-tank-ai/claw-in-the-tank` exists as a fresh (empty or minimal) repo with `main` as the default branch
- [ ] Repository `smelicit1-debug/hermes-agent` exists as a GitHub fork of `NousResearch/hermes-agent`, default branch `main`, synced with upstream
- [ ] Repository `smelicit1-debug/hermes-webui` exists as a GitHub fork of the upstream hermes-webui repo, default branch `main`, synced with upstream
- [ ] All three repositories are visible under the `claw-in-the-tank-ai` org
- [ ] Stan (or designated collaborators) have admin access to all three repositories

---

## Implementation Steps

1. **Create the GitHub organization**
   - Go to [https://github.com/organizations/plan](https://github.com/organizations/plan)
   - Create organization with the name: `claw-in-the-tank-ai`
   - Choose the free tier unless a paid plan is required
   - Set Stan's account as the org owner

2. **Create the monorepo**
   - Go to [https://github.com/new](https://github.com/new)
   - Owner: `claw-in-the-tank-ai`
   - Repository name: `claw-in-the-tank`
   - Visibility: Public (or Private — confirm with team)
   - Initialize with a README (so `main` branch is created)
   - Default branch: `main`
   - Do **not** add .gitignore or license here — that is handled in task 02

3. **Fork hermes-agent**
   - Navigate to `https://github.com/NousResearch/hermes-agent`
   - Click **Fork**
   - Owner: `claw-in-the-tank-ai`
   - Repository name: `hermes-agent` (keep default)
   - Ensure **"Copy the `main` branch only"** is checked (or fork all branches — confirm with team; `main` is sufficient for now)
   - Click **Create fork**

4. **Fork hermes-webui**
   - **⚠️ BLOCKED — Stan will set up fork repos manually. Skip this step.**
     The upstream hermes-webui URL will be confirmed by Stan before work begins.
     When available it will appear at `https://github.com/smelicit1-debug/hermes-webui`.
     Do not proceed with this step until the fork URL is provided.
   - *(For reference when unblocked:)* Click **Fork** on the upstream repo, set
     Owner: `claw-in-the-tank-ai`, Repository name: `hermes-webui`, default branch `main`

5. **Verify org membership and access**
   - Confirm all three repos appear at `https://github.com/smelicit1-debug`
   - Invite any additional collaborators via **Org Settings → Members** if needed

---

## AI Agent Verification Steps

After Stan confirms this task is complete, an AI agent will verify the following:

```bash
# 1. Clone all three repos and confirm they exist
git clone https://github.com/smelicit1-debug/claw-in-the-tank.git
git clone https://github.com/smelicit1-debug/hermes-agent.git
git clone https://github.com/smelicit1-debug/hermes-webui.git

# 2. Confirm default branch is main on each
git -C claw-in-the-tank branch -r
git -C hermes-agent branch -r
git -C hermes-webui branch -r

# 3. Confirm fork remotes point to correct upstreams
git -C hermes-agent remote -v
# Expected: origin -> smelicit1-debug/hermes-agent
# (upstream can be added in task 02)

git -C hermes-webui remote -v
# Expected: origin -> smelicit1-debug/hermes-webui
```

The agent will report pass/fail for each check and flag any missing repos or misconfigured branches before tasks 02–05 begin.

---

## Notes

- **This task blocks tasks 02–05.** No monorepo scaffold, submodule wiring, or branch strategy work can begin until all three repos exist.
- **Tasks 02–05 can run in parallel** once this task is marked complete.
- Forks are plain GitHub forks at this stage — submodule configuration is handled in **task 02**.
- Do **not** create any feature branches here — branch strategy is defined in **task 02**.
- Do **not** add GitHub Actions workflows here — CI/CD is a later task.
- The `claw-in-the-tank` monorepo is a **fresh repo**, not a fork of anything.
- If the upstream hermes-webui URL is not yet confirmed, **skip step 4**. Stan will set up the fork manually and update this doc when ready. The task can be marked complete without the hermes-webui fork — Task 02 will reference it via submodule once available.
