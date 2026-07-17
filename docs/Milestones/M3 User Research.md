---
layout: default
title: M3 User Research
nav_order: 3
---
# User Research
## Project Position

**Trading Brain** is a human-in-the-loop AI decision-support prototype for Guangdong electricity spot trading. It focuses on the **day-ahead declaration moment**: a trader must decide whether an existing automated strategy can continue, should be recalculated, or should pause for human review.

The project does not claim that AI should make electricity trades autonomously. Its research question is:

> How can a multi-agent AI system help electricity traders notice abnormal market conditions, inspect the evidence behind an alert, and make a responsible intervention decision before day-ahead declaration?

This paper frames the technical workflow as a learning and decision-support problem. It develops three design commitments:

1. translate electricity-trading scale and consequences for a non-specialist audience without exaggerating causality;
2. make the conditions behind each system recommendation transparent;
3. design a prototype walkthrough that shows where people remain in control.

---

# 1. Problem

**The decision problem.**

Electricity cannot be treated like an ordinary product that can simply be stored and delivered later. In the spot market, traders and operators make time-bounded decisions using forecasts, contracts, market rules, operational constraints, and rapidly changing market information. China's market rules recognize multiple market types and participants, including medium- and long-term transactions, spot transactions, ancillary services, generators, retailers, users, and new market entities. The day-ahead market is therefore a consequential coordination point rather than a simple price-prediction task. [National Development and Reform Commission, *Electricity Market Operation Basic Rules* (2024)](https://zfxxgk.ndrc.gov.cn/wap/iteminfo.jsp?id=20379); [NDRC and NEA, *Spot Electricity Market Basic Rules (Trial)*](https://zfxxgk.ndrc.gov.cn/web/iteminfo.jsp?id=20272)

In the enterprise workflow behind this project, traders still need to manually interpret policy documents, check declaration constraints, review market news, and decide how seriously to treat a potentially abnormal signal. General-purpose AI can summarize text, but it does not naturally preserve a decision-time record of what evidence was available, which rule or signal mattered, and why automation should stop. This creates four connected risks:

- **Information fragmentation:** policy, market data, news, forecasts, and internal strategy outputs arrive from different sources.
- **Time pressure:** the declaration decision must be made before the actual delivery and settlement outcome is known.
- **Model fragility:** a strategy that works in a normal market regime can become unreliable when price spreads, constraints, or rules shift.
- **Opaque escalation:** a warning without traceable evidence can cause either over-reliance on AI or dismissal of a useful alert.

The design challenge is therefore not only to detect risk. It is to make the moment of intervention legible: *what happened, why does it matter now, what is uncertain, and what can the trader do next?*

**Scale of the operating environment.**

The need for interpretable decision support is shaped by the scale and complexity of the market, not only by the existence of AI technology:

| Indicator | Latest available figure | Why it matters for this project |
| --- | ---: | --- |
| China's total electricity consumption in 2024 | **9.8521 trillion kWh**, up **6.8%** year on year | Shows the national scale of electricity demand that market systems coordinate |
| Electricity traded by provincial trading centres in 2024 | **4.75 trillion kWh**, up **5.4%** year on year | Confirms that a large share of electricity is coordinated through formal market mechanisms |
| Southern regional market daily trading volume | **3.8 billion kWh/day** | Places Guangdong within a large, cross-provincial market rather than an isolated local workflow |
| Registered entities in the Southern regional market | **more than 220,000** | Signals the coordination challenge across generators, retailers, users, and new market entities |
| November 2024 regional-market clearing model | **6,000+ nodes, 4,500 lines, 1,800 units, 1,700 interfaces, and 1.5 million+ constraints** | Shows why a human operator cannot inspect every relevant system condition manually |

