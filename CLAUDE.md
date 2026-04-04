# CLAUDE.md — Project Instructions for Claude Code

## What this project is

Missouri Government Advocacy Navigator — a 23-file toolkit for legislative
outreach to the Missouri General Assembly (103rd GA, 2026 session). Built for
CoTrackPro (child-centered family court documentation platform) and the
Access To civic tech initiative (Justice, Education, Health, Safety, Jobs, Housing).

**Owner**: Doug Devitre, Founder & CEO of CoTrackPro
**Base**: St. Louis metro area (Swansea, IL)

## How to work in this repo

### Key files to load first
- `personalization-map.md` — Senator → campaign, letter variant, committee hook
- `mo-legislators.md` — Senate roster (34 senators) with rooms, phones, leadership
- `senate-committees.md` — Full committee membership with chairs/vice-chairs
- `SKILL.md` — Master skill definition with 11 modules and 5 workflow automations

### Connected services (via MCP)
- **Airtable**: "MO-Gov Legislators" table in "JTA Content & Outreach Pipeline" base
  (app9ccLvnWmtnShhh / tblgA1Thb3pIT2qld) — 34 senator records with pipeline
  stages, engagement tracking, committee assignments
- **Gmail**: Follow-up email drafts for Tier 1 senators in Drafts folder
- **Canva**: 4 CoTrackPro one-pager designs saved to account

### Common tasks
- **"Generate letters for [group]"** → Load personalization-map.md, pick campaign
  variant from campaign-letters.md, fill {{variables}} from mo-legislators.md
- **"Update pipeline after visit"** → Update Airtable records, generate Gmail drafts
  from pipeline-emails.md templates
- **"Who should I contact next?"** → Query Airtable by pipeline stage and
  next_action_date, prioritize by tier
- **"Track a bill"** → Add to bill-tracking.md, cross-reference senate-committees.md

### Data validation
Run `./validate-legislators.sh` before any mail campaign. Checks: all 34 districts
present, room numbers populated, phone format, data freshness, CSV integrity.

## Principles
- **Non-partisan**: Never mention party in advocacy materials
- **Child-centered**: Connect everything back to children and families
- **Trauma-informed**: Calm, professional language
- **No fabrication**: Never invent legislator names, rooms, or committee assignments
- **Missouri-specific**: Use MO data, statutes, and programs

## Session dates (2026)
- Apr 15: Last day for House consent bills on Senate calendar
- May 8: Last day for floor action on appropriation bills
- May 15: Last day of session
- Sep 16: Veto session
