create type "public"."company_status" as enum ('active', 'inactive');

create table "public"."companies" (
    "id" uuid not null default gen_random_uuid(),
    "name" character varying,
    "email" character varying,
    "telephone" character varying,
    "mobile" character varying,
    "website" character varying,
    "logo" character varying,
    "trade_license" character varying,
    "trade_license_expiration" date,
    "contact_person_name" character varying,
    "contact_person_phone" character varying,
    "contact_person_email" character varying,
    "status" company_status default 'active'::company_status,
    "modified_by" uuid,
    "modified_at" timestamp without time zone default now(),
    "created_at" timestamp with time zone not null default now()
);


alter table "public"."companies" enable row level security;

CREATE UNIQUE INDEX companies_pkey ON public.companies USING btree (id);

alter table "public"."companies" add constraint "companies_pkey" PRIMARY KEY using index "companies_pkey";

alter table "public"."companies" add constraint "companies_modified_by_fkey" FOREIGN KEY (modified_by) REFERENCES auth.users(id) not valid;

alter table "public"."companies" validate constraint "companies_modified_by_fkey";

grant delete on table "public"."companies" to "anon";

grant insert on table "public"."companies" to "anon";

grant references on table "public"."companies" to "anon";

grant select on table "public"."companies" to "anon";

grant trigger on table "public"."companies" to "anon";

grant truncate on table "public"."companies" to "anon";

grant update on table "public"."companies" to "anon";

grant delete on table "public"."companies" to "authenticated";

grant insert on table "public"."companies" to "authenticated";

grant references on table "public"."companies" to "authenticated";

grant select on table "public"."companies" to "authenticated";

grant trigger on table "public"."companies" to "authenticated";

grant truncate on table "public"."companies" to "authenticated";

grant update on table "public"."companies" to "authenticated";

grant delete on table "public"."companies" to "service_role";

grant insert on table "public"."companies" to "service_role";

grant references on table "public"."companies" to "service_role";

grant select on table "public"."companies" to "service_role";

grant trigger on table "public"."companies" to "service_role";

grant truncate on table "public"."companies" to "service_role";

grant update on table "public"."companies" to "service_role";


