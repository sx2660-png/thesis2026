---
layout: default
<<<<<<< HEAD
nav_exclude: true
---

# Read The Docs Theme for Jekyll & GitHub Pages

This is a port of the
[Read The Docs](https://sphinx-rtd-theme.readthedocs.io) theme to
[Jekyll](https://jekyllrb.com/), specifically developed be used with
[GitHub Pages](https://jekyllrb.com/docs/github-pages/).

> [!NOTE]
> You are previewing 👀 the theme right now as you navigate this documentation!

![screenshot](assets/img/screenshot.png)

The original [Read The Docs](https://readthedocs.org)
[theme](https://sphinx-rtd-theme.readthedocs.io) was created for the
[Sphinx](https://www.sphinx-doc.org/) documentation generator, and so it is
designed specifically for docs.

Combined with [GitHub Pages](https://pages.github.com) it's a great and easy
way to document your projects!

Features:

- 🖥️ Read the Docs responsive design with a collapsible sidebar navigation
- 🐙 Specifically developed to be compatible with GitHub Pages out of the box
  - 📁 Simply create a `docs` folder with a `_config.yml` and your markdown files
  - 🔗 Automatic GitHub link, "Edit on GitHub", and commit links (optional)
  - 🏷️ Latest release tag displayed in the sidebar (optional)
- 🌐 External links in the navigation bar
- 🔍 Built-in search functionality via [Lunr.js](https://lunrjs.com/)
- 🖍️ Source code highlighting via [highlight.js](https://highlightjs.org), with a copy-to-clipboard button
- 🧜 Diagram rendering support via [Mermaid](https://www.npmjs.com/package/mermaid)
- 📢 Admonition callouts via [aDOMonitions](https://github.com/carlosperate/aDOMonitions)
- ⚓ Heading anchor links on hover via [AnchorJS](https://www.bryanbraun.com/anchorjs/)
- 🔘 Button styling via links with additional attributes
- 🏷 Labels for status, releases, or other metadata
- ⚙️ Configurable with custom options in `_config.yml` and front matter
- 📣 Social media metadata and preview images
- 🔎 SEO friendly meta tags and canonical URLs
- 🧑‍💻 TODO 🧑‍💻: 🧮 Mathematical expressions rendering

## What Can You Find Around Here

- Check out the [Quick Start Guide](quickstart.md)
  to get up and running.
- If some of the terms thrown around here don't make a lot of sense, check out
  the [What is All This? (FAQs)](faqs.md) page.
- To find out more about all the theme available options see the
  [Theme Configuration](configuration/configyml.md)
  and the [Pages Configuration](configuration/frontmatter.md)
  pages.
- The Demo Pages contain generic content to showcase how the standard Markdown
  and [additional features](configuration/markdown-extra.md)
  are rendered with this theme.
- The [Debug Config](configuration/debug.md)
  page documents a utility file you can copy into your site to inspect every
  Jekyll & Liquid variable at build time.

## 🧑‍💻 Work in Progress!

New features are still being developed but the theme is already usable and
[v1.4.0](https://github.com/carlosperate/jekyll-theme-rtd/releases/tag/v1.4.0)
is the latest release 🎉.

Any possible breaking change would be released as a major revision
(i.e. `v2`, `v3`, etc). A breaking change would be a change in existing config
options, or a significant visual style change, while new features and
settings will be released a minor revisions (i.e. `v1.1`, `v1.2`, etc).

So, it is recommended to lock the theme version in the `_config.yml` file:

```yaml
remote_theme: carlosperate/jekyll-theme-rtd@v1.4.0
```

Missing features are listed in the GitHub issues with the
[enhancement](https://github.com/carlosperate/jekyll-theme-rtd/issues?q=is%3Aissue%20state%3Aopen%20label%3Aenhancement)
or [new feature](https://github.com/carlosperate/jekyll-theme-rtd/issues?q=is%3Aissue%20state%3Aopen%20label%3A%22new%20feature%22)
labels, and any known issues are listed with the
[bug](https://github.com/carlosperate/jekyll-theme-rtd/issues?q=is%3Aissue+is%3Aopen+label%3Abug)
label.

Contributions are very welcomed!
=======
title: Trading Brain
nav_order: 1
description: A thesis project about human-in-the-loop AI decision support for Guangdong electricity trading.
---

# Trading Brain

Trading Brain is a thesis project exploring how an AI assistant can support the cognitive work of electricity traders.

The project focuses on the day-ahead declaration moment in Guangdong electricity trading. Before submission, a trader may need to decide whether an existing automated strategy can continue, should be recalculated, or should pause for human review. Trading Brain is designed as a risk-warning and evidence-review layer around that decision.

It does not aim to replace the trader or execute trades autonomously. Instead, it asks how a system can help a trader notice unusual conditions, understand why a warning appeared, judge whether the evidence is relevant, and make a responsible intervention decision.

## Project path

The site follows the development of the project:

1. [Problem & Context](problem-and-context.md): the industry setting, users, and research question.
2. [Plan](plan.md): the design goals, scope, hypotheses, and development plan.
3. [Research](research.md): the market context, user research, and theoretical grounding.
4. [Ideation](ideation.md): the alternative concepts and the direction selected for prototyping.
5. [Prototype](prototype.md): the current workflow, interface ideas, and limitations.
6. [Pitch](pitch/index.md): the mid-term presentation and the developing first-semester pitch.
7. [Process](process/index.md): updates, meetings, feedback, and reflections.

## Current direction

The current design direction is an alert-first human review interface. It brings together a short risk explanation, affected trading periods, evidence quality, workflow status, and a clear path for human confirmation or override.

The project is still being developed. The prototype is used to test the design assumptions, not to claim that the system can make reliable trading decisions without human responsibility.
>>>>>>> 3ca43c7 (Add documentation and process records for Trading Brain project)