The first two figures come from the National Energy Administration's 2024 market report. The Southern regional market figures are published by the National Energy Administration and its Southern regulator. These sources do not prove that Trading Brain will improve a market outcome; they establish why time-sensitive, evidence-rich decision support is a meaningful research problem. [NEA, *2024 Annual China Electricity Market Development Report*](https://www.nea.gov.cn/20250717/54ae0fdb11f04b39a5b670999c04ef81/c.html); [NEA, *Southern Regional Electricity Market Starts Continuous Settlement Trial*](https://www.nea.gov.cn/20250701/dc548c119e754bf1afa29c3766daf901/c.html); [NEA Southern Regulator, *November 2024 Trial*](https://nfj.nea.gov.cn/xwzx/jgdt/202411/t20241128_273008.html)

**Translating the stakes for non-specialists.**

`1,000 MWh = 1,000,000 kWh`. For a non-specialist, the value is still difficult to interpret without a reference point. The U.S. Energy Information Administration reports that a U.S. residential electric-utility customer purchased an average of 10,791 kWh in 2022, or approximately 29.6 kWh per day. On that basis, 1,000 MWh represents roughly **33,800 U.S. residential customer-days** of electricity use. This is a scale analogy, not a Chinese household estimate and not a claim that a single declaration decision directly determines those households' supply. [EIA, *How Much Electricity Does an American Home Use?*](https://www.eia.gov/tools/faqs/faq.php?id=97&t=7)

The more accurate causal chain is:

```text
weak or outdated evidence
    -> an inappropriate automated declaration or missed review
    -> commercial exposure, deviation/settlement cost, or a less robust strategy
    -> repeated or system-wide poor decisions can increase market stress and reduce operational resilience
```

For a regular person, the immediate value is indirect. Better trading decisions can help organisations avoid unnecessary commercial losses and respond more cautiously to unusual conditions; they are one small part of the broader systems that aim to keep supply, demand, and prices coordinated. Trading Brain should therefore communicate **risk awareness and accountable automation**, not promise that it can prevent outages or control consumer prices on its own.

---

# 2. Target Learners

**Primary learner: electricity trader or trading operator.**

In this project, a *learner* is not a novice student completing a course. It is a domain practitioner who must learn from the system's evidence in order to make a decision. The primary learner is an electricity trader or operator working with a day-ahead declaration workflow in Guangdong.

They may already understand market routines, contracts, and internal strategy outputs. Their learning need is more specific: when the system surfaces an alert, they must quickly learn what has changed in the market context, how relevant the evidence is, and whether normal automation remains appropriate.

The following decision moments define what the learner needs from the system:

| Decision moment | What the trader needs to learn | What the interface must make visible |
| --- | --- | --- |
| A warning appears | Whether the condition is unusual enough to disrupt the current strategy | Alert level, affected market/region, time window, and one-sentence reason |
| The warning is questioned | Which evidence supports the claim and whether it is decision-time safe | Source, publication time, region, evidence type, matched signal, and limitations |
| A response is chosen | Whether to continue, recalculate, or ask for review | Triggered rule/signal, uncertainty, recommended action, and available override |
| The outcome is reviewed | Whether the logic was useful and what should be adjusted | Replay result, decision log, human action, and evaluation note |

**Target learner research findings and stakeholders.**

Three secondary audiences shape the design even though they do not make the final trade:

- **Risk and compliance staff** need an auditable account of what information informed a recommendation.
- **Enterprise product and engineering teams** need stable inputs, outputs, and an integration path beside existing prediction, strategy, and execution agents.
- **Non-domain stakeholders** such as product managers, auditors, and future adopters need a plain-language explanation of why a human is asked to intervene.

At this stage, these learner characteristics are derived from workflow analysis, enterprise material, and secondary research rather than formal trader interviews. This is an evidence limitation. The next research stage should validate the assumptions through lightweight interviews or think-aloud sessions with traders and domain experts, rather than treating the current description as a final persona.

**Provisional persona: a trader reviewing a time-bound alert.**

