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
    editor_id uuid;
    manager_id uuid;
    page_id bigint;
    i integer := 0;
BEGIN
    -- Get user_ids
    SELECT id INTO superuser_id FROM auth.users WHERE email = 'superuser@example.com';
    SELECT id INTO editor_id FROM auth.users WHERE email = 'editor@example.com';
    SELECT id INTO manager_id FROM auth.users WHERE email = 'manager@example.com';

    -- Insert page 1 (approved)
    i := 1;
    INSERT INTO public.pages (slug, user_id, status, approved_by_user_id, approved_at, created_at) VALUES ('about-us', editor_id, 'approved', manager_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval) RETURNING id INTO page_id;
    INSERT INTO public.pages_translations (page_id, lang, title, sub_title, content, featured_image, user_id, status, approved_by_user_id, approved_at, modified_at, created_at) VALUES
        (page_id, 'en', 'About Us', 'Learn more about our company', 'This is the about us page.', 'https://example.com/images/about-us.jpg', editor_id, 'approved', manager_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval),
        (page_id, 'ar', 'من نحن', 'اعرف المزيد عن شركتنا', 'هذه هي صفحة من نحن.', 'https://example.com/images/about-us.jpg', editor_id, 'approved', manager_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval),
        (page_id, 'nl', 'Over Ons', 'Lees meer over ons bedrijf', 'Dit is de over ons pagina.', 'https://example.com/images/about-us.jpg', editor_id, 'approved', manager_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval);

    -- Insert page 2 (draft)
    i := 2;
    INSERT INTO public.pages (slug, user_id, status, created_at) VALUES ('contact-us', superuser_id, 'draft', (now() at time zone 'utc') - (i || ' days')::interval) RETURNING id INTO page_id;
    INSERT INTO public.pages_translations (page_id, lang, title, sub_title, content, user_id, status, created_at) VALUES
        (page_id, 'en', 'Contact Us', 'Get in touch with us', 'This is the contact us page.', superuser_id, 'draft', (now() at time zone 'utc') - (i || ' days')::interval),
        (page_id, 'ar', 'اتصل بنا', 'تواصل معنا', 'هذه هي صفحة اتصل بنا.', superuser_id, 'draft', (now() at time zone 'utc') - (i || ' days')::interval),
        (page_id, 'nl', 'Contacteer Ons', 'Neem contact met ons op', 'Dit is de contacteer ons pagina.', superuser_id, 'draft', (now() at time zone 'utc') - (i || ' days')::interval);

    -- Insert page 3 (for_review)
    i := 3;
    INSERT INTO public.pages (slug, user_id, status, created_at) VALUES ('terms-of-service', editor_id, 'for_review', (now() at time zone 'utc') - (i || ' days')::interval) RETURNING id INTO page_id;
    INSERT INTO public.pages_translations (page_id, lang, title, sub_title, content, user_id, status, created_at) VALUES
        (page_id, 'en', 'Terms of Service', 'Read our terms of service', 'This is the terms of service page.', editor_id, 'for_review', (now() at time zone 'utc') - (i || ' days')::interval),
        (page_id, 'ar', 'شروط الخدمة', 'اقرأ شروط الخدمة الخاصة بنا', 'هذه هي صفحة شروط الخدمة.', editor_id, 'for_review', (now() at time zone 'utc') - (i || ' days')::interval),
        (page_id, 'nl', 'Servicevoorwaarden', 'Lees onze servicevoorwaarden', 'Dit is de servicevoorwaarden pagina.', editor_id, 'for_review', (now() at time zone 'utc') - (i || ' days')::interval);

    -- Insert page 4 (rejected)
    i := 4;
    INSERT INTO public.pages (slug, user_id, status, created_at) VALUES ('privacy-policy', editor_id, 'rejected', (now() at time zone 'utc') - (i || ' days')::interval) RETURNING id INTO page_id;
    INSERT INTO public.pages_translations (page_id, lang, title, sub_title, content, user_id, status, created_at) VALUES
        (page_id, 'en', 'Privacy Policy', 'Our commitment to your privacy', 'This is the privacy policy page.', editor_id, 'rejected', (now() at time zone 'utc') - (i || ' days')::interval),
        (page_id, 'ar', 'سياسة الخصوصية', 'التزامنا بخصوصيتك', 'هذه هي صفحة سياسة الخصوصية.', editor_id, 'rejected', (now() at time zone 'utc') - (i || ' days')::interval),
        (page_id, 'nl', 'Privacybeleid', 'Onze toewijding aan uw privacy', 'Dit is de privacybeleid pagina.', editor_id, 'rejected', (now() at time zone 'utc') - (i || ' days')::interval);

    -- Insert page 5 (approved)
    i := 5;
    INSERT INTO public.pages (slug, user_id, status, approved_by_user_id, approved_at, created_at) VALUES ('faq', manager_id, 'approved', superuser_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval) RETURNING id INTO page_id;
    INSERT INTO public.pages_translations (page_id, lang, title, sub_title, content, featured_image, user_id, status, approved_by_user_id, approved_at, modified_at, created_at) VALUES
        (page_id, 'en', 'FAQ', 'Frequently Asked Questions', 'This is the FAQ page.', 'https://example.com/images/faq.jpg', manager_id, 'approved', superuser_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval),
        (page_id, 'ar', 'الأسئلة الشائعة', 'الأسئلة المتداولة', 'هذه هي صفحة الأسئلة الشائعة.', 'https://example.com/images/faq.jpg', manager_id, 'approved', superuser_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval),
        (page_id, 'nl', 'Veelgestelde Vragen', 'Veelgestelde Vragen', 'Dit is de veelgestelde vragen pagina.', 'https://example.com/images/faq.jpg', manager_id, 'approved', superuser_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval);
