DROP TABLE jobs;

CREATE TABLE jobs ( id integer,
details text,
locked_at timestamp);

CREATE INDEX index ON jobs(id);