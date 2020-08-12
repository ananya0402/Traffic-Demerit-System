-- Generated by Oracle SQL Developer Data Modeler 18.4.0.339.1536
--   at:        2019-09-26 16:35:30 AEST
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c
-- Name:        Ananya Pandey
--Monash ID:    30757924

SPOOL tds_schema_output.txt;
SET echo ON;


DROP TABLE allocation CASCADE CONSTRAINTS;

DROP TABLE cancellation CASCADE CONSTRAINTS;

DROP TABLE demerit CASCADE CONSTRAINTS;

DROP TABLE driver CASCADE CONSTRAINTS;

DROP TABLE engine CASCADE CONSTRAINTS;

DROP TABLE licence_type CASCADE CONSTRAINTS;

DROP TABLE manufacturer CASCADE CONSTRAINTS;

DROP TABLE model CASCADE CONSTRAINTS;

DROP TABLE offence CASCADE CONSTRAINTS;

DROP TABLE officer CASCADE CONSTRAINTS;

DROP TABLE registration CASCADE CONSTRAINTS;

DROP TABLE registration_start CASCADE CONSTRAINTS;

DROP TABLE station CASCADE CONSTRAINTS;

DROP TABLE suspension CASCADE CONSTRAINTS;

DROP TABLE suspension_period CASCADE CONSTRAINTS;

DROP TABLE vehicle CASCADE CONSTRAINTS;

CREATE TABLE allocation (
    assign_date   DATE NOT NULL,
    st_no         VARCHAR2(5) NOT NULL,
    officer_id    VARCHAR2(8) NOT NULL
);

COMMENT ON COLUMN allocation.st_no IS
    'Station number';

COMMENT ON COLUMN allocation.officer_id IS
    'Officer ID';

ALTER TABLE allocation
    ADD CONSTRAINT allocation_pk PRIMARY KEY ( assign_date,
                                               st_no,
                                               officer_id );

CREATE TABLE cancellation (
    date_cancelled              DATE NOT NULL,
    period_cancellation         CHAR(2) NOT NULL,
    reason_cancelled            VARCHAR2(30) NOT NULL,
    court_hearing_date          DATE NOT NULL,
    licence_reinstatment_date   DATE NOT NULL,
    licence_no                  VARCHAR2(15) NOT NULL
);

COMMENT ON COLUMN cancellation.date_cancelled IS
    'Licence cancellation date';

COMMENT ON COLUMN cancellation.period_cancellation IS
    'Period for which the licence remains cancelled(in months)';

COMMENT ON COLUMN cancellation.reason_cancelled IS
    'Reason for the cancellation of the licence';

COMMENT ON COLUMN cancellation.court_hearing_date IS
    'Court hearing date';

COMMENT ON COLUMN cancellation.licence_reinstatment_date IS
    'Date on which licence will be reinstated';

COMMENT ON COLUMN cancellation.licence_no IS
    'Licence number of the driver';

ALTER TABLE cancellation ADD CONSTRAINT cancellation_pk PRIMARY KEY ( date_cancelled,
                                                                      licence_no );

CREATE TABLE demerit (
    demerit_code          VARCHAR2(5) NOT NULL,
    demerit_points        NUMBER(2),
    demerit_description   VARCHAR2(25)
);

COMMENT ON COLUMN demerit.demerit_code IS
    'Demerit code';

COMMENT ON COLUMN demerit.demerit_points IS
    'Points for the  demerit';

COMMENT ON COLUMN demerit.demerit_description IS
    'Description of the demerit';

ALTER TABLE demerit ADD CONSTRAINT demerit_pk PRIMARY KEY ( demerit_code );

CREATE TABLE driver (
    licence_no       VARCHAR2(15) NOT NULL,
    licence_status   CHAR(10) NOT NULL,
    d_fname          CHAR(20) NOT NULL,
    d_lname          CHAR(20) NOT NULL,
    date_of_birth    DATE NOT NULL,
    licence_expiry   DATE NOT NULL,
    add_street       VARCHAR2(20) NOT NULL,
    add_town         VARCHAR2(20) NOT NULL,
    add_postcode     NUMBER(4) NOT NULL
);

COMMENT ON COLUMN driver.licence_no IS
    'Licence number of the driver';

COMMENT ON COLUMN driver.licence_status IS
    'Status of the licence(Active or Cancelled)';

COMMENT ON COLUMN driver.d_fname IS
    'Driver''s first name';

