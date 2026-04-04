# Address Labels & Mail Merge Template
## For Missouri Legislative Outreach

> **Last verified**: April 2026
> **Template variable syntax**: `{{variable_name}}` — compatible with Word mail merge, Google Sheets, and Avery label software

---

## LABEL FORMAT: AVERY 5160 (30 per sheet)

Standard label dimensions: 1" x 2-5/8" (25.4mm x 66.7mm)

### Recipient label format
```
The Honorable {{first_name}} {{last_name}}
Missouri {{chamber}}
201 W. Capitol Ave., Rm. {{room_number}}
Jefferson City, MO 65101
```

### Return label format (Doug Devitre / CoTrackPro)
```
Doug Devitre
CoTrackPro
{{return_street_address}}
Swansea, IL 62226
```

---

## MAIL MERGE CSV SCHEMA

### For Senate targets
```csv
title,first_name,last_name,full_salutation,chamber,room,address_line_1,address_line_2,city,state,zip,phone,email,district,committee_hook
"Sen.","Cindy","O'Laughlin","Senator O'Laughlin","Missouri State Senate","[Room]","201 W. Capitol Ave.","Rm. [Room]","Jefferson City","MO","65101","","cindy.olaughlin@senate.mo.gov","18","As President Pro Tem you oversee committee appointments that shape family policy"
```

### Full CSV header
```
title,first_name,last_name,full_salutation,chamber,room,address_line_1,address_line_2,city,state,zip,phone,email,district,committee_hook
```

### Field descriptions
| Field | Description | Example |
|---|---|---|
| title | Abbreviated title | Sen. / Rep. |
| first_name | First name | Cindy |
| last_name | Last name | O'Laughlin |
| full_salutation | How to address in letter body | Senator O'Laughlin |
| chamber | Full chamber name | Missouri State Senate |
| room | Capitol office room number | 320 |
| address_line_1 | Street address | 201 W. Capitol Ave. |
| address_line_2 | Room line | Rm. 320 |
| city | City | Jefferson City |
| state | State | MO |
| zip | Zip code | 65101 |
| phone | Capitol phone | (573) 751-XXXX |
| email | Official email | firstname.lastname@senate.mo.gov |
| district | District number | 18 |
| committee_hook | Personalization sentence for mail merge | As chair of... |

---

## ENVELOPE FORMAT (No. 10 Business Envelope)

### Sender (upper left)
```
Doug Devitre
CoTrackPro
{{return_street_address}}
Swansea, IL 62226
```

### Recipient (center)
```
The Honorable {{first_name}} {{last_name}}
Missouri {{chamber}}
201 W. Capitol Ave., Rm. {{room_number}}
Jefferson City, MO 65101
```

---

## WORD MAIL MERGE INSTRUCTIONS

1. **Create the CSV**: Use the schema above, one row per legislator
2. **Open Word**: Create a new document or use a label template
3. **Mailings tab** → Start Mail Merge → Labels → Select Avery 5160
4. **Select Recipients** → Use an Existing List → Select your CSV file
5. **Insert Merge Fields**:
   ```
   The Honorable {{first_name}} {{last_name}}
   {{chamber}}
   {{address_line_1}}, {{address_line_2}}
   {{city}}, {{state}} {{zip}}
   ```
6. **Preview Results** → verify formatting
7. **Finish & Merge** → Print Documents

---

## GOOGLE SHEETS + AVERY LABEL WORKFLOW

1. Upload CSV to Google Sheets
2. Install the "Avery Label Merge" add-on (or "Labelmaker")
3. Select the Avery 5160 template
4. Map fields to the label layout
5. Generate and print

---

## BATCH GENERATION COMMANDS

When user requests labels, generate one of these outputs:

### Option 1: All 34 Senators
Generate a CSV with all 34 senators from `references/mo-legislators.md`

### Option 2: All 163 Representatives
Generate a CSV with all representatives — requires fetching from
https://house.mo.gov/MemberRoster.aspx

### Option 3: Priority committee members only
Filter to members of Tier 1 and Tier 2 committees from
`references/mo-committees.md`

### Option 4: Custom selection
User provides a list of names or districts

### Option 5: Pipeline-based
Generate labels only for legislators at specific pipeline stages
(e.g., Stage 0-1 for initial outreach)

---

## NOTES ON ADDRESSING LEGISLATORS

- Always use "The Honorable" on the envelope/label — this is standard protocol
- In the letter salutation, use "Dear Senator [Last Name]:" or
  "Dear Representative [Last Name]:"
- Never use first names in formal correspondence
- If a senator holds the title "President Pro Tem" or a representative is
  "Speaker," you may add it: "The Honorable Cindy O'Laughlin, President Pro Tem"
- For committee chairs: "The Honorable [Name], Chair, [Committee Name]" is
  acceptable on the envelope but not required
