DROP TABLE jobs;

CREATE TABLE jobs (
  id serial,
  details text,
  locked_at timestamp
);

CREATE INDEX index ON jobs(id);