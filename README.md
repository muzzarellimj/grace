# Grace

Grace is an open-source, cross-platform collection management application built with [Flutter](https://flutter.dev/) in [Dart](https://dart.dev/).

## Proposal

Note: this proposal assumes a fictitious scenario at a company called "Company", wherein analysis is conducted to build a collection manager that aggregates multiple design systems, A, B, and C, in one cross-platform view that commonizes a wide variety of data points and formats. As this is fictitious, this proposal also provides a practical application with physical media in books and games collection management.

### Problem Domain

At Company, there are three independent design systems:

- Design System A (DSA) - primary design system for the enterprise website, so components are created with a focus in desktop design and rely on common responsive web design interaction and measurement standards - e.g., responsive containers are measured in percentages and fonts are measured in `em` units.

- Design System B (DSB) - primary design system for the flagship mobile application, so components are created with a focus in mobile design and rely on common mobile design interaction and measurement standards - e.g., navigation relies on a collapsible drawer and fonts are measured in `rem` units.

- Design System C (DSB) - primary design system for a standalone internal tool that only runs in Chrome or Firefox, so components are created with a focus in desktop design but are tailored to the use-case - e.g., no adherence to response web design standards and fonts are measured in `px` units.

Company is aggregating their design systems to one enterprise design system with the flexibility to cover web and mobile development for the website, flagship mobile application, and internal tools, and can be described as such:

- Design System D (DSD) - primary design system for enterprise-wide applications, so components are created with a focus in both mobile and responsive desktop design and commononize interaction and measurement standards - e.g., shared navigation structure with a top-bar on desktop and a drawer on mobile and fonts are measured in `rem` units.

The process to aggregate DSA, DSB, and DSC is complex and requires engineers split across multiple teams and across multiple domains (web, mobile, etc.) to understand all the many components created across all three design systems, call out similarities and differences in overlapping components between design systems, and create new components that suit the cross-platform needs.