COMMENT ON COLUMN driver.d_lname IS
    'Driver''s last name';

COMMENT ON COLUMN driver.date_of_birth IS
    'Driver''s date of birth';

COMMENT ON COLUMN driver.licence_expiry IS
    'Licence expiry date';

COMMENT ON COLUMN driver.add_street IS
    'Address: Street';

COMMENT ON COLUMN driver.add_town IS
    'Address: Town';

COMMENT ON COLUMN driver.add_postcode IS
    'Address: Postcode';

ALTER TABLE driver ADD CONSTRAINT driver_pk PRIMARY KEY ( licence_no );

CREATE TABLE engine (
    engine_type   VARCHAR2(10) NOT NULL,
    model_id      CHAR(5) NOT NULL
);

ALTER TABLE engine
    ADD CONSTRAINT chk_engine_type CHECK ( engine_type IN (
        'Diesel',
        'Electric',
        'Gas',
        'Petrol'
    ) );

COMMENT ON COLUMN engine.engine_type IS
    'Type of engine(Petrol, Gas, Diesel, Electric)';

COMMENT ON COLUMN engine.model_id IS
    'Model ID(Surrogate key)';

ALTER TABLE engine ADD CONSTRAINT engine_pk PRIMARY KEY ( engine_type,
                                                          model_id );

CREATE TABLE licence_type (
    licence_type_held   VARCHAR2(25) NOT NULL,
    licence_no          VARCHAR2(15) NOT NULL
);

ALTER TABLE licence_type
    ADD CONSTRAINT chk_licence_type_held CHECK ( licence_type_held IN (
        'Car',
        'Heavy combination Truck',
        'Heavy rigid Truck',
        'Light rigid Truck',
        'Marine',
        'Medium rigid Truck',
        'Motorcycle',
        'Multi combination Truck',
        'Tractor'
    ) );

COMMENT ON COLUMN licence_type.licence_type_held IS
    'Types of licence held by the driver ';

COMMENT ON COLUMN licence_type.licence_no IS
    'Licence number of the driver';

ALTER TABLE licence_type ADD CONSTRAINT licence_type_pk PRIMARY KEY ( licence_type_held,
                                                                      licence_no );

CREATE TABLE manufacturer (
    man_code      CHAR(5) NOT NULL,
    man_name      CHAR(10) NOT NULL,
    man_country   CHAR(15) NOT NULL,
    iso_code      CHAR(5) NOT NULL
);

COMMENT ON COLUMN manufacturer.man_code IS
    'Manufacturer code';

COMMENT ON COLUMN manufacturer.man_name IS
    'Manufacturer name';

COMMENT ON COLUMN manufacturer.man_country IS
    'Country in which the manufacturer is based';

COMMENT ON COLUMN manufacturer.iso_code IS
    'ISO 3166 Alpha-3 code';

ALTER TABLE manufacturer ADD CONSTRAINT manufacturer_pk PRIMARY KEY ( man_code );

CREATE TABLE model (
    model_id             CHAR(5) NOT NULL,
    model_name           VARCHAR2(20) NOT NULL,
    engine_size          CHAR(5) NOT NULL,
    transmission         VARCHAR2(10) NOT NULL,
    ground_clearancel    CHAR(5) NOT NULL,
    ground_clearanceul   CHAR(5) NOT NULL,
    man_code             CHAR(5) NOT NULL
);

ALTER TABLE model
    ADD CONSTRAINT chk_transmission CHECK ( transmission IN (
        'Automatic',
        'Manual'
    ) );

COMMENT ON COLUMN model.model_id IS
    'Model ID(Surrogate key)';

COMMENT ON COLUMN model.model_name IS
    'Model name';

COMMENT ON COLUMN model.engine_size IS
    'Size of the engine';

COMMENT ON COLUMN model.transmission IS
    'Transmission - Manual or Automatic';

COMMENT ON COLUMN model.ground_clearancel IS
    'Ground Clearance : Laden';

COMMENT ON COLUMN model.ground_clearanceul IS
    'Ground clearance : Unladen';

COMMENT ON COLUMN model.man_code IS
    'Manufacturer code';

ALTER TABLE model ADD CONSTRAINT model_pk PRIMARY KEY ( model_id );

ALTER TABLE model ADD CONSTRAINT key_2 UNIQUE ( model_name );

ALTER TABLE model ADD CONSTRAINT model_name UNIQUE ( model_name );

