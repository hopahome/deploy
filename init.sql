CREATE
    EXTENSION IF NOT EXISTS "uuid-ossp";

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

CREATE TABLE capabilities
(
    id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    device_id   UUID NOT NULL REFERENCES devices (id) ON DELETE CASCADE,
    type        TEXT NOT NULL CHECK (type IN
                                     ('devices.capabilities.on_off', 'devices.capabilities.color_setting',
                                      'devices.capabilities.mode', 'devices.capabilities.range',
                                      'devices.capabilities.toggle')),
    retrievable BOOL NOT NULL    DEFAULT True,
    reportable  BOOL NOT NULL    DEFAULT False,
    parameters  json,
    state       json
);

CREATE TABLE properties
(
    id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    device_id   UUID NOT NULL REFERENCES devices (id) ON DELETE CASCADE,
    type        TEXT NOT NULL CHECK (type IN ('devices.properties.float', 'devices.properties.event')),
    retrievable BOOL NOT NULL    DEFAULT True,
    reportable  BOOL NOT NULL    DEFAULT False,
    parameters  json,
    state       json
);

--  this table stores mac_addresses of devices that can be registered
CREATE TABLE manufactured_devices
(
    id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    mac_address TEXT NOT NULL,
    created_at  TIMESTAMP        DEFAULT NOW()
)