END $$;

-- Add 10 blogs with translations
DO $$
DECLARE
    superuser_id uuid;
    editor_id uuid;
    contributor_id uuid;
    manager_id uuid;
    blog_id bigint;
BEGIN
    -- Get user_ids
    SELECT id INTO superuser_id FROM auth.users WHERE email = 'superuser@example.com';
    SELECT id INTO editor_id FROM auth.users WHERE email = 'editor@example.com';
    SELECT id INTO contributor_id FROM auth.users WHERE email = 'contributor@example.com';
    SELECT id INTO manager_id FROM auth.users WHERE email = 'manager@example.com';

    -- Insert 10 blogs with varied statuses and users
    FOR i IN 1..10 LOOP
        IF i % 4 = 0 THEN -- Approved by manager
            INSERT INTO public.blogs (slug, user_id, status, approved_by_user_id, approved_at, created_at)
            VALUES ('blog-post-' || i, editor_id, 'approved', manager_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval)
            RETURNING id INTO blog_id;
            INSERT INTO public.blogs_translations (blog_id, lang, title, sub_title, content, featured_image, user_id, status, approved_by_user_id, approved_at, modified_at, created_at)
            VALUES
                (blog_id, 'en', 'Blog Post ' || i, 'An approved blog post by an editor', 'This is the content for blog post ' || i, 'https://example.com/images/blog' || i || '.jpg', editor_id, 'approved', manager_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval),
                (blog_id, 'ar', 'تدوينة ' || i, 'تدوينة معتمدة من قبل محرر', 'هذا هو محتوى التدوينة ' || i, 'https://example.com/images/blog' || i || '.jpg', editor_id, 'approved', manager_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval),
                (blog_id, 'nl', 'Blogbericht ' || i, 'Een goedgekeurd blogbericht door een redacteur', 'Dit is de inhoud voor blogbericht ' || i, 'https://example.com/images/blog' || i || '.jpg', editor_id, 'approved', manager_id, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval, (now() at time zone 'utc') - (i || ' days')::interval);
        ELSIF i % 4 = 1 THEN -- Draft by contributor
            INSERT INTO public.blogs (slug, user_id, status, created_at)
            VALUES ('blog-post-' || i, contributor_id, 'draft', (now() at time zone 'utc') - (i || ' days')::interval)
            RETURNING id INTO blog_id;
            INSERT INTO public.blogs_translations (blog_id, lang, title, sub_title, content, user_id, status, created_at)
            VALUES
                (blog_id, 'en', 'Blog Post ' || i, 'A draft by a contributor', 'This is the content for blog post ' || i, contributor_id, 'draft', (now() at time zone 'utc') - (i || ' days')::interval),
                (blog_id, 'ar', 'تدوينة ' || i, 'مسودة من قبل مساهم', 'هذا هو محتوى التدوينة ' || i, contributor_id, 'draft', (now() at time zone 'utc') - (i || ' days')::interval),
                (blog_id, 'nl', 'Blogbericht ' || i, 'Een concept van een bijdrager', 'Dit is de inhoud voor blogbericht ' || i, contributor_id, 'draft', (now() at time zone 'utc') - (i || ' days')::interval);
        ELSIF i % 4 = 2 THEN -- For review by editor
            INSERT INTO public.blogs (slug, user_id, status, created_at)
            VALUES ('blog-post-' || i, editor_id, 'for_review', (now() at time zone 'utc') - (i || ' days')::interval)
            RETURNING id INTO blog_id;
            INSERT INTO public.blogs_translations (blog_id, lang, title, sub_title, content, user_id, status, created_at)
            VALUES
                (blog_id, 'en', 'Blog Post ' || i, 'For review by an editor', 'This is the content for blog post ' || i, editor_id, 'for_review', (now() at time zone 'utc') - (i || ' days')::interval),
                (blog_id, 'ar', 'تدوينة ' || i, 'للمراجعة من قبل محرر', 'هذا هو محتوى التدوينة ' || i, editor_id, 'for_review', (now() at time zone 'utc') - (i || ' days')::interval),
                (blog_id, 'nl', 'Blogbericht ' || i, 'Ter beoordeling door een redacteur', 'Dit is de inhoud voor blogbericht ' || i, editor_id, 'for_review', (now() at time zone 'utc') - (i || ' days')::interval);
        ELSE -- Rejected by superuser
            INSERT INTO public.blogs (slug, user_id, status, created_at)
            VALUES ('blog-post-' || i, contributor_id, 'rejected', (now() at time zone 'utc') - (i || ' days')::interval)
            RETURNING id INTO blog_id;
            INSERT INTO public.blogs_translations (blog_id, lang, title, sub_title, content, user_id, status, created_at)
            VALUES
                (blog_id, 'en', 'Blog Post ' || i, 'A rejected post', 'This content was not approved.', contributor_id, 'rejected', (now() at time zone 'utc') - (i || ' days')::interval),
                (blog_id, 'ar', 'تدوينة ' || i, 'مشاركة مرفوضة', 'لم تتم الموافقة على هذا المحتوى.', contributor_id, 'rejected', (now() at time zone 'utc') - (i || ' days')::interval),
                (blog_id, 'nl', 'Blogbericht ' || i, 'Een afgewezen bericht', 'Deze inhoud is niet goedgekeurd.', contributor_id, 'rejected', (now() at time zone 'utc') - (i || ' days')::interval);
        END IF;
    END LOOP;
