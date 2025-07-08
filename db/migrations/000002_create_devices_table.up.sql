CREATE TABLE devices
(
    id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    mac_address TEXT NOT NULL,
    user_id     UUID NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    name        TEXT,
    description TEXT,
    room        TEXT,
    type        TEXT,
    status_info JSONB,
    custom_data JSONB,
    device_info JSONB,
    created_at  TIMESTAMP        DEFAULT NOW(),
    deleted_at  TIMESTAMP        DEFAULT NULL
);