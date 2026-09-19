# Demo scenario — Sao Mai Technology

Prep pack for the capstone demonstration. Everything here is fictional sample data.

**The company.** Sao Mai Technology JSC, a fictional 300-person Vietnamese software consultancy.
Head office in Phu My Hung, District 7, Ho Chi Minh City, with branches in Cau Giay (Hanoi) and
Hai Chau (Da Nang). Three departments each keep their own internal documents. Nobody wants
Engineering reading the bonus rules, and nobody wants HR guessing at deployment windows.

*Sao Mai* means "morning star". The company and every document are invented. The policies are
written in English, as they are at many Vietnamese technology firms, but the content is
specifically Vietnamese — Tet closure, 13th month salary, VAT invoices, motorbike mileage, and
data residency for government clients.

**The three PDFs already exist** in `docs/demo-documents/`. You do not need to write them.

**Why this scenario.** It makes the separation of knowledge visible rather than asserted. The
demo's strongest moment is asking the *wrong* assistant a question and watching it decline.

---

## 1. What to set up

Five agents. Two that staff chat with, two tool-only specialists, and one router.

| Agent | Kind | Documents | Who may use it |
|---|---|---|---|
| **HR Assistant** | Outer | Employee Handbook | All staff |
| **Engineering Assistant** | Outer | Engineering Standards | Engineering + Leadership |
| **Expense Lookup** | **Inner** | Travel & Expense Policy | nobody directly |
| **Compensation Lookup** | **Inner** | Compensation Framework *(RESTRICTED)* | nobody directly |
| **Sao Mai Helpdesk** | Outer | **none of its own** | All staff |

**No document appears twice.** Each of the four PDFs lives on exactly one agent.

> **Why the two Inner agents exist — the point of the whole design.**
>
> In this platform an agent is either **Outer** (a person can chat with it) or **Inner** (only
> another agent can call it). It cannot be both.
>
> The **Compensation Framework** is the reason that distinction matters. It contains salary bands
> for every level. No employee should be able to open an assistant and browse it. So it lives on an
> agent that **has no chat interface at all** — it does not appear in the staff assistant list,
> and there is no URL that opens it. The only way to reach it is for the Helpdesk to ask it a
> specific question and relay a specific answer.
>
> That is a real permission boundary, not a filter. And it is why the Travel & Expense Policy sits
> on an Inner agent too: expense questions almost always arrive bundled with something else
> ("what's my limit *and* do I need to be in the office"), so the help desk is the right front door.
>
> If both agents simply duplicated a document that an Outer agent already had, the Inner agent would
> be pointless. The purpose is that these two documents are reachable **only** through the router.

## 2. The documents

Four ready-made PDFs, two pages each, in `docs/demo-documents/`:

| File | Upload to | Kind | Contains |
|---|---|---|---|
| `SaoMai_Employee_Handbook_2026.pdf` | HR Assistant | Outer | Leave, Tet, hybrid working, parental leave |
| `SaoMai_Engineering_Standards.pdf` | Engineering Assistant | Outer | Branching, gates, release windows, on-call |
| `SaoMai_Travel_Expense_Policy_v4.2.pdf` | **Expense Lookup** | **Inner** | Flights, hotel caps, per diem, mileage, approvals |
| `SaoMai_Compensation_Framework_2026_RESTRICTED.pdf` | **Compensation Lookup** | **Inner** | Salary bands, bonus multipliers, promotion criteria |

> **Why these numbers.** Every fact was chosen so the AI could not plausibly guess it. Vietnamese
> law sets annual leave at a minimum of 12 days — the handbook grants **18, rising one day per
> completed year to a cap of 24**, so "21 days after three years" can only come from reading the
> document. Invented internal terms like **Green Friday** and **anchor days** have no other
> possible source at all.

### Key facts by document

**Employee Handbook** — 18 days base leave, +1 per completed year, cap 24 · carry-over max 5 days,
lapse 31 March · **Green Friday**, last Friday of each month, non-working, not deducted · **anchor
days** Tuesday and Wednesday, on site · remote up to 3 days/week · Tet closure **9 consecutive
days**, of which **4 are company days** not deducted from leave · public holiday work paid at
**300%** · 13th month salary with January payroll · Tet performance bonus **0.5 to 1.5×** monthly
salary · salary review March and September · probation 60 days engineering, 30 days business
support · parental leave 6 months statutory **plus 2 months at 50% pay** · return-to-work ramp
**80% hours at 100% pay for 8 weeks** · secondary carer 10 days · internal transfer after 12 months
· referral bonus **15,000,000 VND**, half on start, half after 6 months · Hanoi office has no
parking, **600,000 VND/month** transport allowance instead.

