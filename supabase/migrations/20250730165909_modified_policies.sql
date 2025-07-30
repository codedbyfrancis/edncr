drop policy "Enable insert for authenticated users only" on "public"."blogs";

drop policy "Enable update for users based on email" on "public"."blogs";

drop policy "Enable insert for authenticated users only" on "public"."blogs_translations";

drop policy "Enable update for users based on email" on "public"."blogs_translations";

drop policy "Enable insert for users based on user role" on "public"."pages";

drop policy "Enable update for users based on role" on "public"."pages";

drop policy "Enable insert for authenticated users only" on "public"."pages_translations";

drop policy "Enable update for users based on email" on "public"."pages_translations";

drop policy "Enable update for users based on user_id" on "public"."profiles";

CREATE INDEX blogs_approved_by_user_id_idx ON public.blogs USING btree (approved_by_user_id);

CREATE INDEX blogs_translations_approved_by_user_id_idx ON public.blogs_translations USING btree (approved_by_user_id);

CREATE INDEX blogs_translations_blog_id_idx ON public.blogs_translations USING btree (blog_id);

CREATE INDEX blogs_translations_user_id_idx ON public.blogs_translations USING btree (user_id);

CREATE INDEX blogs_user_id_idx ON public.blogs USING btree (user_id);

CREATE INDEX pages_approved_by_user_id_idx ON public.pages USING btree (approved_by_user_id);

CREATE INDEX pages_translations_approved_by_user_id_idx ON public.pages_translations USING btree (approved_by_user_id);

CREATE INDEX pages_translations_page_id_idx ON public.pages_translations USING btree (page_id);

CREATE INDEX pages_translations_user_id_idx ON public.pages_translations USING btree (user_id);

CREATE INDEX pages_user_id_idx ON public.pages USING btree (user_id);

create policy "Enable insert for authenticated users only"
on "public"."blogs"
as permissive
for insert
to authenticated
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));


create policy "Enable update for users based on email"
on "public"."blogs"
as permissive
for update
to authenticated
using ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])))
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));


create policy "Enable insert for authenticated users only"
on "public"."blogs_translations"
as permissive
for insert
to authenticated
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));


create policy "Enable update for users based on email"
on "public"."blogs_translations"
as permissive
for update
to authenticated
using ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])))
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));


create policy "Enable insert for users based on user role"
on "public"."pages"
as permissive
for insert
to authenticated
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));


create policy "Enable update for users based on role"
on "public"."pages"
as permissive
for update
to authenticated
using ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])))
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));


create policy "Enable insert for authenticated users only"
on "public"."pages_translations"
as permissive
for insert
to authenticated
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));


create policy "Enable update for users based on email"
on "public"."pages_translations"
as permissive
for update
to public
using ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])))
with check ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.user_id = ( SELECT auth.uid() AS uid))) = ANY (ARRAY['editor'::roles, 'manager'::roles, 'superuser'::roles])));


create policy "Enable update for users based on user_id"
on "public"."profiles"
as permissive
for update
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id))
with check ((( SELECT auth.uid() AS uid) = user_id));



