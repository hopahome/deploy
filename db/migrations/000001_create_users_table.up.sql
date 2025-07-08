CREATE TABLE users
(
    id         UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email      VARCHAR(256) NOT NULL,
    password   TEXT         NOT NULL,
    name       VARCHAR(100),
    confirmed  BOOL             DEFAULT FALSE,
    created_at DATE             DEFAULT now(),
    updated_at DATE             DEFAULT now(),
    deleted_at DATE             DEFAULT NULL
);