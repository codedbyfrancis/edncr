-- Create users
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, recovery_token, recovery_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, confirmation_token, email_change, email_change_sent_at)
VALUES
    (gen_random_uuid(), gen_random_uuid(), 'authenticated', 'authenticated', 'user@example.com', crypt('password', gen_salt('bf')), (now() at time zone 'utc'), '', (now() at time zone 'utc'), (now() at time zone 'utc'), '{"provider":"email","providers":["email"]}', '{"full_name":"Normal User"}', (now() at time zone 'utc'), (now() at time zone 'utc'), '', '', (now() at time zone 'utc')),
    (gen_random_uuid(), gen_random_uuid(), 'authenticated', 'authenticated', 'contributor@example.com', crypt('password', gen_salt('bf')), (now() at time zone 'utc'), '', (now() at time zone 'utc'), (now() at time zone 'utc'), '{"provider":"email","providers":["email"]}', '{"full_name":"Contributor User"}', (now() at time zone 'utc'), (now() at time zone 'utc'), '', '', (now() at time zone 'utc')),
    (gen_random_uuid(), gen_random_uuid(), 'authenticated', 'authenticated', 'editor@example.com', crypt('password', gen_salt('bf')), (now() at time zone 'utc'), '', (now() at time zone 'utc'), (now() at time zone 'utc'), '{"provider":"email","providers":["email"]}', '{"full_name":"Editor User"}', (now() at time zone 'utc'), (now() at time zone 'utc'), '', '', (now() at time zone 'utc')),
    (gen_random_uuid(), gen_random_uuid(), 'authenticated', 'authenticated', 'manager@example.com', crypt('password', gen_salt('bf')), (now() at time zone 'utc'), '', (now() at time zone 'utc'), (now() at time zone 'utc'), '{"provider":"email","providers":["email"]}', '{"full_name":"Manager User"}', (now() at time zone 'utc'), (now() at time zone 'utc'), '', '', (now() at time zone 'utc')),
    (gen_random_uuid(), gen_random_uuid(), 'authenticated', 'authenticated', 'superuser@example.com', crypt('password', gen_salt('bf')), (now() at time zone 'utc'), '', (now() at time zone 'utc'), (now() at time zone 'utc'), '{"provider":"email","providers":["email"]}', '{"full_name":"Super User"}', (now() at time zone 'utc'), (now() at time zone 'utc'), '', '', (now() at time zone 'utc'));

-- Update profiles with roles and first_name
UPDATE public.profiles SET role = 'user', first_name = 'Normal' WHERE email = 'user@example.com';
UPDATE public.profiles SET role = 'contributor', first_name = 'Contributor' WHERE email = 'contributor@example.com';
UPDATE public.profiles SET role = 'editor', first_name = 'Editor' WHERE email = 'editor@example.com';
UPDATE public.profiles SET role = 'manager', first_name = 'Manager' WHERE email = 'manager@example.com';
UPDATE public.profiles SET role = 'superuser', first_name = 'Super' WHERE email = 'superuser@example.com';

-- Add 5 pages with translations
DO $$
DECLARE
    superuser_id uuid;
    page_id bigint;
BEGIN
    -- Get the user_id for the superuser
    SELECT id INTO superuser_id FROM auth.users WHERE email = 'superuser@example.com';

    -- Insert page 1 and its translations
    INSERT INTO public.pages (slug, user_id, status) VALUES ('about-us', superuser_id, 'approved') RETURNING id INTO page_id;
    INSERT INTO public.pages_translations (page_id, lang, title, content, user_id, status) VALUES
        (page_id, 'en', 'About Us', 'This is the about us page.', superuser_id, 'approved'),
        (page_id, 'ar', 'من نحن', 'هذه هي صفحة من نحن.', superuser_id, 'approved'),
        (page_id, 'nl', 'Over Ons', 'Dit is de over ons pagina.', superuser_id, 'approved');

    -- Insert page 2 and its translations
    INSERT INTO public.pages (slug, user_id, status) VALUES ('contact-us', superuser_id, 'approved') RETURNING id INTO page_id;
    INSERT INTO public.pages_translations (page_id, lang, title, content, user_id, status) VALUES
        (page_id, 'en', 'Contact Us', 'This is the contact us page.', superuser_id, 'approved'),
        (page_id, 'ar', 'اتصل بنا', 'هذه هي صفحة اتصل بنا.', superuser_id, 'approved'),
        (page_id, 'nl', 'Contacteer Ons', 'Dit is de contacteer ons pagina.', superuser_id, 'approved');

    -- Insert page 3 and its translations
    INSERT INTO public.pages (slug, user_id, status) VALUES ('terms-of-service', superuser_id, 'approved') RETURNING id INTO page_id;
    INSERT INTO public.pages_translations (page_id, lang, title, content, user_id, status) VALUES
        (page_id, 'en', 'Terms of Service', 'This is the terms of service page.', superuser_id, 'approved'),
        (page_id, 'ar', 'شروط الخدمة', 'هذه هي صفحة شروط الخدمة.', superuser_id, 'approved'),
        (page_id, 'nl', 'Servicevoorwaarden', 'Dit is de servicevoorwaarden pagina.', superuser_id, 'approved');

    -- Insert page 4 and its translations
    INSERT INTO public.pages (slug, user_id, status) VALUES ('privacy-policy', superuser_id, 'approved') RETURNING id INTO page_id;
    INSERT INTO public.pages_translations (page_id, lang, title, content, user_id, status) VALUES
        (page_id, 'en', 'Privacy Policy', 'This is the privacy policy page.', superuser_id, 'approved'),
        (page_id, 'ar', 'سياسة الخصوصية', 'هذه هي صفحة سياسة الخصوصية.', superuser_id, 'approved'),
        (page_id, 'nl', 'Privacybeleid', 'Dit is de privacybeleid pagina.', superuser_id, 'approved');

    -- Insert page 5 and its translations
    INSERT INTO public.pages (slug, user_id, status) VALUES ('faq', superuser_id, 'approved') RETURNING id INTO page_id;
    INSERT INTO public.pages_translations (page_id, lang, title, content, user_id, status) VALUES
        (page_id, 'en', 'FAQ', 'This is the FAQ page.', superuser_id, 'approved'),
        (page_id, 'ar', 'الأسئلة الشائعة', 'هذه هي صفحة الأسئلة الشائعة.', superuser_id, 'approved'),
        (page_id, 'nl', 'Veelgestelde Vragen', 'Dit is de veelgestelde vragen pagina.', superuser_id, 'approved');
END $$;

-- Add 10 blogs with translations
DO $$
DECLARE
    superuser_id uuid;
    blog_id bigint;
BEGIN
    -- Get the user_id for the superuser
    SELECT id INTO superuser_id FROM auth.users WHERE email = 'superuser@example.com';

    -- Insert 10 blogs with translations
    FOR i IN 1..10 LOOP
        INSERT INTO public.blogs (slug, user_id, status)
        VALUES ('blog-post-' || i, superuser_id, 'approved')
        RETURNING id INTO blog_id;

        INSERT INTO public.blogs_translations (blog_id, lang, title, content, user_id, status)
        VALUES
            (blog_id, 'en', 'Blog Post ' || i, 'This is the content for blog post ' || i, superuser_id, 'approved'),
            (blog_id, 'ar', 'تدوينة ' || i, 'هذا هو محتوى التدوينة ' || i, superuser_id, 'approved'),
            (blog_id, 'nl', 'Blogbericht ' || i, 'Dit is de inhoud voor blogbericht ' || i, superuser_id, 'approved');
    END LOOP;
END $$;