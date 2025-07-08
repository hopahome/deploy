CREATE TABLE services
(
    id         UUID PRIMARY KEY   DEFAULT uuid_generate_v4(),
    name       TEXT      NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);