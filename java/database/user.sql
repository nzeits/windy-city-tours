-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER city_tours_owner
WITH PASSWORD 'finalcapstone';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO city_tours_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO city_tours_owner;

CREATE USER city_tours_appuser
WITH PASSWORD 'finalcapstone';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO city_tours_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO city_tours_appuser;
