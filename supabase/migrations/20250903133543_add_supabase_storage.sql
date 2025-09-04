-- # Replace 'files' with your bucket name if needed
insert into storage.buckets (id, name, public)
values ('campaigns', 'campaigns', false)
on conflict (id) do nothing;

-- # Only allow authenticated users to upload, and only into 'files' bucket
create policy "Authenticated users can upload"
on storage.objects
for insert
to authenticated
with check (
  bucket_id = 'campaigns'
  and owner = auth.uid()
);

-- # Only allow authenticated users to select files
create policy "Authenticated users can select"
on storage.objects
for select
to authenticated
using (
  bucket_id = 'campaigns'
  and owner = auth.uid()
);