**Travel & Expense Policy** — economy only; business class **only over 6 hours** · book **7 days
ahead** or need Finance Director approval · hotel caps **1,800,000 VND** HCMC/Hanoi, **1,400,000
VND** Da Nang/Nha Trang, **1,100,000 VND** elsewhere, **USD 140** international · per diem
**450,000 VND/day** domestic, **USD 65** international, half rate under 6 hours · Grab and taxi in
full · personal motorbike **3,500 VND/km**, car **8,000 VND/km** · **VAT invoice** required above
**200,000 VND**, issued to the company not the individual · claims within **30 days**, after **45
days** needs Finance Director · approvals: under 10m line manager, 10–50m Finance Director, above
50m CFO · client entertainment **1,500,000 VND per head**, pre-approved · Tet client gifts
**2,000,000 VND** per client, logged.

**Compensation Framework (RESTRICTED)** — bands L1 18–26m, L2 27–42m, **L3 45–62m**, L4 63–85m, L5 88–120m VND/month · business support roles at **82%** of the engineering band · Tet multiplier: Outstanding **1.5**, **Exceeds 1.2 at L1–L3** and 1.35 at L4+, Meets 0.9, Below none · minimum time in level L2→L3 **18 months**, L3→L4 **24 months** · promotions confirmed in March and September only · on promotion, midpoint of the new band or **+12%**, whichever is greater · bands re-benchmarked each **September**, adjusted if the market moves over **8%** · senior referral bonus **25,000,000 VND** at L4–L5, **40,000,000** at L6.

**Engineering Standards** — branches `feature/<ticket-id>-<short-description>` · **two approvals**,
one if under **50 lines** · coverage gate **70% on new code**, build fails below · critical CVE
patched within **72 hours** · release windows **Tuesday and Thursday 14:00–16:00 ICT** · never
Friday, never the day before a public holiday, never during the **9-day Tet closure** · rollback
SLA **15 minutes** · on-call one week, max one per **six weeks**, allowance **800,000 VND/week** ·
**SEV1** = outage or customer data at risk, **15-minute** response, hourly updates · post-incident
review within **5 working days** · credentials rotated every **90 days** · production DB access max
**8 hours** · **data for Vietnamese government clients stays in the Hanoi region**.

## 3. Assistant instructions

Paste these into the Instructions field. Short and specific beats long and vague.

**HR Assistant**
```
You answer questions about Sao Mai Technology's HR policies using only the employee handbook provided to you. Always state the specific figure or rule and cite the document.
If the handbook does not cover something, say so plainly and suggest the person contact
the HR team — never guess at a policy.
```

**Engineering Assistant**
```
You answer questions about Sao Mai Technology's engineering standards and release process
using only the standards document provided to you. Be precise about rules, thresholds and
timing windows, and cite the document. If a question is not covered, say so.
```

> **Fill the Description field on both Inner agents.** The platform uses `Description ?? Instructions`
> as the tool description the model sees when choosing which specialist to call. If you leave
> Description blank, the router's only routing signal is "You are a lookup service called by another
> agent…", which says nothing about *what it knows*. This is the single biggest cause of the Helpdesk
> calling the wrong specialist, or only one.
>
> - **Expense Lookup** — Description: `Travel and expense rules: flights, hotel limits by city, per diem, mileage, receipts, claim deadlines and approval thresholds.`
> - **Compensation Lookup** — Description: `Compensation reference: salary bands by level, Tet bonus multipliers, promotion criteria and referral bonuses.`

**Expense Lookup** *(Inner)*
```
You are a lookup service called by another agent, never by a person. Answer only from the
travel and expense policy provided to you. Give the exact limit, amount or threshold in two
or three sentences. If the question is not about travel or expenses, say so and stop.
```

**Compensation Lookup** *(Inner)*
```
You are a lookup service called by another agent, never by a person. Answer only from the
compensation framework provided to you. Give the exact band, multiplier or criterion asked
for, in two or three sentences. Never list the full salary table, and never volunteer figures
that were not asked for. If the question is not about compensation, say so and stop.
```

