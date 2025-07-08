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
    parameters  JSONB,
    state       JSONB
);
