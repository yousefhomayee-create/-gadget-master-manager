-- Gadget Master Manager v7 Receipt / Invoice Upgrade
-- Run this in Supabase SQL Editor.

alter table sales add column if not exists customer_phone text;
alter table sales add column if not exists invoice_no text;
alter table sales add column if not exists notes text;
alter table sales add column if not exists imei_serial text;
alter table sales add column if not exists quantity integer default 1;
alter table sales add column if not exists vat numeric default 0;
alter table sales add column if not exists warranty text;

alter table sales enable row level security;

drop policy if exists "staff read sales" on sales;
drop policy if exists "staff insert sales" on sales;
drop policy if exists "manager delete sales" on sales;
drop policy if exists "sales_select_all" on sales;
drop policy if exists "sales_insert_all" on sales;
drop policy if exists "sales_update_all" on sales;
drop policy if exists "sales_delete_all" on sales;

create policy "sales_select_all" on sales for select to authenticated using (true);
create policy "sales_insert_all" on sales for insert to authenticated with check (true);
create policy "sales_update_all" on sales for update to authenticated using (true) with check (true);
create policy "sales_delete_all" on sales for delete to authenticated using (true);

notify pgrst, 'reload schema';