**Sao Mai Helpdesk** *(Outer, no documents, binds both Lookup agents)*
```
You are the general help desk for Sao Mai Technology staff. You hold no documents of your
own. You have two specialists you can ask: Expense Lookup for travel, hotels, mileage and
claims, and Compensation Lookup for salary bands, bonuses and promotion criteria. Work out
which specialist a question needs and ask it. If a question needs both, ask both, then give
one combined answer. State plainly which specialist each part came from, naming the document,
because the user cannot see the calls being made. Never answer a policy question from your own
knowledge, and never guess a figure a specialist did not give you.
```

---

## 4. The demo, step by step

Six steps, about 4 minutes 10 seconds. The arc is deliberate: **wrong specialist → right
specialist → a router that picks for you.**

### Step 1 — The deployed system · 15s
Already signed in, tab already open. *"This is running online, not on my laptop."*

### Step 2 — Creating an assistant · 35s
Admin → **Create New Agent**. Create a fourth department live: **Legal Assistant**. Type the name,
open the provider dropdown (all five visible), pick a model, paste two lines of instructions.

Do **not** upload documents — say *"I'd add the contract templates here, but ingestion takes a
minute, so I've prepared the others already."*

> Shows: setting one up is a form, not a development task.

### Step 3 — Tools, permissions and specialists · 35s
Open **Engineering Assistant** → **Tools** tab (web search on, others off) → **Access** tab
(granted to Engineering and Leadership).

Then open **Sao Mai Helpdesk** → **Inner Agents**. Show **Expense Lookup** and **Compensation
Lookup** ticked, and say: *"These two hold documents, but they have no chat interface — they never
appear in the staff assistant list. The only thing that can talk to them is this help desk."*

> Shows: capability, permission and delegation are all settings.

### Step 4 — The separation · 60s — **the most important minute**

Ask the **Engineering Assistant**:
> *"How many days of annual leave do I get after three years, and what is Green Friday?"*

Expect: it reports no context and declines. **Do not skip past this.** Pause and say: *"It doesn't
know — and it doesn't guess either."*

Now the **same question** to the **HR Assistant**:
> *"How many days of annual leave do I get after three years, and what is Green Friday?"*

Expect: **21 days** (18 base + 3 completed years, cap 24), and Green Friday as the last Friday of
each month — with a `[1]` citation.

Say: *"Same question, same model, same prompt. Only the assistant changed. Engineering can't reach
the HR documents — they aren't filtered out, they aren't there."*

> Shows: grounded answers, visible sources, and knowledge separation.

### Step 5 — The orchestrator · 65s — **the centrepiece**

> **There is no tool-call pane.** Inner-agent calls are invisible in both clients — only
> `get_weather` is renderable, and the Blazor chat discards tool chunks outright. So do **not**
> promise the audience they will watch it call two specialists. Prove it by contrast instead: make
> the Helpdesk produce facts that provably exist on no assistant anyone can see.

**Beat 1 — establish the gap.** Still on the **HR Assistant**, ask:

> *"What's my hotel limit per night in Da Nang?"*

It declines — the handbook says nothing about hotels. Say: *"So that isn't in HR. And look at the
list — there are only three assistants here. None of them is a finance assistant."*

**Beat 2 — the router answers anyway.** Switch to the **Sao Mai Helpdesk**, which holds no documents:

> *"I'm a Level 3 engineer travelling to Da Nang next week for a client workshop. What's my hotel limit per night, and what Tet bonus multiplier would I get on an Exceeds rating?"*

Expect a combined, attributed answer: **1,400,000 VND per night** for Da Nang, from the travel and
expense policy; and a Tet multiplier of **1.2** for an L3 rated Exceeds, from the compensation
framework.

**Beat 3 — land it.**

> *"Neither of those documents is on any assistant in that list. The expense policy and the
> compensation framework sit on agents with no chat interface at all — they never appear in the
> picker and there is no URL that opens them. The salary bands for every level in this company are
> in the second one. This help desk holds nothing itself. It worked out that one half was a finance
> question and the other was a compensation question, asked each specialist separately, and gave
> back one answer."*

> Shows: agent-to-agent delegation, automatic routing, multi-source synthesis, and a permission
> boundary that is structural rather than a filter.

**Expect a pause.** Two inner agents run as two nested, sequential calls, each possibly waking a
cold retrieval container. Fill it: *"It's asking the first specialist now, then the second."* Warm
every agent within 30 minutes beforehand (see the checklist) and this stays short.

### Step 6 — Replying with a form · 50s

