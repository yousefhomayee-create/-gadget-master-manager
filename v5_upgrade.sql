-- Gadget Master Manager v5 upgrade
-- Run this in Supabase SQL Editor to add ticket/invoice fields safely.

alter table repairs add column if not exists ticket_no text;
alter table repairs add column if not exists imei_serial text;

alter table sales add column if not exists invoice_no text;
alter table sales add column if not exists customer_phone text;
alter table sales add column if not exists notes text;

-- If insert/select is blocked on any table, run these policies.

drop policy if exists "repairs_insert_all" on repairs;
create policy "repairs_insert_all" on repairs for insert to authenticated with check (true);

drop policy if exists "repairs_select_all" on repairs;
create policy "repairs_select_all" on repairs for select to authenticated using (true);

drop policy if exists "sales_insert_all" on sales;
create policy "sales_insert_all" on sales for insert to authenticated with check (true);

drop policy if exists "sales_select_all" on sales;
create policy "sales_select_all" on sales for select to authenticated using (true);

drop policy if exists "customers_insert_all" on customers;
create policy "customers_insert_all" on customers for insert to authenticated with check (true);

drop policy if exists "customers_select_all" on customers;
create policy "customers_select_all" on customers for select to authenticated using (true);
