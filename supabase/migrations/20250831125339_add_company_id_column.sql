alter table "public"."profiles" add column "company_id" uuid;

alter table "public"."profiles" add constraint "profiles_company_id_fkey" FOREIGN KEY (company_id) REFERENCES companies(id) not valid;

alter table "public"."profiles" validate constraint "profiles_company_id_fkey";


