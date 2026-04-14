# Plan 8: Notifications/Alerts

## Scope
- Warn if a role cannot be filled, or if certifications are expiring soon.
- Log alerts and optionally send email notifications.

## Steps
1. Add logic to detect unfilled roles and expiring certifications.
2. Log alerts to assignment_emails.log and/or notify users.
3. Add optional email notification integration.

## Files/Modules
- Crew.py, assignment_emails.log, GUI code

## Verification
- Alerts are generated and logged for all relevant events.
- Email notifications (if enabled) are sent correctly.
