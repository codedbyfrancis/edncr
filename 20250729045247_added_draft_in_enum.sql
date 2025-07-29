alter table "public"."blogs" alter column "status" drop default;

alter table "public"."blogs_translations" alter column "status" drop default;

alter table "public"."pages" alter column "status" drop default;

alter table "public"."pages_translations" alter column "status" drop default;

alter type "public"."pages_status" rename to "pages_status__old_version_to_be_dropped";

create type "public"."pages_status" as enum ('draft', 'for_modification', 'for_review', 'approved', 'deleted');

alter table "public"."blogs" alter column status type "public"."pages_status" using status::text::"public"."pages_status";

alter table "public"."blogs_translations" alter column status type "public"."pages_status" using status::text::"public"."pages_status";

alter table "public"."pages" alter column status type "public"."pages_status" using status::text::"public"."pages_status";

alter table "public"."pages_translations" alter column status type "public"."pages_status" using status::text::"public"."pages_status";

alter table "public"."blogs" alter column "status" set default 'editing'::pages_status;

alter table "public"."blogs_translations" alter column "status" set default 'editing'::pages_status;

alter table "public"."pages" alter column "status" set default 'editing'::pages_status;

alter table "public"."pages_translations" alter column "status" set default 'editing'::pages_status;

drop type "public"."pages_status__old_version_to_be_dropped";

alter table "public"."blogs" alter column "status" set default 'draft'::pages_status;

alter table "public"."blogs_translations" alter column "status" set default 'draft'::pages_status;

alter table "public"."pages" alter column "status" set default 'draft'::pages_status;

alter table "public"."pages_translations" alter column "status" set default 'draft'::pages_status;


