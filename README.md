# NTG Agent — Capstone presentation materials

Presentation and demonstration materials for the **NTG Agent** capstone project.
Team QUOTA · NashTech · RMIT Capstone 2026.

The application source code lives in a separate repository:
<https://github.com/nashtech-garage/ntg-agent>

---

## Contents

| Path | What it is |
|---|---|
| `NTG-Agent-Capstone-Presentation.pptx` | The slide deck — 26 slides, 16:9, with full speaker notes and timings |
| `presentation-flow.md` | The build plan: assessment requirements, timing budget, section ownership |
| `demo-scenario.md` | The live-demo runbook — agents to create, questions to ask, expected answers, failure modes |
| `demo-documents/` | Four fictional PDFs used as the demo knowledge bases |
| `images/` | Application screenshots, six of which are embedded in the deck |

---

## The slide deck

Built as a `.pptx` so it opens anywhere. To edit in Google Slides: drag the file into Drive,
**Open with → Google Slides**, then **File → Save as Google Slides**.

Every slide carries speaker notes with a timing and a compressed version to fall back on if the
talk runs long. Six screenshots are embedded with non-destructive crops, so the full images are
intact inside the file and the crop can be adjusted in the editor.

## The demo documents

`demo-documents/` holds four invented internal policy documents for **Sao Mai Technology JSC**, a
fictional Vietnamese software consultancy. They exist to be uploaded as knowledge bases so the
demo can show one assistant answering from a document while another cannot reach it.

The numbers in them are deliberately awkward — 18 days of annual leave rising to 24, a
1,400,000 VND hotel cap for Da Nang — so that a correct answer can only have come from reading
the document rather than from the model's general knowledge. Do not round them off.

`SaoMai_Compensation_Framework_2026_RESTRICTED.pdf` is the one that carries the argument: it holds
salary bands, so it is uploaded to an agent with no chat interface and is reachable only by
delegation from the help desk.

**Every company, person, policy and figure in these documents is invented.**

## The screenshots

Captured from a running deployment. `images/11-DocumentCVChatScreen.png` shows a résumé being
summarised; it is cropped in the deck so only the first paragraph and the citation marker appear.

---

## Reading order

1. `presentation-flow.md` — what the assessment asks for and how the time is spent
2. `demo-scenario.md` — what to set up before recording, in order
3. The deck, in presenter view, for the notes
