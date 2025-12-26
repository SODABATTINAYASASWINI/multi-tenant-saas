-- UP
CREATE TABLE tenants (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR NOT NULL,
    subdomain VARCHAR NOT NULL UNIQUE,
    status tenant_status NOT NULL,
    subscription_plan subscription_plan NOT NULL,
    max_users INTEGER,
    max_projects INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- DOWN
DROP TABLE IF EXISTS tenants;
