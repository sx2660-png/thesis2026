---
layout: default
title: Plan
nav_order: 3
description: The project goals, decision focus, design hypotheses, and technical scope.
---

# Plan

## Project focus

Trading Brain is planned as a human-in-the-loop AI decision-support system for Guangdong day-ahead electricity trading. The project studies how an AI assistant can support the cognitive work around a trading decision, rather than only demonstrating a multi-agent architecture.

## Decisions the design should support

The system should help a trader answer four questions:

- Is the current market condition normal enough for the existing strategy to continue?
- Which evidence explains the warning, and is that evidence relevant and timely?
- Should the trader trust, question, or request more information from the system?
- Should the workflow continue automatically, recalculate the strategy, or pause for human review?

## Technical scope

The planned workflow uses LangGraph to coordinate a web search agent, policy agent, market anomaly analysis, prediction and strategy inputs, a risk agent, and a human review trigger. Prediction, strategy, and execution modules may initially be represented by mock agents so that the review workflow can be tested before enterprise interfaces are available.

Trading Brain is intended to sit beside the enterprise system as an additional risk-warning layer. It should not rewrite the company's prediction or strategy logic. Its outputs should be understandable and stable enough to connect to an existing operation console later.

## Design hypotheses

The project will explore whether grouped evidence helps traders review alerts more efficiently, whether an explanation of the trigger improves understanding of high-risk warnings, and whether separating pre-declaration evidence from post-event validation helps users avoid hindsight bias. A clear human-review path should also make it easier to use AI support without treating the output as an instruction.

## Development plan

The project moves from context research and market-rule analysis to ideation, prototype construction, case replay, and human-centred evaluation. The first prototype prioritises the warning, evidence, and review flow. Later work can replace mock agents with enterprise interfaces, test the interaction with domain users, and evaluate whether the system improves review quality, speed, and calibrated trust.

## Limitations

The first version cannot prove that the system improves market outcomes. Some market data arrives after the declaration decision and can only be used for offline replay or threshold calibration. Formal trader interviews and enterprise API integration also remain future steps. These limitations are part of the design research rather than problems to hide.
