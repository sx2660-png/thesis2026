---
layout: default
title: M2 Project Plan
nav_order: 2
---
## Project Overview

**Trading Brain** is a human-in-the-loop AI decision-support system for Guangdong electricity spot trading. The project focuses on the day-ahead declaration moment, when traders must decide whether an existing automated strategy can still be trusted or whether abnormal market conditions require human review.

The revised project direction is not only to build an agent workflow, but to study how an AI assistant can support the cognitive work of electricity traders. The design should help traders notice unusual market situations, understand why the system raises an alert, judge whether the evidence is relevant, and decide whether to continue automation, adjust the strategy, or pause for manual intervention.

This version responds to the June 27 feedback by making the project more explicitly centered on human-computer interaction, rapid prototyping, staged testing, and evidence of design effectiveness.

---

# Revised Design Focus

## Human Decisions the Design Should Support

The system is designed to support four types of trader decisions:

- **Risk recognition:** Is today's market condition normal enough for the existing automated strategy to continue?
- **Evidence interpretation:** Which policy, market, weather, constraint, or price-spread evidence explains the alert?
- **Trust calibration:** Should the trader trust the model output, challenge it, or request more evidence?
- **Intervention choice:** Should the trader continue automatic declaration, switch to a defensive strategy, or pause for human review?

These decisions are difficult because traders face time pressure, fragmented information sources, uncertain forecasts, delayed ground-truth price data, and rare market shifts that may invalidate past patterns. The prototype should reduce this cognitive burden without hiding uncertainty or overclaiming confidence.

## Design Hypotheses

- If the system groups evidence by signal type, time window, and region, traders will review alerts faster and with fewer irrelevant distractions.
- If the alert level is explained through signal weights and supporting evidence, traders will better understand why an alert is `HIGH` or `CRITICAL`.
- If the interface separates pre-declaration warning from post-event validation, traders will better judge what the system could reasonably know at the decision time.
- If the system provides a clear human review path instead of automatic execution in abnormal cases, traders will feel more confident using AI support in high-stakes trading decisions.

## Theoretical Grounding

The project will use AI-assisted decision-making and human-AI collaboration literature to guide the interaction design. The key concepts are:

- human-AI collaboration patterns and when AI should recommend, explain, defer, or ask for review;
- trust calibration and the risk of overreliance or underreliance on AI;
- uncertainty communication in decision-support interfaces;
- evidence-centered explanations for high-stakes operational decisions.

Initial readings from the June 27 feedback include:

- Gomez, Cho, Ke, Huang, and Unberath on AI-assisted decision-making interaction patterns.
- Steyvers and Kumar on challenges in AI-assisted decision making.
- Prabhudesai et al. on how users perceive uncertainty in human-AI decisions.
- Lai et al. on the design space for human-AI collaborative decision making.

---

# Design Process and Timeline

## Phase 1: Discover, Research, and Analyze

**Milestone: M1 -> M2**  
**Time: April 21 - May 11, 2026**  
**Status: Completed**

### Goal

Understand the real electricity trading context and define what kind of AI decision support would be useful before day-ahead declaration.

### Methods

- Analyze the daily workflow of electricity traders.
- Identify the data questions traders ask before declaration.
- Study Guangdong electricity spot market rules.
- Discuss enterprise needs and trading pain points.
- Identify a real enterprise case where market price and spread patterns changed and prediction errors became larger.

### Design Questions

- What information do traders need before declaration?
- Which parts of the workflow are routine, and which require expert judgment?
- Where can an AI assistant reduce cognitive load without replacing responsibility?

### Deliverables

- Initial idea;
- problem framing;
- trader workflow analysis;
- enterprise case as a test scenario;
- first version of project plan.

---

## Phase 2: Define, Synthesize, and Reframe

**Milestone: M2 -> M3**  
**Time: May 12 - May 24, 2026**  
**Status: Completed**

### Goal

Turn research findings into a clear design direction: a risk-warning and decision-support agent, not a fully autonomous trader.

### Methods

- Synthesize policy research, trader workflow, and enterprise needs.
- Define the core human decision moments.
- Identify system functions:
    - policy understanding;
    - market information search;
    - market anomaly detection;
    - risk control;
    - human review trigger;
    - evidence explanation.
- Define the evaluation scenario using the enterprise case.

### Design Questions

- Which signals should influence the warning level?
- What evidence should be shown to a trader, and what should be filtered out?
- What should the system do when evidence is incomplete or uncertain?

### Deliverables

