CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "active_storage_attachments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "record_type" varchar NOT NULL, "record_id" integer NOT NULL, "blob_id" integer NOT NULL, "created_at" datetime NOT NULL);
CREATE INDEX "index_active_storage_attachments_on_blob_id" ON "active_storage_attachments" ("blob_id");
CREATE UNIQUE INDEX "index_active_storage_attachments_uniqueness" ON "active_storage_attachments" ("record_type", "record_id", "name", "blob_id");
CREATE TABLE "active_storage_blobs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "key" varchar NOT NULL, "filename" varchar NOT NULL, "content_type" varchar, "metadata" text, "byte_size" bigint NOT NULL, "checksum" varchar NOT NULL, "created_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_active_storage_blobs_on_key" ON "active_storage_blobs" ("key");
CREATE TABLE "events" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "picture" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "date_of_event" datetime, "location" varchar, "rsvp_cut_off" datetime, "address" varchar, "latitude" decimal, "longitude" decimal);
CREATE TABLE "events_guests" ("guest_id" integer, "event_id" integer);
CREATE INDEX "index_events_guests_on_guest_id_and_event_id" ON "events_guests" ("guest_id", "event_id");
CREATE TABLE "guestlists" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "response" varchar, "event_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_guestlists_on_event_id" ON "guestlists" ("event_id");
CREATE TABLE "guests" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "response" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "event_id" integer);
CREATE TABLE "locations" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "latitude" decimal, "longitude" decimal, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "todo_items" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "content" varchar, "todo_list_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "completed_at" datetime);
CREATE INDEX "index_todo_items_on_todo_list_id" ON "todo_items" ("todo_list_id");
CREATE TABLE "todo_lists" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "todos" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "description" varchar, "event_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_todos_on_event_id" ON "todos" ("event_id");
CREATE TABLE "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "confirmation_token" varchar, "confirmed_at" datetime, "confirmation_sent_at" datetime, "unconfirmed_email" varchar, "failed_attempts" integer DEFAULT 0 NOT NULL, "unlock_token" varchar, "locked_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" varchar);
CREATE UNIQUE INDEX "index_users_on_confirmation_token" ON "users" ("confirmation_token");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "index_users_on_unlock_token" ON "users" ("unlock_token");
INSERT INTO "schema_migrations" (version) VALUES
('20190404072547'),
('20190404073431'),
('20190404075435'),
('20190416115048'),
('20190416141448'),
('20190416141933'),
('20190416152507'),
('20190418113359'),
('20190423102610'),
('20190524105406'),
('20190525173208'),
('20190802082320'),
('20190806082242'),
('20190809213833'),
('20190809214155'),
('20190809215458');


