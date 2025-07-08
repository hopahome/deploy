CREATE TABLE properties
(
    id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    device_id   UUID NOT NULL REFERENCES devices (id) ON DELETE CASCADE,
    type        TEXT NOT NULL CHECK (type IN ('devices.properties.float', 'devices.properties.event')),
    retrievable BOOL NOT NULL    DEFAULT True,
    reportable  BOOL NOT NULL    DEFAULT False,
    parameters  JSONB,
    state       JSONB
);