CREATE TABLE offence (
    offence_no         VARCHAR2(5) NOT NULL,
    offence_date       DATE NOT NULL,
    offence_location   VARCHAR2(25) NOT NULL,
    offence_time       DATE NOT NULL,
    demerit_code       VARCHAR2(5) NOT NULL,
    licence_no         VARCHAR2(15) NOT NULL,
    vehicle_vin        CHAR(17) NOT NULL,
    officer_id         VARCHAR2(8) NOT NULL
);

COMMENT ON COLUMN offence.offence_no IS
    'Offence number';

COMMENT ON COLUMN offence.offence_time IS
    'Time at which offence is committed';

COMMENT ON COLUMN offence.demerit_code IS
    'Demerit code';

COMMENT ON COLUMN offence.licence_no IS
    'Licence number of the driver';

COMMENT ON COLUMN offence.vehicle_vin IS
    'Vehicle Identification Number';

COMMENT ON COLUMN offence.officer_id IS
    'Officer ID';

CREATE UNIQUE INDEX offence__idx ON
    offence (
        demerit_code
    ASC );

ALTER TABLE offence ADD CONSTRAINT offence_pk PRIMARY KEY ( offence_no );

CREATE TABLE officer (
    officer_id      VARCHAR2(8) NOT NULL,
    officer_fname   VARCHAR2(15) NOT NULL,
    officer_lname   VARCHAR2(15) NOT NULL,
    officer_rank    VARCHAR2(15) NOT NULL,
    st_no           VARCHAR2(5)
);

COMMENT ON COLUMN officer.officer_id IS
    'Officer ID';

COMMENT ON COLUMN officer.officer_fname IS
    'Officer''s first name';

COMMENT ON COLUMN officer.officer_lname IS
    'Officer''s last name';

COMMENT ON COLUMN officer.officer_rank IS
    'Officer''s rank';

COMMENT ON COLUMN officer.st_no IS
    'Station number';

CREATE UNIQUE INDEX officer__idx ON
    officer (
        st_no
    ASC );

ALTER TABLE officer ADD CONSTRAINT officer_pk PRIMARY KEY ( officer_id );

CREATE TABLE registration (
    reg_no        VARCHAR2(10) NOT NULL,
    dereg_date    DATE,
    vehicle_vin   CHAR(17) NOT NULL
);

COMMENT ON COLUMN registration.reg_no IS
    'Registration number';

COMMENT ON COLUMN registration.vehicle_vin IS
    'Vehicle Identification Number';

ALTER TABLE registration ADD CONSTRAINT registration_pk PRIMARY KEY ( reg_no );

CREATE TABLE registration_start (
    reg_no     VARCHAR2(10) NOT NULL,
    reg_date   DATE NOT NULL
);

COMMENT ON COLUMN registration_start.reg_no IS
    'Registration number';

COMMENT ON COLUMN registration_start.reg_date IS
    'Registration date';

ALTER TABLE registration_start ADD CONSTRAINT registration_pkv1 PRIMARY KEY ( reg_no );

CREATE TABLE station (
    st_no        VARCHAR2(5) NOT NULL,
    st_address   VARCHAR2(25) NOT NULL,
    st_phone     CHAR(12) NOT NULL,
    st_timings   CHAR(1) NOT NULL
);

ALTER TABLE station
    ADD CONSTRAINT chk_st_timings CHECK ( st_timings IN (
        'N',
        'Y'
    ) );

COMMENT ON COLUMN station.st_no IS
    'Station number';

COMMENT ON COLUMN station.st_address IS
    'Station''s address';

COMMENT ON COLUMN station.st_phone IS
    'Station''s phone number';

COMMENT ON COLUMN station.st_timings IS
    'Station timings(open 24hrs or not)';

ALTER TABLE station ADD CONSTRAINT station_pk PRIMARY KEY ( st_no );

CREATE TABLE suspension (
    licence_no         VARCHAR2(15) NOT NULL,
    suspension_start   DATE NOT NULL
);

COMMENT ON COLUMN suspension.licence_no IS
    'Licence number of the driver';

COMMENT ON COLUMN suspension.suspension_start IS
    'Date on which suspension started';

ALTER TABLE suspension ADD CONSTRAINT suspension_pk PRIMARY KEY ( licence_no,
                                                                  suspension_start );

CREATE TABLE suspension_period (
    suspension_start   DATE NOT NULL,
    suspension_end     DATE NOT NULL
);

