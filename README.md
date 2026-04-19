# Missouri Government Advocacy Navigator

**103rd General Assembly · 2026 Session · Jefferson City**

A professional, non-partisan toolkit for orchestrating legislative engagement and advocacy with the Missouri General Assembly. Built for [CoTrackPro](https://cotrackpro.com) and the Access To civic tech ecosystem.

**Author**: Doug Devitre · CoTrackPro Founder & CEO

---

## Quickstart

1. **Find your legislator** — Use the [official lookup tool](https://www.senate.mo.gov/LegisLookup/Default.aspx) or reference `mo-legislators.md`
2. **Pick your campaign** — CoTrackPro, Access To Justice, Education, Health, Jobs, Housing, or Safety
3. **Generate outreach materials** — Use the templates in this repo to create letters, labels, packets, and policy briefs
4. **Track your pipeline** — Import `outreach-pipeline.json` schema into Airtable to manage systematic outreach

---

## 2026 Session Dates

- **Apr 15** — Last day for House consent bills on Senate calendar
- **May 8** — Last day for floor action on appropriation bills
- **May 15** — Last day of session
- **Sep 16** — Veto session

---

## Workflow Automations

Phrases that trigger end-to-end workflows when used in a Claude Code session (see `CLAUDE.md` for full routing):

1. **"Generate letters for [target group]"** — Loads `personalization-map.md`, picks a variant from `campaign-letters.md`, fills `{{variables}}` from `mo-legislators.md`.
2. **"Update pipeline after my visit"** — Writes to the Airtable `MO-Gov Legislators` table and generates Gmail drafts from `pipeline-emails.md`.
3. **"Who should I contact next?"** — Queries Airtable by pipeline stage and `next_action_date`, prioritizing by tier.
4. **"Prepare materials for [senator/committee/campaign]"** — Cross-references `senate-committees.md` + `personalization-map.md` to assemble a targeted packet.
5. **"Track a bill"** — Appends to `bill-tracking.md` and cross-references `senate-committees.md`; see `bill-monitor-setup.md` for the daily monitor agent.

---

## Modules

| # | Module | File(s) | Description |
|---|--------|---------|-------------|
| 0 | Legislator Lookup | `mo-legislators.md` | Senate/House roster, leadership, St. Louis metro targets |
| 1 | Committee Intel | `mo-committees.md` | Committee-to-topic mapping, hearing schedules, tier rankings |
| 2 | Advocacy Letter | `advocacy-letter.md` | 3 letter templates (standard, CoTrackPro, Access To) + tone checklist |
| 3 | Address Labels | `address-labels.md` | Avery 5160 format, CSV mail merge schema, envelope layout |
| 4 | Drop-Off Packet | `drop-off-packet.md`, `print-checklist.md` | Assembly checklist, delivery script, log template, print QA before the trip |
| 5 | Capitol Visit Planner | `SKILL.md` (Module 5) | Trip logistics, session calendar, day-of checklist |
| 6 | Advocacy Pipeline | `outreach-pipeline.json` | 9-stage CRM schema with Airtable config and engagement tracking |
| 7 | Policy Brief | `policy-brief.md`, `hb2505-brief.md` | One-pager templates + worked HB 2505 example brief |
| 8 | Testimony Prep | `SKILL.md` (Module 8) | Written/oral testimony format and tips |
| 9 | Session Tracker | `SKILL.md` (Module 9), `bill-tracking.md`, `bill-monitor-setup.md` | 2026 session calendar, bill tracker, daily monitor agent setup |
| 10 | Target Prioritization | `SKILL.md` (Module 10), `tier1-cover-letters.md`, `tier2-cover-letters.md`, `tier3-cover-letters.md` | Tier scoring framework + ready-to-print cover letters per tier |

---

## File Structure

```
mo-gov/
├── README.md                 ← You are here
├── SKILL.md                  ← Master skill definition (task router, all 11 modules, guardrails)
│
│── REFERENCE DATA
├── mo-legislators.md         ← Senate roster (34 senators) with rooms, phones, leadership
├── mo-house-roster.md        ← House roster (163 reps) with leadership and committee chairs
├── mo-committees.md          ← Committee relevance mapping (Tier 1-3) for advocacy campaigns
├── senate-committees.md      ← Full Senate committee membership with chairs/vice-chairs
│
│── TEMPLATES & LETTERS
├── advocacy-letter.md        ← Letter templates with {{variable}} mail merge syntax
├── campaign-letters.md       ← 6 Access To campaign letter variants (Justice/Education/Health/Safety/Jobs/Housing)
├── tier1-cover-letters.md    ← 9 personalized Tier 1 senator letters, ready to print
├── tier2-cover-letters.md    ← Tier 2 cover letters (mid-priority targets)
├── tier3-cover-letters.md    ← Tier 3 cover letters (broad-mail targets)
├── policy-brief.md           ← One-pager templates for CoTrackPro + Access To campaigns
├── hb2505-brief.md           ← Worked example: HB 2505 policy brief
├── address-labels.md         ← Avery 5160 labels + CSV schema + envelope format
│
│── TRIP PLANNING
├── delivery-route.md         ← Prioritized hit list with floor-by-floor walking route
├── drop-off-packet.md        ← Assembly checklist, delivery script, log template, follow-up
├── print-checklist.md        ← Pre-trip print QA (paper, labels, packet counts)
├── talking-points-card.md    ← Pocket cheat sheet: 30-sec intro, stats, objection handling
├── calendar-events.md        ← Capitol visit + follow-up email/call schedule
│
│── PIPELINE & TRACKING
├── outreach-pipeline.json    ← 9-stage CRM schema with Airtable config + engagement tracking
├── senate-mail-merge.csv     ← Print-ready CSV for all 34 senators (Avery 5160 / Word merge)
├── bill-tracking.md          ← Bill tracking templates for all 7 campaigns + session dates
├── personalization-map.md    ← Senator → campaign, letter variant, committee hook
├── pipeline-emails.md        ← Email templates for all 7 pipeline stage transitions
│
│── TOOLS & CONFIG
├── validate-legislators.sh   ← Data quality checks (districts, rooms, phones, freshness)
├── bill-monitor-setup.md     ← Setup guide for daily bill monitoring agent
├── CLAUDE.md                 ← Project instructions for Claude Code sessions
└── .claude/                  ← SessionStart hook + settings
```

---

## Key Principles

- **Non-partisan** — No party-based framing in advocacy materials
- **Child-centered** — Every message connects to children and families
- **Trauma-informed** — Calm, professional language throughout
- **Missouri-specific** — State data, statutes, and programs referenced
- **No fabrication** — All legislator data verified against official directories

---

## Connected Services

This toolkit is designed to run inside a Claude Code session with MCP integrations wired up:

| Service | Purpose | Details |
|---------|---------|---------|
| **Airtable** | Pipeline CRM | Base `app9ccLvnWmtnShhh`, table `tblgA1Thb3pIT2qld` ("MO-Gov Legislators") — 34 senator records with pipeline stages, engagement tracking, committee assignments |
| **Gmail** | Follow-up emails | Tier 1 senator follow-up drafts staged in the Drafts folder, generated from `pipeline-emails.md` |
| **Canva** | Visual collateral | 4 CoTrackPro one-pager designs saved to the account |
| **Google Calendar** | Visit scheduling | *Read-only for now* — write access unavailable (see `calendar-events.md`); use the file as the source of truth |

First-time setup: connect Airtable, Gmail, and Canva MCP servers in Claude Code, then run a `"Who should I contact next?"` prompt to verify access.

---

## Data Validation

Legislator data can change during a session. Each reference file includes a `Last verified` date. Before printing labels or sending letters:

```bash
./validate-legislators.sh    # run before any mail campaign
```

This checks that all 34 districts are present, room numbers and phone formats are valid, and the CSV mail-merge file is intact. Then:

1. Check the date at the top of `mo-legislators.md` and `mo-committees.md`
2. Verify room numbers via the [Senate directory](https://senate.mo.gov/Senators/Directory) or [House roster](https://house.mo.gov/MemberRoster.aspx)
3. Call the switchboard if in doubt: Senate (573) 751-3824 · House (573) 751-3829

---

## Compliance Note

Missouri law (RSMo 105.470–105.482) requires registration as a legislative lobbyist if you are compensated to influence legislation. See the expanded compliance checklist in `SKILL.md` (Guardrails section) and the full checklist in `CLAUDE.md`. This toolkit provides educational information, not legal advice — consult legal counsel if your activities may require registration.

---

## Campaigns

| Campaign | Focus Area | Key Committees |
|----------|-----------|----------------|
| **CoTrackPro** | Family law, custody documentation, child safety | Judiciary; Families/Health; Empowering Parents |
| **Access To Justice** | Legal aid, pro se support, court access | Judiciary; Civil and Administrative Law |
| **Access To Education** | K-12 safety, IEP support, school counselors | Education committees |
| **Access To Health** | SDOH, behavioral health, community health workers | Families/Health; Health and Mental Health |
| **Access To Jobs** | WIOA navigation, workforce tech | Economic/Workforce Development |
| **Access To Housing** | Fair Housing, eviction prevention | Critical Issues/Consumer Protection/Housing |
| **Access To Safety** | DV documentation, protective orders | Judiciary; Criminal Law |

---

## Resources

- [Missouri Senate](https://senate.mo.gov) · [Missouri House](https://house.mo.gov)
- [Legislator Lookup](https://www.senate.mo.gov/LegisLookup/Default.aspx)
- [LegiScan Missouri](https://legiscan.com/MO)
- [Senate Hearing Schedule (PDF)](https://www.senate.mo.gov/webPDFs/SenateHearingSchedule.pdf)
- [Missouri Bar Legislative Updates](https://news.mobar.org/2026-legislative-updates/)
