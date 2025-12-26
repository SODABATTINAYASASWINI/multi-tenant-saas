-- =========================
-- SEED: SUPER ADMIN (NO TENANT)
-- =========================
INSERT INTO users (
    id,
    tenant_id,
    email,
    password_hash,
    full_name,
    role,
    is_active
) VALUES (
    uuid_generate_v4(),
    NULL,
    'superadmin@system.com',
    '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36u6h2K7FhF38sZ4N2VN6Hy', -- Admin@123
    'System Super Admin',
    'super_admin',
    TRUE
);

-- =========================
-- SEED: DEMO TENANT
-- =========================
INSERT INTO tenants (
    id,
    name,
    subdomain,
    status,
    subscription_plan,
    max_users,
    max_projects
) VALUES (
    '11111111-1111-1111-1111-111111111111',
    'Demo Company',
    'demo',
    'active',
    'pro',
    50,
    20
);

-- =========================
-- SEED: TENANT ADMIN
-- =========================
INSERT INTO users (
    id,
    tenant_id,
    email,
    password_hash,
    full_name,
    role,
    is_active
) VALUES (
    '22222222-2222-2222-2222-222222222222',
    '11111111-1111-1111-1111-111111111111',
    'admin@demo.com',
    '$2b$10$QpZpYH5f2ZJkG4zU6cX9I.2oU4Y8eQJz6yJ6cTqG1dZl8ZKcV9D0a', -- Demo@123
    'Demo Admin',
    'tenant_admin',
    TRUE
);

-- =========================
-- SEED: REGULAR USERS
-- =========================
INSERT INTO users (
    id,
    tenant_id,
    email,
    password_hash,
    full_name,
    role,
    is_active
) VALUES
(
    '33333333-3333-3333-3333-333333333333',
    '11111111-1111-1111-1111-111111111111',
    'user1@demo.com',
    '$2b$10$9Q3Zc1KZK0lY8pC9h5tP0eKk5E7pZ9B8vC1zGZB8NfM3E9fR5Gq2a', -- User@123
    'Demo User One',
    'user',
    TRUE
),
(
    '44444444-4444-4444-4444-444444444444',
    '11111111-1111-1111-1111-111111111111',
    'user2@demo.com',
    '$2b$10$9Q3Zc1KZK0lY8pC9h5tP0eKk5E7pZ9B8vC1zGZB8NfM3E9fR5Gq2a', -- User@123
    'Demo User Two',
    'user',
    TRUE
);

-- =========================
-- SEED: PROJECTS
-- =========================
INSERT INTO projects (
    id,
    tenant_id,
    name,
    description,
    status,
    created_by
) VALUES
(
    '55555555-5555-5555-5555-555555555555',
    '11111111-1111-1111-1111-111111111111',
    'Demo Project A',
    'First demo project',
    'active',
    '22222222-2222-2222-2222-222222222222'
),
(
    '66666666-6666-6666-6666-666666666666',
    '11111111-1111-1111-1111-111111111111',
    'Demo Project B',
    'Second demo project',
    'active',
    '22222222-2222-2222-2222-222222222222'
);

-- =========================
-- SEED: TASKS (5 TOTAL)
-- =========================
INSERT INTO tasks (
    id,
    project_id,
    tenant_id,
    title,
    description,
    status,
    priority,
    assigned_to
) VALUES
(uuid_generate_v4(), '55555555-5555-5555-5555-555555555555', '11111111-1111-1111-1111-111111111111', 'Task 1', 'Demo task', 'todo', 'high', '33333333-3333-3333-3333-333333333333'),
(uuid_generate_v4(), '55555555-5555-5555-5555-555555555555', '11111111-1111-1111-1111-111111111111', 'Task 2', 'Demo task', 'in_progress', 'medium', '44444444-4444-4444-4444-444444444444'),
(uuid_generate_v4(), '66666666-6666-6666-6666-666666666666', '11111111-1111-1111-1111-111111111111', 'Task 3', 'Demo task', 'todo', 'low', NULL),
(uuid_generate_v4(), '66666666-6666-6666-6666-666666666666', '11111111-1111-1111-1111-111111111111', 'Task 4', 'Demo task', 'completed', 'medium', '33333333-3333-3333-3333-333333333333'),
(uuid_generate_v4(), '66666666-6666-6666-6666-666666666666', '11111111-1111-1111-1111-111111111111', 'Task 5', 'Demo task', 'todo', 'high', '44444444-4444-4444-4444-444444444444');