END $$;

-- Add 3 companies
DO $$
DECLARE
    superuser_id uuid;
BEGIN
    -- Get user_id
    SELECT id INTO superuser_id FROM auth.users WHERE email = 'superuser@example.com';

    -- Insert 3 companies
    INSERT INTO public.companies (name, email, telephone, mobile, website, logo, trade_license, trade_license_expiration, contact_person_name, contact_person_phone, contact_person_email, status, modified_by)
    VALUES
        ('Innovate Tech', 'contact@innovatetech.com', '04-1234567', '050-1111111', 'https://innovatetech.com', 'https://example.com/logos/innovate.png', 'TR-12345', '2026-08-01', 'John Doe', '050-1234567', 'john.doe@innovatetech.com', 'active', superuser_id),
        ('Global Solutions', 'info@globalsolutions.ae', '02-7654321', '055-2222222', 'https://globalsolutions.ae', 'https://example.com/logos/global.png', 'TR-54321', '2027-01-15', 'Jane Smith', '055-9876543', 'jane.smith@globalsolutions.ae', 'active', superuser_id),
        ('Future Enterprises', 'hello@future-ent.com', '06-5558888', '052-3333333', 'https://future-ent.com', 'https://example.com/logos/future.png', 'TR-67890', '2025-11-20', 'Peter Jones', '052-4567890', 'peter.jones@future-ent.com', 'inactive', superuser_id);
END $$;
