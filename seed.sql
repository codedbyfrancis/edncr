DO $
DECLARE
    user_id_user UUID;
    user_id_contributor UUID;
    user_id_editor UUID;
    user_id_manager UUID;
    user_id_superuser UUID;
BEGIN
    -- Create user with 'user' role
    user_id_user := '00000000-0000-0000-0000-000000000001';
    INSERT INTO auth.users (id, email, encrypted_password, role)
    VALUES (user_id_user, 'user@example.com', crypt('password', gen_salt('bf')), 'authenticated');

    -- Create user with 'contributor' role
    user_id_contributor := '00000000-0000-0000-0000-000000000002';
    INSERT INTO auth.users (id, email, encrypted_password, role)
    VALUES (user_id_contributor, 'contributor@example.com', crypt('password', gen_salt('bf')), 'authenticated');

    -- Create user with 'editor' role
    user_id_editor := '00000000-0000-0000-0000-000000000003';
    INSERT INTO auth.users (id, email, encrypted_password, role)
    VALUES (user_id_editor, 'editor@example.com', crypt('password', gen_salt('bf')), 'authenticated');

    -- Create user with 'manager' role
    user_id_manager := '00000000-0000-0000-0000-000000000004';
    INSERT INTO auth.users (id, email, encrypted_password, role)
    VALUES (user_id_manager, 'manager@example.com', crypt('password', gen_salt('bf')), 'authenticated');

    -- Create user with 'superuser' role
    user_id_superuser := '00000000-0000-0000-0000-000000000005';
    INSERT INTO auth.users (id, email, encrypted_password, role)
    VALUES (user_id_superuser, 'superuser@example.com', crypt('password', gen_salt('bf')), 'authenticated');
END;
$;

-- Create pages
-- INSERT INTO public.pages (title, sub_title, content, user_id, approved_by_user_id, status)
-- VALUES
--     ('About Us', 'Our Story', 'This is the about us page.', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000004', 'approved'),
--     ('Contact Us', 'Get in Touch', 'This is the contact us page.', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000004', 'approved'),
--     ('Services', 'What We Offer', 'This is the services page.', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000004', 'approved'),
--     ('Products', 'Our Products', 'This is the products page.', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000004', 'approved'),
--     ('Blog', 'Latest News', 'This is the blog page.', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000004', 'approved'),
--     ('FAQ', 'Frequently Asked Questions', 'This is the FAQ page.', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000004', 'approved'),
--     ('Terms of Service', 'Our Terms', 'This is the terms of service page.', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000004', 'approved'),
--     ('Privacy Policy', 'Your Privacy', 'This is the privacy policy page.', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000004', 'approved'),
--     ('Careers', 'Join Our Team', 'This is the careers page.', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000004', 'approved'),
--     ('Press', 'Media Inquiries', 'This is the press page.', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000004', 'approved');
