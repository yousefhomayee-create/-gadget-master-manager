-- Gadget Master Manager v6 PWA does not require new tables.
-- Optional inventory policy check/fix.

alter table inventory enable row level security;

drop policy if exists "inventory_select" on inventory;
drop policy if exists "inventory_insert" on inventory;
drop policy if exists "inventory_update" on inventory;
drop policy if exists "inventory_delete" on inventory;

create policy "inventory_select" on inventory for select to authenticated using (true);
create policy "inventory_insert" on inventory for insert to authenticated with check (true);
create policy "inventory_update" on inventory for update to authenticated using (true) with check (true);
create policy "inventory_delete" on inventory for delete to authenticated using (true);