**Li Wei** is a fictional composite used to test the interface, not a claim about a specific employee. Li receives a proposed day-ahead strategy from an existing enterprise system. Ten minutes before a decision checkpoint, Trading Brain raises `HUMAN REVIEW`. Li does not need a tutorial on basic electricity markets; Li needs to know whether the alert is local, recent, relevant to the current strategy, and sufficiently credible to interrupt automation. This persona motivates an interface that begins with a concise reason and makes deeper evidence available on demand.

**Learning outcomes.**

After using the report or dashboard, a trader should be able to:

1. identify the specific signal that triggered the alert;
2. distinguish live, decision-time evidence from background policy context and offline validation;
3. identify missing, weak, outdated, or geographically irrelevant evidence;
4. explain why the system recommended `PASS`, `RECALCULATE`, or `HUMAN REVIEW`;
5. record and justify an override or intervention decision.

These outcomes are more meaningful than asking whether users merely "trust AI." They test whether the system supports calibrated trust: appropriate reliance when the evidence is strong, and appropriate skepticism when it is weak or uncertain.

---

# 3. Landscape Audit

**Market and policy environment.**

Trading Brain sits within a regulated, evolving market environment. China's current rules establish a national electricity-market framework and define the relationship between market members, trading types, market operation, and supervision. The spot-market rules also frame spot electricity trading as activity carried out from day-ahead through intraday to before real-time dispatch, which reinforces the importance of decision-time information and workflow traceability. [NDRC, *Electricity Market Operation Basic Rules*](https://zfxxgk.ndrc.gov.cn/wap/iteminfo.jsp?id=20379); [NDRC and NEA, *Spot Electricity Market Basic Rules (Trial)*](https://zfxxgk.ndrc.gov.cn/web/iteminfo.jsp?id=20272)

For this project, the relevant implication is not that Trading Brain should automate regulatory interpretation. It is that policy constraints and market rules must be treated as versioned, inspectable context. A background policy PDF can explain why a constraint matters, but it should not automatically be treated as fresh evidence of a market anomaly.

**Existing solution categories.**

| Category | Typical strengths | Limitation for this project | Trading Brain response |
| --- | --- | --- | --- |
| **Energy trading and risk management platforms** | Position management, scheduling, valuation, risk analysis, settlement, and reporting | Usually organise transactions and quantified risk; they do not necessarily explain how fresh external evidence changes a recommendation at one decision moment | Operate as a complementary risk-warning layer, not a replacement ETRM |
| **Forecasting and optimisation systems** | Price/load forecasts, scenario analysis, strategy optimisation | Often evaluate numerical accuracy or profit, rather than whether people understand when a model is unreliable | Surface forecast-breakdown risk and route it to an explicit review decision |
| **Generic AI assistants / search tools** | Rapid retrieval, summarisation, drafting | Weak decision-time provenance, unstable relevance filtering, unclear authority to trigger action | Filter by time and region; classify evidence; preserve source links and uncertainty |
| **Rule engines and compliance checks** | Deterministic constraints and repeatable checks | Can reject a violation but may not express evolving market context or ambiguous evidence | Combine policy constraints with market-anomaly signals and separate the two in the report |

