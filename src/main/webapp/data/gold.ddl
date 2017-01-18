
-- PREFERENCE TABLES
DROP TABLE IF EXISTS preference;
DROP TABLE IF EXISTS color;
DROP TABLE IF EXISTS font;

-- WORKFLOW TABLES
DROP TABLE IF EXISTS workflow;

-- DEVELOPMENT TABLES
DROP TABLE IF EXISTS dev_menu_item_role;
DROP TABLE IF EXISTS dev_menu_item;
DROP TABLE IF EXISTS dev_menu_role;
DROP TABLE IF EXISTS dev_menu;
DROP TABLE IF EXISTS dev_package;

-- ACCOUNT TABLES
DROP TABLE IF EXISTS account_role;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS account;

CREATE TABLE account (
    account_pin CHAR(6) PRIMARY KEY NOT NULL, --SSA six-digit pin
    name VARCHAR(100) NOT NULL, --name of user
    password TEXT NOT NULL, --"text" ensures that the password can contain at least 60 characters. We should be good for encryption.
    desk_phone VARCHAR(100), --desk phone number, not required
    email_address VARCHAR(100), --not required
    job_title VARCHAR(100), --not required
    division VARCHAR(100), --not required
    branch VARCHAR(100), --not required
    physical_location VARCHAR(100) --not required
);

CREATE TABLE workflow (
	workflow_id BIGSERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(500) NOT NULL, --probably too much may need to shorten later
    description TEXT, 
    created TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by CHAR(6) NOT NULL, --SSA six-digit pin
    last_modified TIMESTAMP NOT NULL DEFAULT NOW(),
    last_modified_by CHAR(6) NOT NULL, --SSA six-digit pin
    FOREIGN KEY (created_by) REFERENCES account(account_pin), --joins to account table
    FOREIGN KEY (last_modified_by) REFERENCES account(account_pin) --joins to account table
);

CREATE TABLE role (
    role_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(64) NOT NULL,  --For now admin,  non-admin, database admin, etc. Consider drop down for roles on front-end
    description TEXT NOT NULL 
);

CREATE TABLE account_role (
    account_role_id BIGSERIAL PRIMARY KEY NOT NULL,
    account_pin CHAR(6) NOT NULL, 
    role_id BIGINT, -- Can't use BIGSERIAL because it auto-increments and is used as the account_role_id
    FOREIGN KEY (account_pin) REFERENCES account(account_pin),
    FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE TABLE dev_package
(
	dev_package_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(256) NOT NULL,
    description TEXT,
    created TIMESTAMP NOT NULL DEFAULT NOW(),
	created_by CHAR(6) NOT NULL, --SSA six-digit pin
	last_modified TIMESTAMP NOT NULL DEFAULT NOW(),
	last_modified_by CHAR(6) NOT NULL, --SSA six-digit pin
	FOREIGN KEY (created_by) REFERENCES account(account_pin), --joins to account table
	FOREIGN KEY (last_modified_by) REFERENCES account(account_pin) --joins to account table
);

CREATE TABLE dev_menu
(
	dev_menu_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(256) NOT NULL,
    description TEXT,
    created TIMESTAMP NOT NULL DEFAULT NOW(),
	created_by CHAR(6) NOT NULL, --SSA six-digit pin
	last_modified TIMESTAMP NOT NULL DEFAULT NOW(),
	last_modified_by CHAR(6) NOT NULL, --SSA six-digit pin
	FOREIGN KEY (created_by) REFERENCES account(account_pin), --joins to account table
	FOREIGN KEY (last_modified_by) REFERENCES account(account_pin) --joins to account table
);

CREATE TABLE dev_menu_role
(
    dev_menu_role_id BIGSERIAL PRIMARY KEY NOT NULL,
    dev_menu_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    FOREIGN KEY (dev_menu_id) REFERENCES dev_menu (dev_menu_id),
    FOREIGN KEY (role_id) REFERENCES role (role_id)
);

CREATE UNIQUE INDEX dev_menu_role_idx
ON dev_menu_role (dev_menu_id, role_id);

CREATE TABLE dev_menu_item
(
    dev_menu_item_id BIGSERIAL PRIMARY KEY NOT NULL,
    dev_menu_id BIGINT NOT NULL,
    menu_text VARCHAR(128) NOT NULL,
    name VARCHAR(256) NOT NULL,
    description TEXT,
    help_text VARCHAR(256),
    created TIMESTAMP NOT NULL DEFAULT NOW(),
	created_by CHAR(6) NOT NULL, --SSA six-digit pin
	last_modified TIMESTAMP NOT NULL DEFAULT NOW(),
	last_modified_by CHAR(6) NOT NULL, --SSA six-digit pin
    FOREIGN KEY (dev_menu_id) REFERENCES dev_menu (dev_menu_id), -- joins to dev_menu table
	FOREIGN KEY (created_by) REFERENCES account(account_pin), --joins to account table
	FOREIGN KEY (last_modified_by) REFERENCES account(account_pin) --joins to account table
);

CREATE TABLE dev_menu_item_role
(
    dev_menu_item_role_id BIGSERIAL PRIMARY KEY NOT NULL,
    dev_menu_item_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    FOREIGN KEY (dev_menu_item_id) REFERENCES dev_menu_item (dev_menu_item_id),
    FOREIGN KEY (role_id) REFERENCES role (role_id)
);

CREATE UNIQUE INDEX dev_menu_item_role_idx
ON dev_menu_item_role (dev_menu_item_id, role_id);

CREATE TABLE color (
    color_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(64) NOT NULL
);

CREATE TABLE font (
    font_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(64) NOT NULL
);


CREATE TABLE preference (
    preference_id BIGSERIAL PRIMARY KEY NOT NULL,
    account_pin CHAR(6) NOT NULL UNIQUE,
    bg_color BIGINT,
    font_color BIGINT,
    font_size BIGINT,
    font_family BIGINT,
	compliance_508 BOOL NOT NULL DEFAULT true,
    FOREIGN KEY (account_pin) REFERENCES account(account_pin),
    FOREIGN KEY (bg_color) REFERENCES color(color_id),
    FOREIGN KEY (font_family) REFERENCES font(font_id)
);

Insert into color (color_id, name)
Values  (0, 'Black'),
		(1, 'White'),
		(2, 'Blue'),
		(3, 'Yellow'),
		(4, 'Red'),
		(5, 'Green'),
		(6, 'Purple'),
		(7, 'Orange'),
		(8, 'Grey'),
		(9, 'Gold');


Insert into font (font_id, name)
Values  (0, 'Helvetica Neue'),
		(1, 'Georgia'),
		(2, 'Times New Roman'),
		(3, 'Arial'),
		(4, 'Arial Black'),
		(5, 'Comic Sans MS'),
		(6, 'Impact'),
		(7, 'Verdana'),
		(8, 'Courier New'),
		(9, 'Lucida Console');


