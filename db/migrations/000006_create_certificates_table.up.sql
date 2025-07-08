CREATE TABLE certificates
(
    id            UUID PRIMARY KEY   DEFAULT uuid_generate_v4(),
    subject_type  TEXT      NOT NULL CHECK ( subject_type IN ('device', 'service') ),
    subject_id    UUID      NOT NULL,
    serial_number TEXT      NOT NULL,
    public_key    TEXT      NOT NULL,
    pem_cert      TEXT      NOT NULL,
    issues_at     TIMESTAMP NOT NULL DEFAULT now(),
    expires_at    TIMESTAMP NOT NULL,
    revoked       BOOLEAN   NOT NULL DEFAULT false,
    revoked_at    TIMESTAMP,
    revoke_reason TEXT
);