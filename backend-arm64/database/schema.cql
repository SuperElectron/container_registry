-- noinspection SqlDialectInspectionForFile
DROP TABLE IF EXISTS test.data;
DROP KEYSPACE IF EXISTS test;
CREATE KEYSPACE test WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '3'};

CREATE TABLE test.person (
    id uuid,
    first_name text,
    last_name text,
    PRIMARY KEY (id)
);

CREATE TYPE test.coordinate (
    x double,
    y double,
    z double
);

CREATE TYPE test.aisle (
    id text,
    name text,
    level text,
    coordinate frozen<coordinate>
);

CREATE TYPE test.location (
    lat double,
    lon double,
    alt double
);

CREATE TYPE test.place (
    id text,
    name text,
    type text,
    location frozen<location>,
    aisle frozen<aisle>
);

CREATE TYPE test.sensor (
    id text,
    type text,
    description text,
    location frozen<location>,
    coordinate frozen<coordinate>
);

CREATE TYPE test.analyticsmodule (
    id text,
    description text,
    source text,
    version text,
    confidence double
);

CREATE TYPE test.vehicle (
    make text,
    model text,
    color text,
    confidence double,
    license text,
    licensestate text,
    type text,
);

CREATE TYPE test.bbox (
    topleftx double,
    toplefty double,
    bottomrightx double,
    bottomrighty double
);


CREATE TYPE test.object (
    id text,
    speed double,
    direction double,
    orientation double,
    vehicle frozen<vehicle>,
    bbox frozen<bbox>,
    location frozen<location>,
    coordinate frozen<coordinate>
);

CREATE TYPE test.event (
    id text,
    type text,
);

CREATE TABLE test.data (
    messageid text,
    mdsversion text,
    timestamps text,
    place frozen<place>,
    sensor frozen<sensor>,
    analyticsmodule frozen<analyticsmodule>,
    object frozen<object>,
    event frozen<event>,
    videopath text,
    PRIMARY KEY (messageid)
);
