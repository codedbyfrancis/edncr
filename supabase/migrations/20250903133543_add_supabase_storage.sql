-- # Replace 'files' with your bucket name if needed
insert into storage.buckets (id, name, public)
values ('campaigns', 'campaigns', true)
on conflict (id) do nothing;

-- # Remove any old conflicting policies
-- drop policy if exists "Allow all uploads" on storage.objects;
-- drop policy if exists "Allow authenticated uploads" on storage.objects;
-- drop policy if exists "Allow anon uploads" on storage.objects;


-- # Only allow authenticated users to upload, and only into 'files' bucket
create policy "Authenticated users can upload"
on storage.objects
for insert
to authenticated
with check (
  bucket_id = 'campaigns'
  and owner = auth.uid()
);

-- # For testing: allow anyone to insert
-- create policy "Allow all uploads"
-- on storage.objects
-- for insert
-- to public
-- with check (true);

-- # Also allow reads (optional, for testing)
create policy "Allow all selects"
on storage.objects
for select
to public
using (true);