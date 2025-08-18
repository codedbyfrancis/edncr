alter table "public"."profiles" add column "notification_id" uuid;

CREATE UNIQUE INDEX profiles_notification_id_key ON public.profiles USING btree (notification_id);

alter table "public"."profiles" add constraint "profiles_notification_id_key" UNIQUE using index "profiles_notification_id_key";


