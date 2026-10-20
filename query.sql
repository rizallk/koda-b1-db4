  -- roles
  -- SOCIAL_PROVIDERS
  -- users
  -- audit_log

CREATE TABLE roles (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ
);

CREATE TABLE social_providers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
   created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(100) NOT NULL,
  lastname VARCHAR(100) NOT NULL,
  username VARCHAR(100) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  is_email_verified BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ,
  role_id INTEGER REFERENCES roles(id),
  social_provider_id INTEGER REFERENCES social_providers(id)
);

CREATE TABLE audit_log (
  id SERIAL PRIMARY KEY,
  login_at TIMESTAMPTZ NOT NULL,
  logout_at TIMESTAMPTZ NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id)
);