- Refined problem statement;
- research paper draft;
- design requirements;
- agent workflow model;
- initial evaluation criteria.

---

## Phase 3: Ideation and System Concept

**Milestone: M4**  
**Time: May 25 - May 31, 2026**  
**Status: Completed**

### Goal

Explore possible system designs and decide the structure of the prototype.

### Methods

- Compare possible agent roles:
    - policy assistant;
    - trading strategy assistant;
    - compliance checker;
    - market anomaly detector;
    - human review trigger.
- Decide to use a multi-agent workflow.
- Design the first workflow structure:

```text
Web Search -> Policy -> Prediction -> Strategy -> Risk -> Execution / Human Review
```

- Choose LangGraph for workflow orchestration.

### Design Questions

- Which decisions should remain with the trader?
- Where should the system stop automation and ask for review?
- What information should be carried through the workflow state?

### Deliverables

- System concept;
- multi-agent architecture;
- workflow diagram;
- design rationale.

---

## Phase 4: Rapid Prototype and Core Agent Development

**Milestone: M5**  
**Time: June 1 - June 14, 2026**  
**Status: Completed**

### Goal

Build a working prototype that can simulate the trading declaration workflow and produce reviewable alerts.

### Methods

- Build the shared `TradingState`.
- Build mock prediction, strategy, and execution agents.
- Build Policy Agent using local policy documents.
- Build Web Search Agent using online search.
- Build Market Anomaly Agent to detect abnormal price, spread, rule, and constraint signals.
- Build Risk Agent to check declaration risk and trigger recalculation or human review.
- Use LangGraph to connect the workflow.

### Prototype Test Questions

- Can the workflow run end to end?
- Can the system generate an alert before the declaration decision point?
- Can it preserve the evidence and reasoning needed for human review?

### Deliverables

- Working FastAPI prototype;
- LangGraph workflow;
- Policy Agent;
- Web Search Agent;
- Market Anomaly Agent;
- Risk Agent;
- basic tests;
- clean repo structure.

---

## Phase 5: Evidence Quality, Alert Explanation, and Enterprise Integration

**Milestone: M5 -> M6**  
**Time: June 15 - July 5, 2026**  
**Status: Current**

### Goal

Improve the prototype based on enterprise and instructor feedback, with a stronger focus on evidence relevance, alert explainability, and human decision support.

### Methods

- Replay the enterprise case for May 25-27 using strict information cutoffs:
    - May 25 decision uses information before May 24 12:00;
    - May 26 decision uses information before May 25 12:00;
    - May 27 decision uses information before May 26 12:00.
- Improve evidence filtering:
    - prioritize Guangdong, South China, Guangdong Power Exchange Center, and regional energy-regulation sources;
    - reduce irrelevant out-of-province or broad industry news;
    - separate recent operational evidence from older background information.
- Improve alert explanation:
    - show which signals support the alert;
    - show which evidence supports each signal;
    - distinguish `HIGH` from `CRITICAL`;
    - identify possible false-positive evidence.
- Separate pre-declaration warning from post-event validation.
- Connect the current risk-warning agents beside the enterprise's existing agent modules instead of expanding mock prediction, strategy, and execution modules.

### Prototype Test Questions

- Does each alert have relevant evidence for the trader's region and decision time?
- Can a trader understand why the alert level was produced?
- Does the system avoid raising `CRITICAL` because of irrelevant evidence?
- Can the risk-warning layer be called by the enterprise's existing agent system?

### Deliverables

- Updated evidence filtering logic;
- alert explanation report;
- enterprise integration plan for the risk-warning layer;
- updated case replay report;
- feedback notes from enterprise or domain experts;
- Project Plan v2.

---

## Phase 6: Human-Centered Evaluation and First-Semester Final

**Milestone: M6**  
**Time: July 6 - July 20, 2026**  
**Status: Planned**

### Goal

Prepare the first-semester final prototype and evaluate whether the design supports trader decision-making, not only whether the agent runs correctly.

### Methods

- Create a concise demo workflow for the enterprise case.
- Prepare a decision-support interface or report view showing:
    - alert level;
    - signal summary;
    - evidence grouped by source, time, region, and signal;
    - recommended human action;
    - uncertainty or missing-data notes.
- Conduct lightweight user/expert testing with traders, enterprise collaborators, or domain experts when available.
- Ask participants to review alerts and explain what action they would take.
- Compare feedback across:
    - speed of understanding;
    - perceived usefulness;
    - confidence in the alert;
    - ability to identify irrelevant evidence;
    - clarity of the recommended action.

### Evaluation Questions

