-- Create test users for each role (trigger will auto-create profiles)
INSERT INTO auth.users (
    id, 
    email, 
    encrypted_password, 
    role, 
    email_confirmed_at, 
    updated_at,
    raw_user_meta_data
)
VALUES 
    (
        '00000000-0000-0000-0000-000000000001',
        'user@example.com', 
        crypt('password123', gen_salt('bf')), 
        'authenticated',
        now(),
        now(),
        '{"full_name": "Regular User"}'::jsonb
    ),
    (
        '00000000-0000-0000-0000-000000000002',
        'contributor@example.com', 
        crypt('password123', gen_salt('bf')), 
        'authenticated',
        now(),
        now(),
        '{"full_name": "Content Contributor"}'::jsonb
    ),
    (
        '00000000-0000-0000-0000-000000000003',
        'editor@example.com', 
        crypt('password123', gen_salt('bf')), 
        'authenticated',
        now(),
        now(),
        '{"full_name": "Content Editor"}'::jsonb
    ),
    (
        '00000000-0000-0000-0000-000000000004',
        'manager@example.com', 
        crypt('password123', gen_salt('bf')), 
        'authenticated',
        now(),
        now(),
        '{"full_name": "Project Manager"}'::jsonb
    ),
    (
        '00000000-0000-0000-0000-000000000005',
        'superuser@example.com', 
        crypt('password123', gen_salt('bf')), 
        'authenticated',
        now(),
        now(),
        '{"full_name": "Super User"}'::jsonb
    );

-- Update profiles with appropriate roles and names
UPDATE public.profiles SET role = 'user', first_name = 'Regular', last_name = 'User' 
WHERE user_id = '00000000-0000-0000-0000-000000000001';

UPDATE public.profiles SET role = 'contributor', first_name = 'Content', last_name = 'Contributor' 
WHERE user_id = '00000000-0000-0000-0000-000000000002';

UPDATE public.profiles SET role = 'editor', first_name = 'Content', last_name = 'Editor' 
WHERE user_id = '00000000-0000-0000-0000-000000000003';

UPDATE public.profiles SET role = 'manager', first_name = 'Project', last_name = 'Manager' 
WHERE user_id = '00000000-0000-0000-0000-000000000004';

UPDATE public.profiles SET role = 'superuser', first_name = 'Super', last_name = 'User' 
WHERE user_id = '00000000-0000-0000-0000-000000000005';
