---
layout: default
title: Research
nav_order: 4
description: Research into electricity trading, human-AI decision support, evidence, and uncertainty.
---

# Research

## Research focus

The research examines the day-ahead declaration moment as a human decision-support problem. It combines electricity market context, enterprise workflow analysis, market-rule research, and human-AI decision-making literature.

The key finding is that the design problem is not only detecting an abnormal market condition. It is helping a trader understand what changed, why the system considers it important, what evidence was available at decision time, and what action remains under human control.

## Main findings

Important information is fragmented across policy documents, news, market data, forecasts, weather, grid constraints, and internal strategy outputs. Time pressure means that a trader cannot wait for perfect information. Evidence can also be weak, outdated, from the wrong region, or unavailable because a search failed.

This creates a need for evidence typing and uncertainty communication. The interface should distinguish live event evidence, candidate evidence with uncertain timing, background references, and unavailable information. It should also keep pre-declaration warnings separate from offline market-data replay so that later knowledge is not presented as if it had been available earlier.

## Market context

Electricity cannot be treated like an ordinary product that can simply be stored and delivered later. Trading decisions coordinate forecasts, supply and demand, market rules, operational constraints, and settlement consequences. The Guangdong and Southern regional market rules provide the domain context for the prototype and for the policy agent.

The project uses the May 25-27 enterprise case as a replay scenario. The replay is useful for checking whether the system can identify a known change in price and spread behaviour, but it does not by itself prove that the same logic would work prospectively in live trading.

## Theoretical grounding

The design is informed by human-centred design, cognitive load and progressive disclosure, information foraging, and human-AI decision-making research. These perspectives support four design commitments:

- evidence should be easier to inspect than an unexplained confidence score;
- uncertainty should affect the strength of the recommendation;
- the system should support calibrated trust rather than automatic acceptance;
- human intervention, override, and later review should be visible parts of the workflow.

## Research limitation

Current findings come from secondary research, enterprise discussions, workflow analysis, and case data. They do not yet represent a formal study of a broad group of electricity traders. The next research stage should test the prototype through interviews, walkthroughs, or think-aloud sessions with appropriate domain participants.

## Related working notes

The detailed working archive includes electricity trading notes, policy materials, literature notes, and readings on LLM agents and human-AI decision making. The public version keeps the main findings here and will be expanded as the research develops.
