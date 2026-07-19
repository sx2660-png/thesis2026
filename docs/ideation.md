---
layout: default
title: Ideation
nav_order: 5
description: Alternative design concepts and the direction selected for prototype development.
---

# Ideation

## Design challenge

How can a system turn scattered, time-sensitive, and sometimes incomplete market information into a decision that a trader can inspect and act on before automation continues?

## From research to ideas

The research suggested that the interface should be organised around the trading decision rather than around separate agents or data sources. It should make timing visible, explain the trigger behind a warning, and provide a clear path for questioning or overriding the recommendation.

To avoid committing to the first dashboard idea, I considered six different ways to organise the problem:

1. **Alert-First Decision Console:** a warning card showing risk, reason, affected periods, and suggested action. It responds well to time pressure but could oversimplify the situation.
2. **Decision Timeline:** a view showing how evidence was found, checked, and connected to a warning. It improves transparency but may be slower as a first view.
3. **Evidence Triage Inbox:** a workspace for sorting evidence into verified, pending, background, and rejected categories. It supports source checking but may increase reading work.
4. **Market Scenario Cockpit:** a broader view of price curves, forecasts, grid constraints, and possible market situations. It supports strategy analysis but requires more reliable data.
5. **Daily Trading Brief:** a short summary before the declaration deadline. It is useful for routine review but less useful for investigating a warning.
6. **Feedback and Model Operations Lab:** a space for reviewing false positives, missed warnings, source performance, and trader comments. It supports long-term improvement but should not be the daily trading interface.

## Direction selected for M5

The most useful direction combines several ideas rather than treating them as separate products. The alert console becomes the entry point, the timeline explains how a warning was produced, the evidence view shows source status and quality, and annotation and history support later review.

The provisional direction is an alert-first human review interface. Its first view should help answer: What is happening? Do I need to review it? What triggered the warning? Which periods may be affected? What should I do next?

This is not a final dashboard specification. It is the leading concept for M5, where the interaction, visual hierarchy, and testing questions will be developed further.