- Does the prototype help users make faster or more careful pre-declaration decisions?
- Does it improve attention to abnormal or rare market conditions?
- Does the explanation help users calibrate trust in the AI output?
- What information is still missing for a trader to act confidently?

### Evidence of Effectiveness

- Users can correctly identify why an alert was triggered.
- Users can distinguish relevant from irrelevant evidence.
- Users can explain whether they would continue automation or pause for review.
- Feedback identifies specific interface or evidence-format improvements.
- The system demonstrates value in both normal and abnormal scenarios.

### Deliverables

- First-semester prototype demo;
- M6 video pitch / presentation;
- first-semester paper;
- README and technical documentation;
- user/expert testing notes;
- reflection and next-step plan.

---

# Second Semester Plan

## Phase 7: Project Plan S2 and Product Direction

**Milestone: M7**  
**Time: September 1 - September 15, 2026**  
**Status: Planned**

### Goal

Review first-semester results and decide how to turn the prototype into a more complete decision-support product.

### Methods

- Share the prototype and reports with enterprise collaborators.
- Collect feedback from traders or domain experts.
- Define the SaaS product direction.
- Decide which features are most important for real users.
- Translate HCI findings into product requirements.

### Deliverables

- Updated project plan;
- enterprise feedback summary;
- revised product requirements;
- SaaS product direction.

---

## Phase 8: Interface Design, Development, and Testing

**Milestone: M8**  
**Time: September 16 - November 10, 2026**  
**Status: Planned**

### Goal

Improve the prototype into a usable and testable human-AI decision-support system.

### Methods

- Design a dashboard for:
    - market anomaly signals;
    - evidence sources;
    - declaration curves;
    - risk status;
    - uncertainty notes;
    - human review decisions.
- Conduct usability testing with target users or experts.
- Improve the agent workflow and interface based on feedback.
- Refine evaluation metrics around decision quality, confidence, attention to edge cases, and trust calibration.

### Deliverables

- SaaS-style dashboard prototype;
- usability testing results;
- iterated system;
- evaluation summary.

---

## Phase 9: Final Demo and Thesis Paper

**Milestone: M9**  
**Time: November 11 - December 10, 2026**  
**Status: Planned**

### Goal

Complete the final thesis project and present the finished system.

### Methods

- Prepare final demo.
- Complete final thesis writing.
- Summarize design process, system evaluation, and limitations.
- Consider writing a short method paper or preprint if the results are strong enough.

### Deliverables

- Final thesis paper;
- expo presentation;
- final prototype demo;
- final documentation.

---

# Timeline Summary

| Milestone | Phase | Time | Main Focus | Deliverables |
| --------- | ----- | ---- | ---------- | ------------ |
| M1 | Initial Idea | Apr 21 - May 11, 2026 | Understand trading context | Initial concept, problem framing |
| M2 | Project Plan | May 12 - May 24, 2026 | Define project direction | Project plan, design requirements |
| M3 | Research Paper | May 12 - May 24, 2026 | Synthesize research | Research paper draft |
| M4 | Ideation | May 25 - May 31, 2026 | Design workflow concept | Agent architecture, workflow diagram |
| M5 | Initial Prototype | Jun 1 - Jun 14, 2026 | Build core prototype | Core agents, LangGraph workflow |
| M6 | First-Semester Final | Jun 15 - Jul 20, 2026 | HCI evaluation and validation | Evidence replay, interface/report prototype, user/expert feedback |
| M7 | Project Plan S2 | Sep 1 - Sep 15, 2026 | Revise product direction | Updated plan and product requirements |
| M8 | Development & Testing | Sep 16 - Nov 10, 2026 | SaaS prototype and usability testing | Dashboard, testing, iteration |
| M9 | Expo & Final Paper | Nov 11 - Dec 10, 2026 | Final delivery | Thesis, demo, documentation |

---

# Current Progress

As of June 29, 2026, I have completed:

- trader workflow analysis;
- Guangdong market rule document collection;
- FastAPI prototype;
- shared trading state model;
- Policy Agent;
- Web Search Agent;
- Market Anomaly Agent;
- Risk Agent;
- LangGraph workflow;
- human review trigger;
- enterprise case replay for May 25-27;
- initial evidence report;
- enterprise feedback summary;
- revised project plan focused on HCI, rapid prototyping, and staged evaluation.

The next step is to improve evidence relevance and alert explanation, connect the risk-warning layer to the enterprise's existing agent system, and test whether the design helps humans make clearer pre-declaration decisions under uncertainty.