Switch to the interactive client.
> *"Plan my client visit to Da Nang — three days, two people, from the 14th."*

The three-tab planner appears. Fill a field, change tab, submit.

**Say this out loud:** *"This is a demonstration skill — the itineraries and prices are invented,
nothing is being booked. What's real is that nobody wrote this screen. The assistant described it
and the app drew it."*

> Shows: generated interfaces, and your own honesty about what is and isn't real.

---

**Cut from the live run: the weather card.** It is still on slide 15 of the deck, and Step 5
demonstrates the tool mechanism better — an inner agent *is* a tool, so delegation proves the same
plumbing while showing something far harder to build. If you finish early, ask the Finance
Assistant *"what's the weather in Da Nang on Tuesday?"* as a 30-second encore.

## 5. Answer cheat sheet

Keep this visible while you present so you can catch a wrong answer immediately.

| Question | Correct answer | Document |
|---|---|---|
| Leave after 3 years | **21 days** (18 + 3, cap 24) | HR |
| Green Friday | Last Friday of each month, non-working, not deducted from leave | HR |
| Anchor days | Tuesday and Wednesday, on site | HR |
| Tet closure | **9 consecutive days**, 4 of them company days | HR |
| Working a public holiday | **300%** of daily rate, or 1.5× time off in lieu | HR |
| Referral bonus | **15,000,000 VND**, half on start, half after 6 months | HR |
| Return-to-work ramp | **80% hours at 100% pay** for 8 weeks | HR |
| Hotel cap, Da Nang | **1,400,000 VND/night** | Finance |
| Hotel cap, HCMC | **1,800,000 VND/night** | Finance |
| Domestic per diem | **450,000 VND/day** | Finance |
| VAT invoice threshold | Above **200,000 VND** | Finance |
| Claim after 50 days | Finance Director approval (past the 45-day line) | Finance |
| Business class | Only flights **over 6 hours** | Finance |
| Motorbike mileage | **3,500 VND/km** (car is 8,000) | Finance |
| Claim of 30,000,000 VND | **Finance Director** (the 10–50m band) | Finance |
| PR approvals, 30-line change | **1** (under the 50-line threshold) | Engineering |
| Coverage gate | **70%** on new code | Engineering |
| Deploy on Friday? | **No** — Tuesday and Thursday, 14:00–16:00 ICT only | Engineering |
| SEV1 response | **15 minutes**, hourly updates | Engineering |
| Critical CVE | Patched within **72 hours** | Engineering |
| Government client data | Stays in the **Hanoi region** | Engineering |
| **Helpdesk: Da Nang hotel limit** | **1,400,000 VND/night** | via Expense Lookup |
| **Helpdesk: L3 Tet multiplier, Exceeds** | **1.2** (1.35 at L4+) | via Compensation Lookup |
| L3 salary band | **45,000,000 to 62,000,000 VND/month** | Compensation |
| Time in level, L3 to L4 | **24 months** | Compensation |
| Senior referral bonus, L4 | **25,000,000 VND** | Compensation |

**If an answer comes back wrong**, do not argue with it on camera. Say *"that's not what the
policy says — let me show you the document,"* open the Knowledge Base tab and move on. Being
straight about a miss costs you far less than appearing not to notice.

---

## 6. Preparation checklist

Ordering matters here — several of these silently do nothing if done out of sequence.

**A week before**

- Read the four PDFs in `docs/demo-documents/` so you know what is in them.
- Create the five agents from section 1. **Set AgentKind at creation.** Expense Lookup and
  Compensation Lookup must be **Inner**; the other three **Outer**. Kind **cannot be changed
  afterwards** — a Lookup created as Outer must be deleted and recreated.
- Give every agent a **provider and model**. A blank provider on an *inner* agent does not degrade
  the Helpdesk — it breaks the Helpdesk's whole reply.
- Fill the **Description** field on both Inner agents (text in section 3).
- Upload each of the four PDFs to its one agent, per the table in section 2. **Four uploads, no
  document twice.** Wait for each to read **Uploaded**, not Processing.
- **Publish both Inner agents.** An unpublished inner agent is not even listed in the Helpdesk's
  Inner Agents tab, so you cannot bind what you have not published.
- *Then* bind Expense Lookup and Compensation Lookup as inner agents of the Sao Mai Helpdesk.
- **Unpublish the seeded "Default Agent".** It ships published, so the picker will otherwise show
  four assistants and the line "there are only three assistants here" will be visibly false.
