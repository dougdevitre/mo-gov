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

## Modules

| # | Module | File(s) | Description |
|---|--------|---------|-------------|
| 0 | Legislator Lookup | `mo-legislators.md` | Senate/House roster, leadership, St. Louis metro targets |
| 1 | Committee Intel | `mo-committees.md` | Committee-to-topic mapping, hearing schedules, tier rankings |
| 2 | Advocacy Letter | `advocacy-letter.md` | 3 letter templates (standard, CoTrackPro, Access To) + tone checklist |
| 3 | Address Labels | `address-labels.md` | Avery 5160 format, CSV mail merge schema, envelope layout |
| 4 | Drop-Off Packet | `drop-off-packet.md` | Assembly checklist, delivery script, log template, follow-up workflow |
| 5 | Capitol Visit Planner | `SKILL.md` (Module 5) | Trip logistics, session calendar, day-of checklist |
| 6 | Advocacy Pipeline | `outreach-pipeline.json` | 9-stage CRM schema with Airtable config and engagement tracking |
| 7 | Policy Brief | `policy-brief.md` | One-pager templates + Missouri-specific data hooks for 7 campaigns |
| 8 | Testimony Prep | `SKILL.md` (Module 8) | Written/oral testimony format and tips |
| 9 | Session Tracker | `SKILL.md` (Module 9) | 2026 session calendar + bill tracking resources |
| 10 | Target Prioritization | `SKILL.md` (Module 10) | Scoring framework + tier-based outreach strategy |

---

## File Structure

```
mo-gov/
├── README.md                 ← You are here
├── SKILL.md                  ← Master skill definition (task router, all 11 modules, guardrails)
├── mo-legislators.md         ← Senate + House roster with leadership and St. Louis metro focus
├── mo-committees.md          ← Committee relevance mapping (Tier 1-3) for advocacy campaigns
├── advocacy-letter.md        ← Letter templates with {{variable}} mail merge syntax
├── address-labels.md         ← Avery 5160 labels + CSV schema + envelope format
├── drop-off-packet.md        ← Capitol delivery checklist, scripts, and follow-up workflow
├── policy-brief.md           ← One-pager templates for CoTrackPro + Access To campaigns
└── outreach-pipeline.json    ← 9-stage pipeline schema with Airtable CRM config
```

---

## Key Principles

- **Non-partisan** — No party-based framing in advocacy materials
- **Child-centered** — Every message connects to children and families
- **Trauma-informed** — Calm, professional language throughout
- **Missouri-specific** — State data, statutes, and programs referenced
- **No fabrication** — All legislator data verified against official directories

---

## Data Freshness

Legislator data can change during a session. Each reference file includes a `Last verified` date. Before printing labels or sending letters:

1. Check the date at the top of `mo-legislators.md` and `mo-committees.md`
2. Verify room numbers via the [Senate directory](https://senate.mo.gov/Senators/Directory) or [House roster](https://house.mo.gov/MemberRoster.aspx)
3. Call the switchboard if in doubt: Senate (573) 751-3824 · House (573) 751-3829

---

## Compliance Note

Missouri law (RSMo 105.470–105.482) requires registration as a legislative lobbyist if you are compensated to influence legislation. See the expanded compliance checklist in `SKILL.md` (Guardrails section). This toolkit provides educational information, not legal advice — consult legal counsel if your activities may require registration.

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
