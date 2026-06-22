-- Gadget Master Manager v7.2 Edit Invoices
-- Run this if invoice edits fail with Row Level Security error.

alter table sales enable row level security;

drop policy if exists "sales_update_all" on sales;

create policy "sales_update_all"
on sales for update
to authenticated
using (true)
with check (true);

notify pgrst, 'reload schema';
