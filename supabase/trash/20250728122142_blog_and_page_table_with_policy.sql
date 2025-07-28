alter table "public"."pages_translations" enable row level security;

alter table "public"."blogs" drop column "category";

alter table "public"."blogs" drop column "content";

alter table "public"."blogs" drop column "featured_image";

alter table "public"."blogs" drop column "sub_category";

alter table "public"."blogs" drop column "sub_title";

alter table "public"."blogs" drop column "title";

alter table "public"."blogs" add column "slug" character varying not null;

alter table "public"."pages" drop column "category";

alter table "public"."pages" drop column "content";

alter table "public"."pages" drop column "featured_image";

alter table "public"."pages" drop column "sub_category";

alter table "public"."pages" drop column "sub_title";

alter table "public"."pages" drop column "title";

alter table "public"."pages" add column "slug" character varying not null;

CREATE UNIQUE INDEX blogs_translations_pkey ON public.blogs_translations USING btree (id);

CREATE UNIQUE INDEX pages_translations_pkey ON public.pages_translations USING btree (id);

alter table "public"."blogs_translations" add constraint "blogs_translations_pkey" PRIMARY KEY using index "blogs_translations_pkey";

alter table "public"."pages_translations" add constraint "pages_translations_pkey" PRIMARY KEY using index "pages_translations_pkey";

alter table "public"."blogs_translations" add constraint "blogs_translations_approved_by_user_id_fkey" FOREIGN KEY (approved_by_user_id) REFERENCES auth.users(id) ON UPDATE CASCADE not valid;

alter table "public"."blogs_translations" validate constraint "blogs_translations_approved_by_user_id_fkey";

alter table "public"."blogs_translations" add constraint "blogs_translations_blog_id_fkey" FOREIGN KEY (blog_id) REFERENCES blogs(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."blogs_translations" validate constraint "blogs_translations_blog_id_fkey";

alter table "public"."blogs_translations" add constraint "blogs_translations_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE not valid;

alter table "public"."blogs_translations" validate constraint "blogs_translations_user_id_fkey";

alter table "public"."pages_translations" add constraint "pages_translations_approved_by_user_id_fkey" FOREIGN KEY (approved_by_user_id) REFERENCES auth.users(id) ON UPDATE CASCADE not valid;

alter table "public"."pages_translations" validate constraint "pages_translations_approved_by_user_id_fkey";

alter table "public"."pages_translations" add constraint "pages_translations_page_id_fkey" FOREIGN KEY (page_id) REFERENCES pages(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."pages_translations" validate constraint "pages_translations_page_id_fkey";

alter table "public"."pages_translations" add constraint "pages_translations_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE not valid;

alter table "public"."pages_translations" validate constraint "pages_translations_user_id_fkey";

grant delete on table "public"."blogs_translations" to "anon";

grant insert on table "public"."blogs_translations" to "anon";

grant references on table "public"."blogs_translations" to "anon";

grant select on table "public"."blogs_translations" to "anon";

grant trigger on table "public"."blogs_translations" to "anon";

grant truncate on table "public"."blogs_translations" to "anon";

grant update on table "public"."blogs_translations" to "anon";

grant delete on table "public"."blogs_translations" to "authenticated";

grant insert on table "public"."blogs_translations" to "authenticated";

grant references on table "public"."blogs_translations" to "authenticated";

grant select on table "public"."blogs_translations" to "authenticated";

grant trigger on table "public"."blogs_translations" to "authenticated";

grant truncate on table "public"."blogs_translations" to "authenticated";

grant update on table "public"."blogs_translations" to "authenticated";

grant delete on table "public"."blogs_translations" to "service_role";

grant insert on table "public"."blogs_translations" to "service_role";

grant references on table "public"."blogs_translations" to "service_role";

grant select on table "public"."blogs_translations" to "service_role";

grant trigger on table "public"."blogs_translations" to "service_role";

grant truncate on table "public"."blogs_translations" to "service_role";

grant update on table "public"."blogs_translations" to "service_role";

grant delete on table "public"."pages_translations" to "anon";

grant insert on table "public"."pages_translations" to "anon";

grant references on table "public"."pages_translations" to "anon";

grant select on table "public"."pages_translations" to "anon";

grant trigger on table "public"."pages_translations" to "anon";

grant truncate on table "public"."pages_translations" to "anon";

grant update on table "public"."pages_translations" to "anon";

grant delete on table "public"."pages_translations" to "authenticated";

grant insert on table "public"."pages_translations" to "authenticated";

grant references on table "public"."pages_translations" to "authenticated";

grant select on table "public"."pages_translations" to "authenticated";

grant trigger on table "public"."pages_translations" to "authenticated";

grant truncate on table "public"."pages_translations" to "authenticated";

grant update on table "public"."pages_translations" to "authenticated";

grant delete on table "public"."pages_translations" to "service_role";

grant insert on table "public"."pages_translations" to "service_role";

grant references on table "public"."pages_translations" to "service_role";

grant select on table "public"."pages_translations" to "service_role";

grant trigger on table "public"."pages_translations" to "service_role";

grant truncate on table "public"."pages_translations" to "service_role";

grant update on table "public"."pages_translations" to "service_role";

create policy "Enable insert for authenticated users only"
on "public"."blogs_translations"
as permissive
for insert
to authenticated
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = auth.uid())) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));


create policy "Enable read access for all users"
on "public"."blogs_translations"
as permissive
for select
to public
using (true);


create policy "Enable update for users based on email"
on "public"."blogs_translations"
as permissive
for update
to authenticated
using ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = auth.uid())) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])))
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = auth.uid())) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));


create policy "Enable insert for authenticated users only"
on "public"."pages_translations"
as permissive
for insert
to authenticated
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = auth.uid())) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));


create policy "Enable read access for all users"
on "public"."pages_translations"
as permissive
for select
to public
using (true);


create policy "Enable update for users based on email"
on "public"."pages_translations"
as permissive
for update
to public
using ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = auth.uid())) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])))
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = auth.uid())) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));