- Decide who you present as. Access is owner **or** admin **or** an explicit role grant. If you
  demo as an ordinary staff user with no grant on the two Lookup agents, the Helpdesk loses both
  tools **silently** and answers from general knowledge. Simplest: present signed in as Admin.
- Switch on web search for the Engineering Assistant, and the trip-planning skill for whichever
  assistant does Step 6.

**The day before — full dry run**

- Ask every question in section 5, including the Helpdesk ones.
- Confirm the staff assistant picker shows **exactly three** assistants.
- Confirm the Helpdesk answers with **both** halves and names both sources.
- Confirm the Helpdesk still works at all — it has no documents of its own, and an empty knowledge
  base is the one configuration least exercised by the test suite. If it errors, give it a
  throwaway text file as a knowledge base.
- Time it. Four and a half minutes is less than it feels.
- Screen-record the whole run as a fallback.

**Ten minutes before**

- **Warm every agent** — ask each one a throwaway question. Retrieval containers shut down after
  30 minutes idle and cold-starting one mid-demo is up to a minute of silence.
- Every tab open and signed in. Never sign in on camera.
- Fresh conversation on each assistant.
- Close Slack, email, notifications. Browser zoom ~125%.

## 7. Traps

Every one of these was found by reading the source, and every one fails **silently**.

**The Helpdesk loses its specialists with no error.** Access is owner or admin or an explicit role
grant, re-checked when the tool is called. Present as a user without a grant on the two Lookup
agents and the Helpdesk simply has no tools — it will answer confidently from general knowledge,
with nothing on screen to say anything is wrong. Present as Admin, or grant the roles.

**A broken Inner agent takes the Helpdesk down with it.** If an inner agent has no provider or
model, building it throws while the Helpdesk is assembling its tools, and the failure is not caught
— you get a broken stream, not a degraded answer. Check every agent has a provider and model.

**Nothing on screen shows delegation happening.** Only `get_weather` is renderable; the Blazor chat
discards tool chunks. Your proof is the attributed answer plus the fact that no visible assistant
holds those documents. Never say "watch it call the specialists."

**AgentKind is immutable after creation.** There is no control to change it on an existing agent.
Create a Lookup as Outer by mistake and it appears in the staff picker — putting the salary bands
one click from every employee — and cannot be bound to the Helpdesk. Delete and recreate.

**An unpublished Inner agent cannot be bound.** It is not listed in the Inner Agents tab at all, so
the binding step looks broken when the real problem is upstream. Publish first, bind second.

**The seeded "Default Agent" is published.** It will appear in the picker and contradict the line
that makes Step 5 land. Unpublish it.

**Cold starts.** Each retrieval container shuts down after 30 minutes idle and can take up to a
minute to wake. Step 5 makes two nested calls in sequence. Warm everything first.

**The document uploaded to the wrong agent.** If the handbook lands on Engineering, Step 4 inverts
and the argument collapses. Check twice.

**Do not simplify the numbers.** If you replace "18 days rising to 24" with a round "12 days", the
model may answer correctly from general knowledge of Vietnamese labour law with no document at all
— and you will have proved nothing. The awkward numbers are the point.

**The `[1]` citation is produced by prompting, not guaranteed by the platform.** It appears
reliably in practice, but do not promise it before it renders. Say "and there's the source" after
you see it, not before.

**A stale conversation.** Memory across conversations is on by default. Start fresh conversations
before recording.

**Real personal data.** Everything here is invented. Do not substitute a real CV, a real salary
band or a real client name — it will be on screen in front of an examiner panel.

## 8. Why this scenario answers the examiners' likely questions

| Question | Where the demo answers it |
|---|---|
| "How is this different from ChatGPT?" | Step 4 — three assistants, three document sets, three permission groups, one platform |
| "How do you stop it making things up?" | Step 4 — it declines when it has nothing, and cites when it does |
| "Can one assistant see another's documents?" | Step 4 — demonstrated, not asserted |
| "How do you stop staff reading the salary bands?" | Step 5 — the document sits on an agent with no chat interface |
| "What does the orchestrator actually do?" | Step 5 — one question, two specialists, one attributed answer |
| "Does it scale past a toy?" | Step 2 — a fourth department created live, in under a minute |
| "What's actually novel here?" | Step 6 — an interface nobody wrote |
| "Is this safe to put near company data?" | Step 3 — permissions per assistant, per role |
