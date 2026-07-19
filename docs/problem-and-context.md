---
layout: default
title: Problem & Context
nav_order: 2
description: The industry setting, project motivation, and design problem behind Trading Brain.
---

# Problem & Context

## Starting point

Trading Brain began as an industry-collaborative project with a company working in energy digitalisation and electricity trading. In real workflows, traders and operators spend time reading policy documents, checking declaration rules, reviewing market information, and deciding whether an existing strategy is still safe to use.

The first idea was to focus on load forecasting. After discussing the project with the enterprise partner and looking more closely at the field, I found that forecasting alone was too broad and technically crowded for the scope of this thesis. The project therefore moved toward policy understanding, risk control, and workflow coordination around electricity trading.

## The decision problem

Electricity trading decisions are time-bound and information-heavy. Before a day-ahead declaration, a trader may need to consider forecasts, market prices, policy constraints, weather, grid conditions, news, and the output of an existing strategy. These inputs come from different sources and do not always have the same timing, relevance, or reliability.

The problem is not simply that there is too much data. The more important problem is that a trader must decide quickly which information matters, whether an alert is credible, and whether automation should continue. A warning that does not show its trigger or supporting evidence can be either over-trusted or ignored.

## Research question

> How can a multi-agent AI system help electricity traders notice abnormal market conditions, inspect the evidence behind an alert, and make a responsible intervention decision before day-ahead declaration?

The project treats AI as decision support rather than an autonomous trader. Its intended role is to add a market-warning, policy-checking, and human-review layer beside an existing prediction, strategy, and execution workflow.

## Why the context matters

The scale of electricity markets makes individual decisions consequential, but it also makes the system difficult to explain to people outside the field. A useful design must connect technical signals to a practical decision without claiming that one tool can control prices, prevent outages, or guarantee market stability.

The central design challenge is therefore:

> How might we turn scattered, time-sensitive, and uncertain market information into evidence that a trader can inspect, question, and act on before automation continues?
