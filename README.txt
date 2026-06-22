Gadget Master Manager v7.1 Receipt Print Fix

This version fixes the blank invoice/receipt print preview.

What changed:
- Receipt now opens in its own clean printable page.
- Old print CSS that caused blank pages was removed.
- No new Supabase SQL needed if v7_receipt_upgrade.sql was already run.

How to update:
1. Upload and replace these files in GitHub:
   - app.js
   - style.css
   - index.html if needed
2. Commit changes.
3. Wait 1-2 minutes for GitHub Pages.
4. Close/reopen the app.
5. Create a new invoice.
6. Press Print.

If iPhone blocks the print page:
- Allow popups for the site, then try Print again.
