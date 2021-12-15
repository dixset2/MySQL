UPDATE users
SET created_at = NULL WHERE id IS NOT NULL
UPDATE users
SET updated_at = NULL WHERE id IS NOT NULL

UPDATE users
SET created_at = NOW(); /* Почему здесь обновляется сразу created и updated_at ? Точнее какой where мне нужно указать? */

DESCRIBE users; /* Уже стоит тип datetime, хотя в ПЗ пишется о varchar */

ALTER TABLE users
    CHANGE COLUMN `created_at` `created_at` VARCHAR(256) NULL,
    CHANGE COLUMN `updated_at` `updated_at` VARCHAR(256) NULL;
DESCRIBE users;

ALTER TABLE users
    CHANGE COLUMN created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHANGE COLUMN `updated_at` `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
DESCRIBE users;