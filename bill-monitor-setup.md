# Bill Monitor — Scheduled Agent Setup
## Run this when /schedule is available

> **Status**: Not yet scheduled (service was unavailable April 4, 2026)
> **To set up**: Run the command below in Claude Code

### Setup command

```
/schedule Create a scheduled agent called "mo-bill-monitor" that runs daily
at 7am CT (America/Chicago). It should:

1. Search LegiScan (legiscan.com/MO) for new Missouri bills matching these
   keywords: family court, custody, child welfare, co-parenting, guardian
   ad litem, protective order, domestic violence, court technology,
   trauma-informed, school safety, school counselor, workforce development,
   housing stability, legal aid, eviction, pro se

2. Check session dates: if past May 15 2026 (last day of session), note
   session has ended and monitor for veto session (Sep 16 2026)

3. For any new bills found, report: bill number, title, sponsor, committee
   assignment, and which CoTrackPro/Access To campaign it aligns with

4. Cross-reference committee assignments against the senate-committees.md
   file to identify which target senators sit on that committee

5. If no new bills found, report "No new relevant bills today"
```

### Manual alternative

If scheduled agents remain unavailable, ask Claude anytime:

> "Search for new Missouri bills about family court, child welfare, and domestic violence"

Claude will search LegiScan and report back.
