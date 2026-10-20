CREATE TABLE roles (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ
);

CREATE TABLE social_providers (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
   created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ
);

CREATE TABLE users (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  login_at TIMESTAMPTZ NOT NULL,
  logout_at TIMESTAMPTZ NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id)
);

-- =================================================

INSERT INTO roles (name) VALUES 
('user'),
('admin'),
('superadmin');

INSERT INTO social_providers (name) VALUES
('google'),
('facebook'),
('github');
select * from social_providers;

INSERT INTO users (firstname, lastname, username, email, password, is_email_verified, role_id, social_provider_id) VALUES
('Rizal', 'Kadamong', 'rizal123', 'rizal@gmail.com', '$2bdjj73', true, 2, 1),
('Budi', 'Santoso', 'budi_689', 'budi12@gmail.com', '$bh76289', false, NULL, NULL);

INSERT INTO audit_log (login_at, logout_at, user_id) VALUES
('2025-01-08 18:05:01', '2025-01-08 20:11:01', 1),
('2025-02-09 11:40:05', '2025-02-09 12:50:00', 2),
('2025-02-12 06:05:01', '2025-02-13 00:20:01', 2),
('2025-03-11 08:10:45', '2025-03-11 09:50:13', 1);