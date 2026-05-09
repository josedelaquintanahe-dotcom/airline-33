create extension if not exists pgcrypto;

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create table if not exists public.drops (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  name text not null,
  status text not null default 'planned',
  theme text,
  access_type text not null default 'public',
  starts_at timestamptz,
  ends_at timestamptz,
  notes text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.suppliers (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  supplier_type text not null default 'other',
  contact_name text,
  email text,
  phone text,
  country text,
  vat_number text,
  payment_terms text,
  status text not null default 'active',
  notes text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  name text not null,
  description text,
  category text,
  status text not null default 'draft',
  brand_season text,
  drop_id uuid references public.drops(id) on delete set null,
  supplier_id uuid references public.suppliers(id) on delete set null,
  base_currency text not null default 'EUR',
  retail_price numeric(12,2),
  compare_at_price numeric(12,2),
  launch_at timestamptz,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.skus (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete cascade,
  sku_code text not null unique,
  barcode text,
  size text,
  color text,
  material_variant text,
  status text not null default 'active',
  retail_price numeric(12,2),
  cost_basis numeric(12,2),
  weight_grams integer,
  external_shopify_variant_id text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.customers (
  id uuid primary key default gen_random_uuid(),
  email text,
  phone text,
  first_name text,
  last_name text,
  full_name text,
  instagram_handle text,
  city text,
  country text,
  birth_date date,
  acquisition_channel text,
  marketing_consent_email boolean not null default false,
  marketing_consent_sms boolean not null default false,
  customer_status text not null default 'lead',
  first_order_at timestamptz,
  last_order_at timestamptz,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists customers_email_unique_idx
on public.customers (lower(email))
where email is not null;

create table if not exists public.community_members (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid references public.customers(id) on delete set null,
  email text,
  instagram_handle text,
  telegram_handle text,
  source text,
  status text not null default 'active',
  tier text not null default 'public',
  joined_at timestamptz not null default now(),
  last_engaged_at timestamptz,
  notes text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  order_number text not null unique,
  customer_id uuid references public.customers(id) on delete set null,
  channel text not null default 'manual',
  status text not null default 'draft',
  currency text not null default 'EUR',
  subtotal_amount numeric(12,2) not null default 0,
  discount_amount numeric(12,2) not null default 0,
  shipping_amount numeric(12,2) not null default 0,
  tax_amount numeric(12,2) not null default 0,
  total_amount numeric(12,2) not null default 0,
  payment_status text not null default 'unpaid',
  fulfillment_status text not null default 'unfulfilled',
  stripe_payment_intent_id text,
  external_shopify_order_id text,
  ordered_at timestamptz not null default now(),
  paid_at timestamptz,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  sku_id uuid references public.skus(id) on delete set null,
  product_name_snapshot text not null,
  sku_code_snapshot text,
  quantity integer not null check (quantity > 0),
  unit_price numeric(12,2) not null default 0,
  unit_cost_snapshot numeric(12,2),
  discount_amount numeric(12,2) not null default 0,
  line_total numeric(12,2) not null default 0,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.stock_movements (
  id uuid primary key default gen_random_uuid(),
  sku_id uuid not null references public.skus(id) on delete cascade,
  movement_type text not null,
  quantity integer not null,
  unit_cost numeric(12,2),
  reference_type text,
  reference_id uuid,
  warehouse_code text,
  notes text,
  effective_at timestamptz not null default now(),
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.costs (
  id uuid primary key default gen_random_uuid(),
  cost_type text not null,
  status text not null default 'estimated',
  amount numeric(12,2) not null,
  currency text not null default 'EUR',
  product_id uuid references public.products(id) on delete set null,
  sku_id uuid references public.skus(id) on delete set null,
  drop_id uuid references public.drops(id) on delete set null,
  supplier_id uuid references public.suppliers(id) on delete set null,
  reference_document text,
  incurred_at timestamptz not null default now(),
  paid_at timestamptz,
  notes text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.cash_movements (
  id uuid primary key default gen_random_uuid(),
  movement_type text not null,
  status text not null default 'pending',
  amount numeric(12,2) not null,
  currency text not null default 'EUR',
  occurred_at timestamptz not null default now(),
  reference_type text,
  reference_id uuid,
  payment_provider text,
  external_reference text,
  notes text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.returns (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  customer_id uuid references public.customers(id) on delete set null,
  status text not null default 'requested',
  reason_code text,
  refund_amount numeric(12,2) not null default 0,
  currency text not null default 'EUR',
  restock_decision text,
  requested_at timestamptz not null default now(),
  received_at timestamptz,
  refunded_at timestamptz,
  notes text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.marketing_events (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid references public.customers(id) on delete set null,
  community_member_id uuid references public.community_members(id) on delete set null,
  event_type text not null,
  source text not null,
  campaign_name text,
  drop_id uuid references public.drops(id) on delete set null,
  occurred_at timestamptz not null default now(),
  external_event_id text,
  properties jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists skus_product_id_idx on public.skus(product_id);
create index if not exists stock_movements_sku_id_effective_at_idx on public.stock_movements(sku_id, effective_at desc);
create index if not exists orders_customer_id_ordered_at_idx on public.orders(customer_id, ordered_at desc);
create index if not exists order_items_order_id_idx on public.order_items(order_id);
create index if not exists marketing_events_customer_id_occurred_at_idx on public.marketing_events(customer_id, occurred_at desc);

create or replace view public.inventory_current_view as
select
  s.id as sku_id,
  s.sku_code,
  p.name as product_name,
  coalesce(sum(sm.quantity), 0) as stock_balance
from public.skus s
join public.products p on p.id = s.product_id
left join public.stock_movements sm on sm.sku_id = s.id
group by s.id, s.sku_code, p.name;

create or replace view public.weekly_kpis_view as
select
  date_trunc('week', o.ordered_at) as week_start,
  count(distinct o.id) as orders_count,
  sum(o.total_amount) as revenue_total,
  sum(oi.quantity) as units_sold
from public.orders o
left join public.order_items oi on oi.order_id = o.id
group by 1;

do $$
declare
  t text;
begin
  foreach t in array array[
    'drops','suppliers','products','skus','customers','community_members',
    'orders','order_items','stock_movements','costs','cash_movements','returns'
  ]
  loop
    execute format('drop trigger if exists set_updated_at_%1$s on public.%1$s;', t);
    execute format('create trigger set_updated_at_%1$s before update on public.%1$s for each row execute function public.set_updated_at();', t);
  end loop;
end $$;
