# Pipeline Stage Email Templates
## Send the Right Email at Each Stage Transition

> **Usage**: When a senator moves to a new pipeline stage, use the corresponding
> email template below. Replace `{{variables}}` before sending.
> **Gmail integration**: Ask Claude to "draft follow-up emails for senators at Stage X"
> and it will generate Gmail drafts using these templates.

---

## STAGE 2 → Letter Sent (first written contact)

**When to send**: After mailing a physical letter. This email accompanies or follows the letter.

```
Subject: Introduction — CoTrackPro for Missouri Families

Dear {{salutation}} {{last_name}},

I recently sent a letter to your Capitol office introducing CoTrackPro,
a child-centered documentation platform for Missouri families navigating
co-parenting and family court proceedings.

I wanted to follow up by email to ensure the materials reached your
office. {{committee_hook}}

I would welcome the opportunity to provide a brief demonstration at
your convenience — in person or virtually. A 15-minute overview is
all it takes to see how CoTrackPro supports the families and
professionals in your district.

Please don't hesitate to reach out if you or your staff have questions.

Respectfully,
Doug Devitre
Founder & CEO, CoTrackPro
(314) 496-5973 | dougdevitre@gmail.com
cotrackpro.com
```

---

## STAGE 3 → Packet Delivered (post-visit follow-up)

**When to send**: Within 48 hours of a Capitol drop-off visit.

```
Subject: Thank you — CoTrackPro materials for {{salutation}} {{last_name}}

Dear {{recipient_name}},

Thank you for taking the time to receive materials from CoTrackPro
during my visit to the Capitol on {{visit_date}}. I appreciate
{{office_possessive}} work on behalf of Missouri families in
District {{district_number}}.

As shared in the enclosed materials, CoTrackPro is a child-centered
documentation platform designed to support families and professionals
navigating co-parenting and family court proceedings. {{committee_hook}}

I would welcome the opportunity to provide a brief demonstration
at your convenience — in person or virtually. Please don't hesitate
to reach out.

Respectfully,
Doug Devitre
Founder & CEO, CoTrackPro
(314) 496-5973 | dougdevitre@gmail.com
cotrackpro.com
```

---

## STAGE 4 → Meeting Requested (scheduling follow-up)

**When to send**: 7-10 days after packet delivery, if no response to initial follow-up.

```
Subject: Following up — brief meeting about CoTrackPro

Dear {{salutation}} {{last_name}},

I hope this message finds you well. I'm following up on the materials
I left with your Capitol office on {{visit_date}} regarding CoTrackPro,
a child-centered documentation platform for Missouri families.

I understand your schedule is demanding during session. I would be
happy to work around your availability — even a brief 15-minute
meeting or call would be valuable. I can also meet with a member
of your policy staff if that's more convenient.

Would any of the following work?
- A brief call at your convenience
- A visit to your Capitol office on [suggest 2-3 dates]
- A virtual meeting via Zoom or phone

Thank you for considering this request. I believe CoTrackPro's work
is directly relevant to {{committee_hook_short}}.

Respectfully,
Doug Devitre
Founder & CEO, CoTrackPro
(314) 496-5973 | dougdevitre@gmail.com
cotrackpro.com
```

---

## STAGE 5 → Meeting Held (post-meeting thank you)

**When to send**: Within 24 hours of the meeting.

```
Subject: Thank you for meeting — CoTrackPro next steps

Dear {{salutation}} {{last_name}},

Thank you for taking the time to meet with me {{meeting_context}}
to discuss CoTrackPro and our work supporting Missouri families.

I appreciated your insights on {{topic_discussed}}, and I wanted
to follow up on the items we discussed:

{{next_steps_list}}

I've attached {{attachments_description}} for your reference.
Please don't hesitate to reach out if you or your staff have
additional questions.

I look forward to continuing this conversation and supporting
your work on behalf of Missouri families.

Respectfully,
Doug Devitre
Founder & CEO, CoTrackPro
(314) 496-5973 | dougdevitre@gmail.com
cotrackpro.com
```

---

## STAGE 6 → Champion (nurture relationship)

**When to send**: When sharing relevant updates, new data, or legislative developments.

```
Subject: Update for your review — {{update_topic}}

Dear {{salutation}} {{last_name}},

I wanted to share a quick update that I thought would be relevant
to your interest in {{topic_area}}:

{{update_content}}

As always, I'm available to discuss this further or provide any
additional materials that would be helpful as the {{committee_name}}
considers related policy.

Thank you for your continued interest in supporting Missouri
families through technology and innovation.

Respectfully,
Doug Devitre
Founder & CEO, CoTrackPro
(314) 496-5973 | dougdevitre@gmail.com
cotrackpro.com
```

---

## STAGE 7 → Sponsor (legislative support)

**When to send**: When providing draft language, fiscal notes, or testimony support.

```
Subject: Materials for {{bill_number}} — CoTrackPro support

Dear {{salutation}} {{last_name}},

Thank you for your willingness to champion {{bill_topic}} in the
Missouri Senate. I'm honored by your support and want to ensure
you have everything you need.

I've prepared the following materials:

{{materials_list}}

I am available to testify before the {{committee_name}} if that
would be helpful, and I can provide additional data, case examples,
or expert contacts as needed.

Please don't hesitate to reach out to me or your staff can contact
me directly at (314) 496-5973.

Respectfully,
Doug Devitre
Founder & CEO, CoTrackPro
(314) 496-5973 | dougdevitre@gmail.com
cotrackpro.com
```

---

## STAGE 8 → Dormant (periodic re-engagement)

**When to send**: When a relevant bill is introduced, a committee hearing is scheduled, or a news event creates a natural touchpoint.

```
Subject: Relevant to your work — {{news_hook}}

Dear {{salutation}} {{last_name}},

I hope this session is going well. I wanted to reach out briefly
because {{re_engagement_reason}}.

As a reminder, CoTrackPro is a child-centered documentation platform
that supports Missouri families and professionals in family court
proceedings. {{brief_relevance_statement}}

If your schedule allows, I would welcome a brief conversation about
how this work connects to your committee's priorities. I'm available
at your convenience.

Respectfully,
Doug Devitre
Founder & CEO, CoTrackPro
(314) 496-5973 | dougdevitre@gmail.com
cotrackpro.com
```

---

## BULK EMAIL WORKFLOW

When you need to send emails to multiple senators at once:

1. **Tell Claude**: "Draft follow-up emails for all senators at Stage [X]"
2. Claude will:
   - Query Airtable for senators at that pipeline stage
   - Load `personalization-map.md` for each senator's hook and campaign
   - Select the right template from this file
   - Fill in `{{variables}}`
   - Create Gmail drafts for each senator
3. **You review**: Open Gmail Drafts, scan each email, update [DATE] fields
4. **You send**: Hit send on each draft
5. **Tell Claude**: "Update pipeline — I sent follow-ups to [list]"
6. Claude updates Airtable stages and sets next action dates
