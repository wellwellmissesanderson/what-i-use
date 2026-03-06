# Accessibility Guidelines for <secret>> Project

## WCAG Compliance Standards
- **Backend code** (`/secret/*` folder): WCAG 2.2 Level A
- **All other code**: WCAG 2.2 Level AA

## Core Accessibility Principles

### Semantic HTML
- Use semantic HTML elements (nav, main, section, article, etc.)
- Ensure accessible labels within lists are specific to the list item they're related to
- Provide alternative text for all images

### Keyboard Navigation
- Ensure full keyboard navigation support
- Use logical tab order that matches visual layout
- Prefer adding styles for 'focus-visible' rather than 'focus' pseudo-state
- Avoid setting outline:0 to avoid focus outlines
- Provide visible focus indicators (minimum 2px outline)

### ARIA and Screen Reader Support
- Apply appropriate ARIA attributes (aria-label, aria-describedby, etc.), but only when required
- Use focus management for modals and dynamic content
- Test with screen readers and keyboard-only navigation

### Dynamic Content Updates
- Use `aria-live="polite"` for status updates
- Use `aria-live="assertive"` for urgent notifications
- Update screen reader users when content changes without page reload

### Forms and Input
- Use `aria-required="true"` for required fields
- Place labels above or to the left of form fields
- Group related fields with `<fieldset>` and `<legend>`

### Links and Navigation
- Use descriptive link text
  - Good: "Download the accessibility report (PDF, 2MB)"
  - Avoid: "Click here" or "Read more"

### Color and Visual Design
- Don't rely solely on color to convey information
- Provide multiple visual cues:
  - Use color + icon + text for status indicators
  - Add patterns or textures to distinguish chart elements
  - Include text labels on graphs and data visualizations

## Contrast Requirements

### UI Components
- MUST look up contrast ratios to ensure calculation is correct

## Quick Accessibility Checklist
- Can you navigate the entire interface using only Tab/Shift+Tab/Enter?
- Are all images and icons properly described?
- Can screen reader users understand the content and functionality?

## Resources
- [WCAG 2.2 Guidelines](https://www.w3.org/WAI/WCAG22/quickref/)
- [Accessibility Testing Tools](https://docs.github.com/en/copilot/tutorials/customization-library/custom-instructions/accessibility-auditor)
