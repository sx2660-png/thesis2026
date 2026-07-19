---
layout: default
title: Reflections
nav_order: 4
description: Reflections on how the thesis direction has developed.
---

# Reflections

## From technical workflow to human decision support

The project started with a large technical ambition: a multi-agent system that could connect policy documents, market data, prediction, strategy, and execution. That framing was useful for understanding the system, but it was not yet a strong design research question. The project became clearer when I focused on the moment where a trader needs to decide whether automation should continue.

## What counts as a useful result

A warning is not useful simply because it is correct after the fact. It needs to be based on information that could have been available at the decision time, and it needs to show why the system reached its conclusion. This is why the project now separates live evidence from offline replay and treats missing or weak evidence as part of the result.

## Current direction

The alert-first human review interface is a practical compromise between speed and transparency. It gives the trader a clear starting point but keeps the evidence, timing, and decision history available for inspection. The next challenge is to find out whether this structure actually helps a domain user make a better-calibrated decision.
