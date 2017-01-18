INSERT INTO role (name, description) VALUES ('admin', 'Administrative role');

INSERT INTO account_role (account_pin, role_id) VALUES ('466115', (SELECT role_id FROM role WHERE name = 'admin'));