Commercial ETRM products illustrate the established focus on end-to-end trade lifecycle, positions, risk analysis, scheduling, and settlement. For example, Hitachi Energy describes its ETRM offering around trade capture, position management, risk analysis, and settlement. This confirms that Trading Brain should not try to rebuild an enterprise trading platform. Its narrower research contribution is the moment before execution: explainable anomaly detection, evidence review, and human intervention. [Hitachi Energy, *Energy Trading and Risk Management Software*](https://www.hitachienergy.com/products-and-solutions/energy-portfolio-management/energy-commercial-enablement-software-solutions/energy-trading-and-risk-management-etrm-software-solution)

The Guangdong context further illustrates why this distinction matters. By December 2022, the Southern market, starting with Guangdong, had run more than 13 months of continuous settlement; market entities had increased from 29,000 to 48,000, medium- and long-term transaction volume was approximately 276.9 billion kWh, and spot transaction volume approximately 20.1 billion kWh. Those figures demonstrate a mature operational setting where the value of a new tool lies in better decision support and governance, rather than in simply adding another forecasting model. [NEA Southern Regulator, *Long-Period Settlement Operation in the Southern Market*](https://www.nea.gov.cn/2022-12/09/c_1310682779.htm)

**Human-AI decision-support landscape.**

Human-AI decision-making research warns against treating an AI recommendation as sufficient support. Gomez et al.'s review of 105 articles argues that many systems still rely on limited interaction patterns rather than genuinely collaborative workflows. Steyvers and Kumar identify three recurring challenges: achieving human-AI complementarity, understanding users' mental models and reliance strategies, and choosing the right timing and amount of model information. [Gomez et al. (2025)](https://www.frontiersin.org/journals/computer-science/articles/10.3389/fcomp.2024.1521066/full); [Steyvers and Kumar (2024)](https://escholarship.org/uc/item/90m3w384)

This literature shifts the design question from “How accurate is the agent?” to “What information allows a trader to make an appropriately calibrated decision with the agent?” Lai et al. similarly argue that human-AI decision-making should be evaluated through task design, assistance elements, and outcome measures, not model performance alone. [Lai et al. (2023)](https://doi.org/10.1145/3593013.3594087)

**Landscape gap.**

The gap that Trading Brain addresses is an **evidence-centred intervention layer** for high-stakes operational automation:

- it is **decision-time aware**: the report distinguishes what was available before declaration from later validation data;
- it is **evidence-centred**: each alert must connect to region, time, source quality, and a specific signal;
- it is **action-oriented**: the system recommends a bounded next action rather than a vague warning;
- it is **human-accountable**: a trader can inspect, challenge, override, or pause the workflow.

This is a design hypothesis, not yet a claim of proven effectiveness. The prototype must be tested with realistic cases and participant responses.

---

# 4. Goals & Context of Use

**Context of use.**

The core use case is a day-ahead declaration workflow. Before the submission deadline, the system receives the trading date, market type, forecast outputs, strategy result, contract position, policy context, and market information available before the cutoff. It does not use later prices to create a warning.

```text
Enterprise prediction / strategy outputs
        +
Policy and market context available before the cutoff
        +
Market-anomaly evidence
        -> Trading Brain risk review
        -> PASS / RECALCULATE / HUMAN REVIEW
        -> trader decision and decision note
```

The prototype's current enterprise case replays the Guangdong market from May 25 to May 27, 2026. These are treated as review-recommended days because price and price-spread patterns shifted sharply. May 28 is treated as continuation of the same abnormal regime rather than a new warning; May 29 is not flagged because the full direction structure breaks. This boundary is valuable because it tests whether the system can avoid both missed anomalies and repetitive over-alerting.

**Goals.**

The design has five goals:

1. **Make the abnormal condition visible.** Alert traders to unusual market conditions before an automated strategy proceeds.
2. **Explain the recommendation.** Show the evidence, signal, policy constraint, threshold, and uncertainty that led to the action.
3. **Protect decision-time integrity.** Clearly separate online warning inputs from offline replay and calibration data.
4. **Support bounded intervention.** Let traders continue, request recalculation, pause for review, or override with a reason.
5. **Fit beside enterprise systems.** Receive existing prediction and strategy outputs rather than replacing them.

**Recommendation mechanism.**

The central design question is: *what should trigger a particular agent recommendation?* The prototype should answer this in an inspectable rule-and-evidence model rather than claiming a mysterious AI score.

| Recommendation | Example trigger conditions | What the trader sees | Human role |
| --- | --- | --- | --- |
| `PASS` | No high-severity policy violation; no decision-time-safe abnormal signal above the review threshold; evidence is weak, stale, or irrelevant | “No review required” plus a concise evidence summary | May proceed; can still inspect the report |
| `RECALCULATE` | Strategy conflicts with a policy/contract constraint, or a credible signal changes a strategy assumption while enough data remains for recomputation | The conflicted input/constraint and the assumption that changed | Request a revised strategy, compare before/after |
| `HUMAN REVIEW` | High-severity, recent, region-relevant anomaly evidence; material uncertainty; conflicting signals; or a high-impact policy/operational constraint that cannot be resolved automatically | Why now, matched signals, original sources, uncertainty, and recommended review action | Pause automation; confirm, adjust, or override with a note |
| `REJECT` | A hard rule violation or an execution precondition is not met | The exact violated requirement and affected field | Correct the issue before execution |

**Evidence hierarchy.**

To make these recommendations transparent, the report must classify inputs into three categories:

- **Live event evidence:** recent, Guangdong-relevant, time-stamped evidence that was available before the declaration cutoff. It can influence alert level.
- **Background reference:** policy PDFs, older notices, and undated materials. It provides context but cannot independently raise a high alert.
- **Offline market-data review:** later realised price, spread, and profit data used only for validation and calibration. It cannot appear as if it was known at decision time.

This hierarchy protects decision-time integrity: the agent does not get to “peek ahead,” and the trader can see what kind of information is doing the work.

**Scope boundaries.**

Trading Brain currently does **not**:

- replace a certified production risk-control process;
- guarantee profitability, price stability, or reliable supply;
- directly submit a trade without enterprise approval and human governance;
- treat generic web search as sufficient evidence without time, region, source, and relevance checks;
- claim that a replay result proves future predictive performance.

These boundaries are part of the design, not shortcomings to hide. They define a prototype that can be evaluated responsibly.

---

# 5. Content

**What the prototype must communicate.**

The core content is not a long AI-generated report. It is a structured decision brief designed around a trader's next question.

| Report block | Content | Why it matters |
| --- | --- | --- |
| **Decision status** | `PASS`, `RECALCULATE`, `HUMAN REVIEW`, or `REJECT` | Makes the workflow consequence clear immediately |
| **Why now?** | One-sentence reason, alert level, affected time window, market/region | Helps the trader orient under time pressure |
| **Signals** | E.g. `PRICE_SPREAD_SHIFT`, `ABNORMAL_MOVE`, `FORECAST_BREAKDOWN_RISK`, `GRID_CONSTRAINT` | Translates raw inputs into inspectable concepts |
| **Evidence stack** | Source title, source type, time, region, source quality, matched signal | Lets the trader verify relevance and challenge weak evidence |
| **Policy context** | Applicable rule/constraint, version/date, relation to the current strategy | Separates compliance explanation from live anomaly evidence |
| **Uncertainty and limits** | Missing data, conflicting signals, low source quality, assumptions | Reduces overconfidence and makes it safe to disagree |
| **Action panel** | Continue, recalculate, pause for review, override with reason | Converts explanation into accountable action |
| **Trace / decision log** | Which agent produced what, who made the final call, and when | Supports audit, replay, and later learning |

**Prototype scenario walkthrough.**

The prototype should be evaluated through one concrete scenario rather than trying to display every agent at once.

1. **Start with the trader's normal screen.** Show the proposed declaration or strategy state and the deadline.
2. **Show the alert arriving.** “Human review recommended” appears with a one-sentence reason, not a wall of text.
3. **Open “Why now?”** Show the two or three matched signals and the current threshold.
4. **Inspect evidence.** Open one live Guangdong-related item and one background policy reference; visually label them differently.
5. **Reveal uncertainty.** Show what is missing, conflicting, or not eligible to raise the alert.
6. **Make a human decision.** Choose “recalculate” or “pause for review,” add a decision note, and show that execution remains gated.
7. **Show replay mode separately.** Make clear that later May market data is used to evaluate the logic, not to generate the original warning.

The walkthrough's success criterion is simple: a viewer should be able to answer, in their own words, why the agent recommended review and what the trader can do about it.

**Evaluation questions for the next iteration.**

The prototype should be evaluated as decision support, not merely as a working agent graph.

- Can participants identify the trigger behind an alert without reading a long technical trace?
- Can they distinguish live decision-time evidence from background references and offline validation?
- Can they identify evidence that is irrelevant, outdated, or weak?
- Can they choose a plausible next action and explain their reasoning?
- Does the interface help them avoid both blind acceptance and blanket rejection of the recommendation?
- Does the May 25-27 replay explanation make sense, including why May 28-29 are not new warnings?

Useful measures include time to explain the alert, correctness of evidence categorisation, selected action, confidence with justification, use of the override function, and qualitative responses about missing information. These measures connect the prototype to human-AI decision-making research while remaining practical for lightweight trader or expert evaluation.

---

# Conclusion

This research leads to one clear product direction:

> Trading Brain should become a transparent review surface around existing electricity-trading automation, not a black-box system that tries to replace the trader.

The next prototype iteration should therefore prioritise:

1. a visible recommendation mechanism and evidence hierarchy;
2. a decision brief that distinguishes live evidence, background rules, and offline validation;
3. an action panel with a real human-review gate and decision note;
4. a short scenario walkthrough for demonstration and user evaluation;
5. lightweight testing with traders, enterprise collaborators, or domain experts.

---

# References

- Gomez, C., Cho, S. M., Ke, S., Huang, C.-M., & Unberath, M. (2025). *Human-AI collaboration is not very collaborative yet: A taxonomy of interaction patterns in AI-assisted decision making from a systematic review.* Frontiers in Computer Science, 6, 1521066. https://doi.org/10.3389/fcomp.2024.1521066
- U.S. Energy Information Administration. (2024). *How much electricity does an American home use?* https://www.eia.gov/tools/faqs/faq.php?id=97&t=7
- Hitachi Energy. (n.d.). *Energy Trading and Risk Management (ETRM) Software Solution.* https://www.hitachienergy.com/products-and-solutions/energy-portfolio-management/energy-commercial-enablement-software-solutions/energy-trading-and-risk-management-etrm-software-solution
- Lai, V., Chen, C., Smith-Renner, A., Liao, Q. V., & Tan, C. (2023). *Towards a science of human-AI decision making: An overview of design space in empirical human-subject studies.* FAccT '23, 1369-1385. https://doi.org/10.1145/3593013.3594087
- National Development and Reform Commission. (2024). *Electricity Market Operation Basic Rules.* https://zfxxgk.ndrc.gov.cn/wap/iteminfo.jsp?id=20379
- National Development and Reform Commission & National Energy Administration. (2023). *Spot Electricity Market Basic Rules (Trial).* https://zfxxgk.ndrc.gov.cn/web/iteminfo.jsp?id=20272
- National Energy Administration. (2025). *2024 Annual China Electricity Market Development Report.* https://www.nea.gov.cn/20250717/54ae0fdb11f04b39a5b670999c04ef81/c.html
- National Energy Administration. (2025). *Southern Regional Electricity Market Starts Continuous Settlement Trial.* https://www.nea.gov.cn/20250701/dc548c119e754bf1afa29c3766daf901/c.html
- National Energy Administration Southern Regulatory Bureau. (2022). *Long-Period Settlement Operation in the Southern Market.* https://www.nea.gov.cn/2022-12/09/c_1310682779.htm
- National Energy Administration Southern Regulatory Bureau. (2024). *November 2024 Southern Regional Electricity Market Settlement Trial.* https://nfj.nea.gov.cn/xwzx/jgdt/202411/t20241128_273008.html
- Prabhudesai, S., Yang, L., Asthana, S., Huan, X., Liao, Q. V., & Banovic, N. (2023). *Understanding uncertainty: How lay decision-makers perceive and interpret uncertainty in human-AI decision making.* IUI '23, 379-396. https://doi.org/10.1145/3581641.3584033
- Steyvers, M., & Kumar, A. (2024). *Three challenges for AI-assisted decision-making.* Perspectives on Psychological Science, 19(5), 722-734. https://doi.org/10.1177/17456916231181102
