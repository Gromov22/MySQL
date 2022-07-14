DROP TABLE IF EXISTS blacklist;
CREATE TABLE blacklist (
	user_id BIGINT UNSIGNED NOT NULL,
	banned_user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	
	PRIMARY KEY (user_id, banned_user_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (banned_user_id) REFERENCES users(id),
	CHECK (user_id != banned_user_id)
);


DROP TABLE IF EXISTS subscribers;
CREATE TABLE subscribers (
	user_id BIGINT UNSIGNED NOT NULL,
	user_subscriber_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),

	PRIMARY KEY (user_id, user_subscriber_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (user_subscriber_id) REFERENCES users(id),
	CHECK (user_id != user_subscriber_id)

);

DROP TABLE IF EXISTS saved_content;
CREATE TABLE saved_content (
	user_id BIGINT UNSIGNED NOT NULL,
	content_id BIGINT UNSIGNED NOT NULL,
	content_type BIGINT UNSIGNED NOT NULL,
	filename VARCHAR(255),
	metadata JSON,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE NOW(),
	
    INDEX (content_type),
	FOREIGN KEY (content_type) REFERENCES media_types(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);