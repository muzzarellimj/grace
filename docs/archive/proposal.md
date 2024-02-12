# Proposal

## Scenario

Note: this proposal assumes a fictitious scenario at a company called "Company", wherein analysis is conducted to build a collection manager that aggregates multiple design systems, A, B, and C, in one cross-platform view that commonizes a wide variety of data points and formats. As this is fictitious, this proposal also provides a practical application with physical media in books and games collection management.

### Problem Domain

At Company, there are three independent design systems:

- Design System A (DSA) - primary design system for the enterprise website, so components are created with a focus in desktop design and rely on common responsive web design interaction and measurement standards - e.g., responsive containers are measured in percentages and fonts are measured in `em` units.

- Design System B (DSB) - primary design system for the flagship mobile application, so components are created with a focus in mobile design and rely on common mobile design interaction and measurement standards - e.g., navigation relies on a collapsible drawer and fonts are measured in `sp` units.

- Design System C (DSB) - primary design system for a standalone internal tool that only runs in Chrome or Firefox, so components are created with a focus in desktop design but are tailored to the use-case - e.g., no adherence to response web design standards and fonts are measured in `px` units.

Company is aggregating their design systems to one enterprise design system with the flexibility to cover web and mobile development for the website, flagship mobile application, and internal tools, and can be described as such:

- Design System D (DSD) - primary design system for enterprise-wide applications, so components are created with a focus in both mobile and responsive desktop design and commononize interaction and measurement standards - e.g., shared navigation structure with a top-bar on desktop and a drawer on mobile and fonts are measured in `rem` units.

The process to aggregate DSA, DSB, and DSC is complex and requires engineers split across multiple teams and across multiple domains (web, mobile, etc.) to understand all the many components created across all three design systems, call out similarities and differences in overlapping components between design systems, and create new components that suit the cross-platform needs.

For example, in the diagram below, each design system independently contains at least one component. These components are utilized in their respective applications and do not conflict with one another. However, when all three design systems are aggregated into DSD, there are three overlapping `.section-header` typography components, each with a different design specification, measurement unit, etc. This is the introduced complexity by aggregating design systems: which design system has priority in setting the standard in the aggregated DSD? Additionally, which design systems must comply with the standard that was not their own, and how does the impact each platform (e.g., accessibility, behavior, etc.)?

![](docs/img/dsd-aggregation.svg)

### Solution

Company is experiencing one primary complexity: this design system aggregation draws components from three data sources (DSA, DSB, DSC) and duplicate components must be dealt with appropriately on a case-by-case basis.

> As a developer, I want to aggregate multiple design systems and group similar components so that I can determine which component should be ported into the final design system.

Grace will act as a collection manager with each design system acting as a collection data source, and like data (e.g., similar components) will be logically grouped and stored in a staging environment where:

- standalone, non-grouped components can be evaluated and immediately ported to the final design system

- similar, grouped components can be evaluated and a single component refined so that it may also be ported to the final design system

![](docs/img/dsd-aggregation-w-grace.svg)

## Application

Note: this proposal assumes a practical, feasible application of the scenario discussed above that will exercise the same skillset and use a similar technical approach without potentially confidential data.

As an avid collector across many categories - books, games, trading cards, and more - proper collection management is a goal that not many can meet. Tracking a recent book purchase can be as simple as an Excel spreadsheet entry or can involve a lightweight library cataloging software like [LibraryThing](https://www.librarything.com/). However, a complexity exists in managing all collections all at once: each collection requires a separate collection management software, and each software introduces more complexity. Properties tracked differ between category and even between platform, so the quality of a collection can vary widely. Thus, a solution should be engineered:

> As an avid collector, I want to manage all of my collections on one platform so that I can more easily track items within my collection with similar quality between each.

Alongside an accessible UI, Grace should seek to tackle a primary task in MVP1: a book collection can be created, populated and revised, and data is sourced via [Open Library API](https://openlibrary.org/developers/api). A milestone schedule is as such:

| Milestone | Date | Complete |
|:----------|:-----|:---------|
| Gather requirements and document proposal | November 3, 2023 | |
| Develop application without design or data source | November 10, 2023 | |
| Design, revise, and refactor | November 17, 2023 | |
| Develop application with design and data source | November 24, 2023 | |
| Revise and refactor, prepare deliverable | December 1, 2023 | |
| Finalize GitHub documentation and PPT | December 8, 2023 | |