COMMENT ON COLUMN suspension_period.suspension_start IS
    'Date on which suspension started';

COMMENT ON COLUMN suspension_period.suspension_end IS
    'Date on which the suspension ended';

ALTER TABLE suspension_period ADD CONSTRAINT suspension_pkv1 PRIMARY KEY ( suspension_start );

CREATE TABLE vehicle (
    vehicle_vin      CHAR(17) NOT NULL,
    vehicle_type     VARCHAR2(25) NOT NULL,
    man_yr           CHAR(4) NOT NULL,
    vehicle_colour   CHAR(10),
    model_id         CHAR(5) NOT NULL
);

ALTER TABLE vehicle
    ADD CONSTRAINT chk_vehicle_type CHECK ( vehicle_type IN (
        'Car',
        'Heavy combination Truck',
        'Heavy rigid Truck',
        'Light rigid Truck',
        'Marine',
        'Medium rigid Truck',
        'Motorcycle',
        'Multi combination Truck',
        'Tractor'
    ) );

COMMENT ON COLUMN vehicle.vehicle_vin IS
    'Vehicle Identification Number';

COMMENT ON COLUMN vehicle.vehicle_type IS
    'Type of Vehicle';

COMMENT ON COLUMN vehicle.man_yr IS
    'Year of Manufacture';

COMMENT ON COLUMN vehicle.vehicle_colour IS
    'Main colour of the vehicle';

COMMENT ON COLUMN vehicle.model_id IS
    'Model ID(Surrogate key)';

CREATE UNIQUE INDEX vehicle__idx ON
    vehicle (
        model_id
    ASC );

ALTER TABLE vehicle ADD CONSTRAINT vehicle_pk PRIMARY KEY ( vehicle_vin );

ALTER TABLE offence
    ADD CONSTRAINT demerit_offence FOREIGN KEY ( demerit_code )
        REFERENCES demerit ( demerit_code );

ALTER TABLE cancellation
    ADD CONSTRAINT driver_cancellation FOREIGN KEY ( licence_no )
        REFERENCES driver ( licence_no );

ALTER TABLE licence_type
    ADD CONSTRAINT driver_licence_type FOREIGN KEY ( licence_no )
        REFERENCES driver ( licence_no );

ALTER TABLE offence
    ADD CONSTRAINT driver_offence FOREIGN KEY ( licence_no )
        REFERENCES driver ( licence_no );

ALTER TABLE suspension
    ADD CONSTRAINT driver_suspension FOREIGN KEY ( licence_no )
        REFERENCES driver ( licence_no );

ALTER TABLE engine
    ADD CONSTRAINT model_engine FOREIGN KEY ( model_id )
        REFERENCES model ( model_id );

ALTER TABLE model
    ADD CONSTRAINT model_manufacturer FOREIGN KEY ( man_code )
        REFERENCES manufacturer ( man_code );

ALTER TABLE vehicle
    ADD CONSTRAINT model_vehicle FOREIGN KEY ( model_id )
        REFERENCES model ( model_id );

ALTER TABLE allocation
    ADD CONSTRAINT offficer_allocation FOREIGN KEY ( officer_id )
        REFERENCES officer ( officer_id );

ALTER TABLE offence
    ADD CONSTRAINT officer_offence FOREIGN KEY ( officer_id )
        REFERENCES officer ( officer_id );

ALTER TABLE officer
    ADD CONSTRAINT officer_station FOREIGN KEY ( st_no )
        REFERENCES station ( st_no );

ALTER TABLE registration
    ADD CONSTRAINT regstart_registration FOREIGN KEY ( reg_no )
        REFERENCES registration_start ( reg_no );

ALTER TABLE allocation
    ADD CONSTRAINT station_allocation FOREIGN KEY ( st_no )
        REFERENCES station ( st_no );

ALTER TABLE suspension
    ADD CONSTRAINT suspension_suspension_period FOREIGN KEY ( suspension_start )
        REFERENCES suspension_period ( suspension_start );

ALTER TABLE offence
    ADD CONSTRAINT vehicle_offence FOREIGN KEY ( vehicle_vin )
        REFERENCES vehicle ( vehicle_vin );

ALTER TABLE registration
    ADD CONSTRAINT vehicle_registration FOREIGN KEY ( vehicle_vin )
        REFERENCES vehicle ( vehicle_vin );
SET echo OFF;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            16
-- CREATE INDEX                             3
-- ALTER TABLE                             39
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
