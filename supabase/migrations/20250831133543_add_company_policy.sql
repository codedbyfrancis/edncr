create policy "Enable read access for all users"
on "public"."companies"
as permissive
for select
to authenticated
using (true);



