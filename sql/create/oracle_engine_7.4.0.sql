create table ACT_GE_PROPERTY (
    NAME_ NVARCHAR2(64),
    VALUE_ NVARCHAR2(300),
    REV_ INTEGER,
    primary key (NAME_)
);

insert into ACT_GE_PROPERTY
values ('schema.version', 'fox', 1);

insert into ACT_GE_PROPERTY
values ('schema.history', 'create(fox)', 1);

insert into ACT_GE_PROPERTY
values ('next.dbid', '1', 1);

insert into ACT_GE_PROPERTY
values ('deployment.lock', '0', 1);

create table ACT_GE_BYTEARRAY (
    ID_ NVARCHAR2(64),
    REV_ INTEGER,
    NAME_ NVARCHAR2(255),
    DEPLOYMENT_ID_ NVARCHAR2(64),
    BYTES_ BLOB,
    GENERATED_ NUMBER(1,0) CHECK (GENERATED_ IN (1,0)),
    primary key (ID_)
);

create table ACT_RE_DEPLOYMENT (
    ID_ NVARCHAR2(64),
    NAME_ NVARCHAR2(255),
    DEPLOY_TIME_ TIMESTAMP(6),
    SOURCE_ NVARCHAR2(255),
    primary key (ID_)
);

create table ACT_RU_EXECUTION (
    ID_ NVARCHAR2(64),
    REV_ INTEGER,
    PROC_INST_ID_ NVARCHAR2(64),
    BUSINESS_KEY_ NVARCHAR2(255),
    PARENT_ID_ NVARCHAR2(64),
    PROC_DEF_ID_ NVARCHAR2(64),
    SUPER_EXEC_ NVARCHAR2(64),
    SUPER_CASE_EXEC_ NVARCHAR2(64),
    CASE_INST_ID_ NVARCHAR2(64),
    ACT_ID_ NVARCHAR2(255),
    ACT_INST_ID_ NVARCHAR2(64),
    IS_ACTIVE_ NUMBER(1,0) CHECK (IS_ACTIVE_ IN (1,0)),
    IS_CONCURRENT_ NUMBER(1,0) CHECK (IS_CONCURRENT_ IN (1,0)),
    IS_SCOPE_ NUMBER(1,0) CHECK (IS_SCOPE_ IN (1,0)),
    IS_EVENT_SCOPE_ NUMBER(1,0) CHECK (IS_EVENT_SCOPE_ IN (1,0)),
    SUSPENSION_STATE_ INTEGER,
    CACHED_ENT_STATE_ INTEGER,
    SEQUENCE_COUNTER_ NUMBER(19,0),
    primary key (ID_)
);

create table ACT_RU_JOB (
    ID_ NVARCHAR2(64) NOT NULL,
    REV_ INTEGER,
    TYPE_ NVARCHAR2(255) NOT NULL,
    LOCK_EXP_TIME_ TIMESTAMP(6),
    LOCK_OWNER_ NVARCHAR2(255),
    EXCLUSIVE_ NUMBER(1,0) CHECK (EXCLUSIVE_ IN (1,0)),
    EXECUTION_ID_ NVARCHAR2(64),
    PROCESS_INSTANCE_ID_ NVARCHAR2(64),
    PROCESS_DEF_ID_ NVARCHAR2(64),
    PROCESS_DEF_KEY_ NVARCHAR2(64),
    RETRIES_ INTEGER,
    EXCEPTION_STACK_ID_ NVARCHAR2(64),
    EXCEPTION_MSG_ NVARCHAR2(2000),
    DUEDATE_ TIMESTAMP(6),
    REPEAT_ NVARCHAR2(255),
    HANDLER_TYPE_ NVARCHAR2(255),
    HANDLER_CFG_ NVARCHAR2(2000),
    DEPLOYMENT_ID_ NVARCHAR2(64),
    SUSPENSION_STATE_ INTEGER DEFAULT 1 NOT NULL,
    JOB_DEF_ID_ NVARCHAR2(64),
    PRIORITY_ NUMBER(19,0) DEFAULT 0 NOT NULL,
    SEQUENCE_COUNTER_ NUMBER(19,0),
    primary key (ID_)
);

create table ACT_RU_JOBDEF (
    ID_ NVARCHAR2(64) NOT NULL,
    REV_ INTEGER,
    PROC_DEF_ID_ NVARCHAR2(64) NOT NULL,
    PROC_DEF_KEY_ NVARCHAR2(255) NOT NULL,
    ACT_ID_ NVARCHAR2(255) NOT NULL,
    JOB_TYPE_ NVARCHAR2(255) NOT NULL,
    JOB_CONFIGURATION_ NVARCHAR2(255),
    SUSPENSION_STATE_ INTEGER,
    JOB_PRIORITY_ NUMBER(19,0),
    primary key (ID_)
);

create table ACT_RE_PROCDEF (
    ID_ NVARCHAR2(64) NOT NULL,
    REV_ INTEGER,
    CATEGORY_ NVARCHAR2(255),
    NAME_ NVARCHAR2(255),
    KEY_ NVARCHAR2(255) NOT NULL,
    VERSION_ INTEGER NOT NULL,
    DEPLOYMENT_ID_ NVARCHAR2(64),
    RESOURCE_NAME_ NVARCHAR2(2000),
    DGRM_RESOURCE_NAME_ NVARCHAR2(2000),
    HAS_START_FORM_KEY_ NUMBER(1,0) CHECK (HAS_START_FORM_KEY_ IN (1,0)),
    SUSPENSION_STATE_ INTEGER,
    primary key (ID_)
);

create table ACT_RU_TASK (
    ID_ NVARCHAR2(64),
    REV_ INTEGER,
    EXECUTION_ID_ NVARCHAR2(64),
    PROC_INST_ID_ NVARCHAR2(64),
    PROC_DEF_ID_ NVARCHAR2(64),
    CASE_EXECUTION_ID_ NVARCHAR2(64),
    CASE_INST_ID_ NVARCHAR2(64),
    CASE_DEF_ID_ NVARCHAR2(64),
    NAME_ NVARCHAR2(255),
    PARENT_TASK_ID_ NVARCHAR2(64),
    DESCRIPTION_ NVARCHAR2(2000),
    TASK_DEF_KEY_ NVARCHAR2(255),
    OWNER_ NVARCHAR2(255),
    ASSIGNEE_ NVARCHAR2(255),
    DELEGATION_ NVARCHAR2(64),
    PRIORITY_ INTEGER,
    CREATE_TIME_ TIMESTAMP(6),
    DUE_DATE_ TIMESTAMP(6),
    FOLLOW_UP_DATE_ TIMESTAMP(6),
    SUSPENSION_STATE_ INTEGER,
    primary key (ID_)
);

create table ACT_RU_IDENTITYLINK (
    ID_ NVARCHAR2(64),
    REV_ INTEGER,
    GROUP_ID_ NVARCHAR2(255),
    TYPE_ NVARCHAR2(255),
    USER_ID_ NVARCHAR2(255),
    TASK_ID_ NVARCHAR2(64),
    PROC_DEF_ID_ NVARCHAR2(64),
    primary key (ID_)
);

create table ACT_RU_VARIABLE (
    ID_ NVARCHAR2(64) not null,
    REV_ INTEGER,
    TYPE_ NVARCHAR2(255) not null,
    NAME_ NVARCHAR2(255) not null,
    EXECUTION_ID_ NVARCHAR2(64),
    PROC_INST_ID_ NVARCHAR2(64),
    CASE_EXECUTION_ID_ NVARCHAR2(64),
    CASE_INST_ID_ NVARCHAR2(64),
    TASK_ID_ NVARCHAR2(64),
    BYTEARRAY_ID_ NVARCHAR2(64),
    DOUBLE_ NUMBER(*,10),
    LONG_ NUMBER(19,0),
    TEXT_ NVARCHAR2(2000),
    TEXT2_ NVARCHAR2(2000),
    VAR_SCOPE_ NVARCHAR2(64) not null,
    SEQUENCE_COUNTER_ NUMBER(19,0),
    IS_CONCURRENT_LOCAL_ NUMBER(1,0) CHECK (IS_CONCURRENT_LOCAL_ IN (1,0)),
    primary key (ID_)
);

create table ACT_RU_EVENT_SUBSCR (
    ID_ NVARCHAR2(64) not null,
    REV_ integer,
    EVENT_TYPE_ NVARCHAR2(255) not null,
    EVENT_NAME_ NVARCHAR2(255),
    EXECUTION_ID_ NVARCHAR2(64),
    PROC_INST_ID_ NVARCHAR2(64),
    ACTIVITY_ID_ NVARCHAR2(64),
    CONFIGURATION_ NVARCHAR2(255),
    CREATED_ TIMESTAMP(6) not null,
    primary key (ID_)
);

create table ACT_RU_INCIDENT (
  ID_ NVARCHAR2(64) not null,
  REV_ integer not null,
  INCIDENT_TIMESTAMP_ TIMESTAMP(6) not null,
  INCIDENT_MSG_ NVARCHAR2(2000),
  INCIDENT_TYPE_ NVARCHAR2(255) not null,
  EXECUTION_ID_ NVARCHAR2(64),
  ACTIVITY_ID_ NVARCHAR2(255),
  PROC_INST_ID_ NVARCHAR2(64),
  PROC_DEF_ID_ NVARCHAR2(64),
  CAUSE_INCIDENT_ID_ NVARCHAR2(64),
  ROOT_CAUSE_INCIDENT_ID_ NVARCHAR2(64),
  CONFIGURATION_ NVARCHAR2(255),
  primary key (ID_)
);

create table ACT_RU_AUTHORIZATION (
  ID_ NVARCHAR2(64) not null,
  REV_ integer not null,
  TYPE_ integer not null,
  GROUP_ID_ NVARCHAR2(255),
  USER_ID_ NVARCHAR2(255),
  RESOURCE_TYPE_ integer not null,
  RESOURCE_ID_ NVARCHAR2(64),
  PERMS_ integer,
  primary key (ID_)
);

create table ACT_RU_FILTER (
  ID_ NVARCHAR2(64) not null,
  REV_ integer not null,
  RESOURCE_TYPE_ NVARCHAR2(255) not null,
  NAME_ NVARCHAR2(255) not null,
  OWNER_ NVARCHAR2(255),
  QUERY_ NCLOB not null,
  PROPERTIES_ NCLOB,
  primary key (ID_)
);

create table ACT_RU_METER_LOG (
  ID_ NVARCHAR2(64) not null,
  NAME_ NVARCHAR2(64) not null,
  REPORTER_ NVARCHAR2(255),
  VALUE_ NUMBER(19,0),
  TIMESTAMP_ TIMESTAMP(6) not null,
  primary key (ID_)
);

create table ACT_RU_EXT_TASK (
  ID_ NVARCHAR2(64) not null,
  REV_ integer not null,
  WORKER_ID_ NVARCHAR2(255),
  TOPIC_NAME_ NVARCHAR2(255),
  RETRIES_ INTEGER,
  ERROR_MSG_ NVARCHAR2(2000),
  LOCK_EXP_TIME_ TIMESTAMP(6),
  SUSPENSION_STATE_ integer,
  EXECUTION_ID_ NVARCHAR2(64),
  PROC_INST_ID_ NVARCHAR2(64),
  PROC_DEF_ID_ NVARCHAR2(64),
  PROC_DEF_KEY_ NVARCHAR2(255),
  ACT_ID_ NVARCHAR2(255),
  ACT_INST_ID_ NVARCHAR2(64),
  primary key (ID_)
);

create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION(BUSINESS_KEY_);
create index ACT_IDX_TASK_CREATE on ACT_RU_TASK(CREATE_TIME_);
create index ACT_IDX_TASK_ASSIGNEE on ACT_RU_TASK(ASSIGNEE_);
create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK(USER_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK(GROUP_ID_);
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR(CONFIGURATION_);
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE(TASK_ID_);
create index ACT_IDX_INC_CONFIGURATION on ACT_RU_INCIDENT(CONFIGURATION_);
create index ACT_IDX_JOB_PROCINST on ACT_RU_JOB(PROCESS_INSTANCE_ID_);
create index ACT_IDX_METER_LOG on ACT_RU_METER_LOG(NAME_,TIMESTAMP_);
create index ACT_IDX_EXT_TASK_TOPIC on ACT_RU_EXT_TASK(TOPIC_NAME_);

create index ACT_IDX_BYTEAR_DEPL on ACT_GE_BYTEARRAY(DEPLOYMENT_ID_);

alter table ACT_GE_BYTEARRAY
    add constraint ACT_FK_BYTEARR_DEPL
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);

alter table ACT_RE_PROCDEF
    add constraint ACT_UNIQ_PROCDEF
    unique (KEY_,VERSION_);
    
create index ACT_IDX_EXE_PROCINST on ACT_RU_EXECUTION(PROC_INST_ID_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCINST
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_EXE_PARENT on ACT_RU_EXECUTION(PARENT_ID_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PARENT
    foreign key (PARENT_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_EXE_SUPER on ACT_RU_EXECUTION(SUPER_EXEC_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_SUPER
    foreign key (SUPER_EXEC_) 
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_EXE_PROCDEF on ACT_RU_EXECUTION(PROC_DEF_ID_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);    

create index ACT_IDX_TSKASS_TASK on ACT_RU_IDENTITYLINK(TASK_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_TSKASS_TASK
    foreign key (TASK_ID_) 
    references ACT_RU_TASK (ID_);

create index ACT_IDX_ATHRZ_PROCEDEF  on ACT_RU_IDENTITYLINK(PROC_DEF_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_ATHRZ_PROCEDEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_TASK_EXEC on ACT_RU_TASK(EXECUTION_ID_);
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_TASK_PROCINST on ACT_RU_TASK(PROC_INST_ID_);
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_TASK_PROCDEF on ACT_RU_TASK(PROC_DEF_ID_);
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCDEF
  foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
  
create index ACT_IDX_VAR_EXE on ACT_RU_VARIABLE(EXECUTION_ID_);
alter table ACT_RU_VARIABLE 
    add constraint ACT_FK_VAR_EXE
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_VAR_PROCINST on ACT_RU_VARIABLE(PROC_INST_ID_);
alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION(ID_);

create index ACT_IDX_VAR_BYTEARRAY on ACT_RU_VARIABLE(BYTEARRAY_ID_);
alter table ACT_RU_VARIABLE 
    add constraint ACT_FK_VAR_BYTEARRAY 
    foreign key (BYTEARRAY_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_JOB_EXCEPTION on ACT_RU_JOB(EXCEPTION_STACK_ID_);
alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
create index ACT_IDX_EVENT_SUBSCR on ACT_RU_EVENT_SUBSCR(EXECUTION_ID_);
alter table ACT_RU_EVENT_SUBSCR
    add constraint ACT_FK_EVENT_EXEC
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION(ID_);
    
alter table ACT_RU_INCIDENT
    add constraint ACT_FK_INC_EXE 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
  
alter table ACT_RU_INCIDENT
    add constraint ACT_FK_INC_PROCINST 
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_);

alter table ACT_RU_INCIDENT
    add constraint ACT_FK_INC_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);  
    
alter table ACT_RU_INCIDENT
    add constraint ACT_FK_INC_CAUSE 
    foreign key (CAUSE_INCIDENT_ID_) 
    references ACT_RU_INCIDENT (ID_);

alter table ACT_RU_INCIDENT
    add constraint ACT_FK_INC_RCAUSE 
    foreign key (ROOT_CAUSE_INCIDENT_ID_) 
    references ACT_RU_INCIDENT (ID_); 
    
-- see http://stackoverflow.com/questions/675398/how-can-i-constrain-multiple-columns-to-prevent-duplicates-but-ignore-null-value
create unique index ACT_UNIQ_AUTH_USER on ACT_RU_AUTHORIZATION
   (case when USER_ID_ is null then null else TYPE_ end,
    case when USER_ID_ is null then null else RESOURCE_TYPE_ end,
    case when USER_ID_ is null then null else RESOURCE_ID_ end,
    case when USER_ID_ is null then null else USER_ID_ end);

create unique index ACT_UNIQ_AUTH_GROUP on ACT_RU_AUTHORIZATION
   (case when GROUP_ID_ is null then null else TYPE_ end,
    case when GROUP_ID_ is null then null else RESOURCE_TYPE_ end,
    case when GROUP_ID_ is null then null else RESOURCE_ID_ end,
    case when GROUP_ID_ is null then null else GROUP_ID_ end);

alter table ACT_RU_VARIABLE
    add constraint ACT_UNIQ_VARIABLE
    unique (VAR_SCOPE_, NAME_);

alter table ACT_RU_EXT_TASK
    add constraint ACT_FK_EXT_TASK_EXE 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);

-- indexes for deadlock problems - https://app.camunda.com/jira/browse/CAM-2567 --
create index ACT_IDX_INC_CAUSEINCID on ACT_RU_INCIDENT(CAUSE_INCIDENT_ID_);
create index ACT_IDX_INC_EXID on ACT_RU_INCIDENT(EXECUTION_ID_);
create index ACT_IDX_INC_PROCDEFID on ACT_RU_INCIDENT(PROC_DEF_ID_);
create index ACT_IDX_INC_PROCINSTID on ACT_RU_INCIDENT(PROC_INST_ID_);
create index ACT_IDX_INC_ROOTCAUSEINCID on ACT_RU_INCIDENT(ROOT_CAUSE_INCIDENT_ID_);
-- index for deadlock problem - https://app.camunda.com/jira/browse/CAM-4440 --
create index ACT_IDX_AUTH_RESOURCE_ID on ACT_RU_AUTHORIZATION(RESOURCE_ID_);

-- indexes to improve deployment
create index ACT_IDX_BYTEARRAY_NAME on ACT_GE_BYTEARRAY(NAME_);
create index ACT_IDX_DEPLOYMENT_NAME on ACT_RE_DEPLOYMENT(NAME_);
create index ACT_IDX_JOBDEF_PROC_DEF_ID ON ACT_RU_JOBDEF(PROC_DEF_ID_);
create index ACT_IDX_JOB_HANDLER_TYPE ON ACT_RU_JOB(HANDLER_TYPE_);
create index ACT_IDX_EVENT_SUBSCR_EVT_NAME ON ACT_RU_EVENT_SUBSCR(EVENT_NAME_);
create index ACT_IDX_PROCDEF_DEPLOYMENT_ID ON ACT_RE_PROCDEF(DEPLOYMENT_ID_);
-- create case definition table --

create table ACT_RE_CASE_DEF (
    ID_ NVARCHAR2(64) NOT NULL,
    REV_ INTEGER,
    CATEGORY_ NVARCHAR2(255),
    NAME_ NVARCHAR2(255),
    KEY_ NVARCHAR2(255) NOT NULL,
    VERSION_ INTEGER NOT NULL,
    DEPLOYMENT_ID_ NVARCHAR2(64),
    RESOURCE_NAME_ NVARCHAR2(2000),
    DGRM_RESOURCE_NAME_ NVARCHAR2(2000),
    primary key (ID_)
);

-- create case execution table --

create table ACT_RU_CASE_EXECUTION (
    ID_ NVARCHAR2(64) NOT NULL,
    REV_ INTEGER,
    CASE_INST_ID_ NVARCHAR2(64),
    SUPER_CASE_EXEC_ NVARCHAR2(64),
    SUPER_EXEC_ NVARCHAR2(64),
    BUSINESS_KEY_ NVARCHAR2(255),
    PARENT_ID_ NVARCHAR2(64),
    CASE_DEF_ID_ NVARCHAR2(64),
    ACT_ID_ NVARCHAR2(255),
    PREV_STATE_ INTEGER,
    CURRENT_STATE_ INTEGER,
    REQUIRED_ NUMBER(1,0) CHECK (REQUIRED_ IN (1,0)),
    primary key (ID_)
);

-- create case sentry part table --

create table ACT_RU_CASE_SENTRY_PART (
    ID_ NVARCHAR2(64) NOT NULL,
    REV_ INTEGER,
    CASE_INST_ID_ NVARCHAR2(64),
    CASE_EXEC_ID_ NVARCHAR2(64),
    SENTRY_ID_ NVARCHAR2(255),
    TYPE_ NVARCHAR2(255),
    SOURCE_CASE_EXEC_ID_ NVARCHAR2(64),
    STANDARD_EVENT_ NVARCHAR2(255),
    SOURCE_ NVARCHAR2(255),
    SATISFIED_ NUMBER(1,0) CHECK (SATISFIED_ IN (1,0)),
    primary key (ID_)
);

-- create unique constraint on ACT_RE_CASE_DEF --
alter table ACT_RE_CASE_DEF
    add constraint ACT_UNIQ_CASE_DEF
    unique (KEY_,VERSION_);

-- create index on business key --
create index ACT_IDX_CASE_EXEC_BUSKEY on ACT_RU_CASE_EXECUTION(BUSINESS_KEY_);

-- create foreign key constraints on ACT_RU_CASE_EXECUTION --
create index ACT_IDX_CASE_EXE_CASE_INST on ACT_RU_CASE_EXECUTION(CASE_INST_ID_);
alter table ACT_RU_CASE_EXECUTION
    add constraint ACT_FK_CASE_EXE_CASE_INST
    foreign key (CASE_INST_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

create index ACT_IDX_CASE_EXE_PARENT on ACT_RU_CASE_EXECUTION(PARENT_ID_);
alter table ACT_RU_CASE_EXECUTION
    add constraint ACT_FK_CASE_EXE_PARENT
    foreign key (PARENT_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

create index ACT_IDX_CASE_EXE_CASE_DEF on ACT_RU_CASE_EXECUTION(CASE_DEF_ID_);
alter table ACT_RU_CASE_EXECUTION
    add constraint ACT_FK_CASE_EXE_CASE_DEF
    foreign key (CASE_DEF_ID_)
    references ACT_RE_CASE_DEF(ID_);

-- create foreign key constraints on ACT_RU_VARIABLE --
create index ACT_IDX_VAR_CASE_EXE on ACT_RU_VARIABLE(CASE_EXECUTION_ID_);
alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_CASE_EXE
    foreign key (CASE_EXECUTION_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

create index ACT_IDX_VAR_CASE_INST_ID on ACT_RU_VARIABLE(CASE_INST_ID_);
alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_CASE_INST
    foreign key (CASE_INST_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

-- create foreign key constraints on ACT_RU_TASK --
create index ACT_IDX_TASK_CASE_EXEC on ACT_RU_TASK(CASE_EXECUTION_ID_);
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_CASE_EXE
    foreign key (CASE_EXECUTION_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

create index ACT_IDX_TASK_CASE_DEF_ID on ACT_RU_TASK(CASE_DEF_ID_);
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_CASE_DEF
  foreign key (CASE_DEF_ID_)
  references ACT_RE_CASE_DEF(ID_);

-- create foreign key constraints on ACT_RU_CASE_SENTRY_PART --
create index ACT_IDX_CASE_SENTRY_CASE_INST on ACT_RU_CASE_SENTRY_PART(CASE_INST_ID_);
alter table ACT_RU_CASE_SENTRY_PART
    add constraint ACT_FK_CASE_SENTRY_CASE_INST
    foreign key (CASE_INST_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

create index ACT_IDX_CASE_SENTRY_CASE_EXEC on ACT_RU_CASE_SENTRY_PART(CASE_EXEC_ID_);
alter table ACT_RU_CASE_SENTRY_PART
    add constraint ACT_FK_CASE_SENTRY_CASE_EXEC
    foreign key (CASE_EXEC_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);
-- create decision definition table --
create table ACT_RE_DECISION_DEF (
    ID_ NVARCHAR2(64) NOT NULL,
    REV_ INTEGER,
    CATEGORY_ NVARCHAR2(255),
    NAME_ NVARCHAR2(255),
    KEY_ NVARCHAR2(255) NOT NULL,
    VERSION_ INTEGER NOT NULL,
    DEPLOYMENT_ID_ NVARCHAR2(64),
    RESOURCE_NAME_ NVARCHAR2(2000),
    DGRM_RESOURCE_NAME_ NVARCHAR2(2000),
    primary key (ID_)
);
-- create unique constraint on ACT_RE_DECISION_DEF --
alter table ACT_RE_DECISION_DEF
    add constraint ACT_UNIQ_DECISION_DEF
    unique (KEY_,VERSION_);
create table ACT_HI_PROCINST (
    ID_ NVARCHAR2(64) not null,
    PROC_INST_ID_ NVARCHAR2(64) not null,
    BUSINESS_KEY_ NVARCHAR2(255),
    PROC_DEF_KEY_ NVARCHAR2(255),
    PROC_DEF_ID_ NVARCHAR2(64) not null,
    START_TIME_ TIMESTAMP(6) not null,
    END_TIME_ TIMESTAMP(6),
    DURATION_ NUMBER(19,0),
    START_USER_ID_ NVARCHAR2(255),
    START_ACT_ID_ NVARCHAR2(255),
    END_ACT_ID_ NVARCHAR2(255),
    SUPER_PROCESS_INSTANCE_ID_ NVARCHAR2(64),
    SUPER_CASE_INSTANCE_ID_ NVARCHAR2(64),
    CASE_INST_ID_ NVARCHAR2(64),
    DELETE_REASON_ NVARCHAR2(2000),
    primary key (ID_),
    unique (PROC_INST_ID_)
);

create table ACT_HI_ACTINST (
    ID_ NVARCHAR2(64) not null,
    PARENT_ACT_INST_ID_ NVARCHAR2(64),
    PROC_DEF_KEY_ NVARCHAR2(255),
    PROC_DEF_ID_ NVARCHAR2(64) not null,
    PROC_INST_ID_ NVARCHAR2(64) not null,
    EXECUTION_ID_ NVARCHAR2(64) not null,
    ACT_ID_ NVARCHAR2(255) not null,
    TASK_ID_ NVARCHAR2(64),
    CALL_PROC_INST_ID_ NVARCHAR2(64),
    CALL_CASE_INST_ID_ NVARCHAR2(64),
    ACT_NAME_ NVARCHAR2(255),
    ACT_TYPE_ NVARCHAR2(255) not null,
    ASSIGNEE_ NVARCHAR2(64),
    START_TIME_ TIMESTAMP(6) not null,
    END_TIME_ TIMESTAMP(6),
    DURATION_ NUMBER(19,0),
    ACT_INST_STATE_ INTEGER,
    SEQUENCE_COUNTER_ NUMBER(19,0),
    primary key (ID_)
);

create table ACT_HI_TASKINST (
    ID_ NVARCHAR2(64) not null,
    TASK_DEF_KEY_ NVARCHAR2(255),
    PROC_DEF_KEY_ NVARCHAR2(255),
    PROC_DEF_ID_ NVARCHAR2(64),
    PROC_INST_ID_ NVARCHAR2(64),
    EXECUTION_ID_ NVARCHAR2(64),
    CASE_DEF_KEY_ NVARCHAR2(255),
    CASE_DEF_ID_ NVARCHAR2(64),
    CASE_INST_ID_ NVARCHAR2(64),
    CASE_EXECUTION_ID_ NVARCHAR2(64),
    ACT_INST_ID_ NVARCHAR2(64),
    PARENT_TASK_ID_ NVARCHAR2(64),
    NAME_ NVARCHAR2(255),
    DESCRIPTION_ NVARCHAR2(2000),
    OWNER_ NVARCHAR2(255),
    ASSIGNEE_ NVARCHAR2(255),
    START_TIME_ TIMESTAMP(6) not null,
    END_TIME_ TIMESTAMP(6),
    DURATION_ NUMBER(19,0),
    DELETE_REASON_ NVARCHAR2(2000),
    PRIORITY_ INTEGER,
    DUE_DATE_ TIMESTAMP(6),
    FOLLOW_UP_DATE_ TIMESTAMP(6),
    primary key (ID_)
);

create table ACT_HI_VARINST (
    ID_ NVARCHAR2(64) not null,
    PROC_DEF_KEY_ NVARCHAR2(255),
    PROC_DEF_ID_ NVARCHAR2(64),
    PROC_INST_ID_ NVARCHAR2(64),
    EXECUTION_ID_ NVARCHAR2(64),
    ACT_INST_ID_ NVARCHAR2(64),
    CASE_DEF_KEY_ NVARCHAR2(255),
    CASE_DEF_ID_ NVARCHAR2(64),
    CASE_INST_ID_ NVARCHAR2(64),
    CASE_EXECUTION_ID_ NVARCHAR2(64),
    TASK_ID_ NVARCHAR2(64),
    NAME_ NVARCHAR2(255) not null,
    VAR_TYPE_ NVARCHAR2(100),
    REV_ INTEGER,
    BYTEARRAY_ID_ NVARCHAR2(64),
    DOUBLE_ NUMBER(*,10),
    LONG_ NUMBER(19,0),
    TEXT_ NVARCHAR2(2000),
    TEXT2_ NVARCHAR2(2000),
    primary key (ID_)
);

create table ACT_HI_DETAIL (
    ID_ NVARCHAR2(64) not null,
    TYPE_ NVARCHAR2(255) not null,
    PROC_DEF_KEY_ NVARCHAR2(255),
    PROC_DEF_ID_ NVARCHAR2(64),
    PROC_INST_ID_ NVARCHAR2(64),
    EXECUTION_ID_ NVARCHAR2(64),
    CASE_DEF_KEY_ NVARCHAR2(255),
    CASE_DEF_ID_ NVARCHAR2(64),
    CASE_INST_ID_ NVARCHAR2(64),
    CASE_EXECUTION_ID_ NVARCHAR2(64),
    TASK_ID_ NVARCHAR2(64),
    ACT_INST_ID_ NVARCHAR2(64),
    VAR_INST_ID_ NVARCHAR2(64),
    NAME_ NVARCHAR2(255) not null,
    VAR_TYPE_ NVARCHAR2(64),
    REV_ INTEGER,
    TIME_ TIMESTAMP(6) not null,
    BYTEARRAY_ID_ NVARCHAR2(64),
    DOUBLE_ NUMBER(*,10),
    LONG_ NUMBER(19,0),
    TEXT_ NVARCHAR2(2000),
    TEXT2_ NVARCHAR2(2000),
    SEQUENCE_COUNTER_ NUMBER(19,0),
    primary key (ID_)
);

create table ACT_HI_COMMENT (
    ID_ NVARCHAR2(64) not null,
    TYPE_ NVARCHAR2(255),
    TIME_ TIMESTAMP(6) not null,
    USER_ID_ NVARCHAR2(255),
    TASK_ID_ NVARCHAR2(64),
    PROC_INST_ID_ NVARCHAR2(64),
    ACTION_ NVARCHAR2(255),
    MESSAGE_ NVARCHAR2(2000),
    FULL_MSG_ BLOB,
    primary key (ID_)
);

create table ACT_HI_ATTACHMENT (
    ID_ NVARCHAR2(64) not null,
    REV_ INTEGER,
    USER_ID_ NVARCHAR2(255),
    NAME_ NVARCHAR2(255),
    DESCRIPTION_ NVARCHAR2(2000),
    TYPE_ NVARCHAR2(255),
    TASK_ID_ NVARCHAR2(64),
    PROC_INST_ID_ NVARCHAR2(64),
    URL_ NVARCHAR2(2000),
    CONTENT_ID_ NVARCHAR2(64),
    primary key (ID_)
);

create table ACT_HI_OP_LOG (
    ID_ NVARCHAR2(64) not null,
    DEPLOYMENT_ID_ NVARCHAR2(64),
    PROC_DEF_ID_ NVARCHAR2(64),
    PROC_DEF_KEY_ NVARCHAR2(255),
    PROC_INST_ID_ NVARCHAR2(64),
    EXECUTION_ID_ NVARCHAR2(64),
    CASE_DEF_ID_ NVARCHAR2(64),
    CASE_INST_ID_ NVARCHAR2(64),
    CASE_EXECUTION_ID_ NVARCHAR2(64),
    TASK_ID_ NVARCHAR2(64),
    JOB_ID_ NVARCHAR2(64),
    JOB_DEF_ID_ NVARCHAR2(64),
    USER_ID_ NVARCHAR2(255),
    TIMESTAMP_ TIMESTAMP(6) not null,
    OPERATION_TYPE_ NVARCHAR2(255),
    OPERATION_ID_ NVARCHAR2(64),
    ENTITY_TYPE_ NVARCHAR2(30),
    PROPERTY_ NVARCHAR2(64),
    ORG_VALUE_ NVARCHAR2(2000),
    NEW_VALUE_ NVARCHAR2(2000),
    primary key (ID_)
);

create table ACT_HI_INCIDENT (
  ID_ NVARCHAR2(64) not null,
  PROC_DEF_KEY_ NVARCHAR2(255),
  PROC_DEF_ID_ NVARCHAR2(64),
  PROC_INST_ID_ NVARCHAR2(64),
  EXECUTION_ID_ NVARCHAR2(64),
  CREATE_TIME_ TIMESTAMP(6) not null,
  END_TIME_ TIMESTAMP(6),
  INCIDENT_MSG_ NVARCHAR2(2000),
  INCIDENT_TYPE_ NVARCHAR2(255) not null,
  ACTIVITY_ID_ NVARCHAR2(255),
  CAUSE_INCIDENT_ID_ NVARCHAR2(64),
  ROOT_CAUSE_INCIDENT_ID_ NVARCHAR2(64),
  CONFIGURATION_ NVARCHAR2(255),
  INCIDENT_STATE_ INTEGER,
  primary key (ID_)
);

create table ACT_HI_JOB_LOG (
    ID_ NVARCHAR2(64) not null,
    TIMESTAMP_ TIMESTAMP(6) not null,
    JOB_ID_ NVARCHAR2(64) not null,
    JOB_DUEDATE_ TIMESTAMP(6),
    JOB_RETRIES_ INTEGER,
    JOB_PRIORITY_ NUMBER(19,0) DEFAULT 0 NOT NULL,
    JOB_EXCEPTION_MSG_ NVARCHAR2(2000),
    JOB_EXCEPTION_STACK_ID_ NVARCHAR2(64),
    JOB_STATE_ INTEGER,
    JOB_DEF_ID_ NVARCHAR2(64),
    JOB_DEF_TYPE_ NVARCHAR2(255),
    JOB_DEF_CONFIGURATION_ NVARCHAR2(255),
    ACT_ID_ NVARCHAR2(255),
    EXECUTION_ID_ NVARCHAR2(64),
    PROCESS_INSTANCE_ID_ NVARCHAR2(64),
    PROCESS_DEF_ID_ NVARCHAR2(64),
    PROCESS_DEF_KEY_ NVARCHAR2(255),
    DEPLOYMENT_ID_ NVARCHAR2(64),
    SEQUENCE_COUNTER_ NUMBER(19,0),
    primary key (ID_)
);

create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST(END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST(BUSINESS_KEY_);
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST(START_TIME_);
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST(END_TIME_);
create index ACT_IDX_HI_ACT_INST_COMP on ACT_HI_ACTINST(EXECUTION_ID_, ACT_ID_, END_TIME_, ID_);
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL(PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL(ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_CASE_INST on ACT_HI_DETAIL(CASE_INST_ID_);
create index ACT_IDX_HI_DETAIL_CASE_EXEC on ACT_HI_DETAIL(CASE_EXECUTION_ID_);
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL(TIME_);
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL(NAME_);
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL(TASK_ID_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST(PROC_INST_ID_);
create index ACT_IDX_HI_CASEVAR_CASE_INST on ACT_HI_VARINST(CASE_INST_ID_);
create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST(NAME_, VAR_TYPE_);
create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST(PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_JOB_LOG_PROCINST on ACT_HI_JOB_LOG(PROCESS_INSTANCE_ID_);
create index ACT_IDX_HI_JOB_LOG_PROCDEF on ACT_HI_JOB_LOG(PROCESS_DEF_ID_);
create table ACT_HI_CASEINST (
    ID_ NVARCHAR2(64) not null,
    CASE_INST_ID_ NVARCHAR2(64) not null,
    BUSINESS_KEY_ NVARCHAR2(255),
    CASE_DEF_ID_ NVARCHAR2(64) not null,
    CREATE_TIME_ TIMESTAMP(6) not null,
    CLOSE_TIME_ TIMESTAMP(6),
    DURATION_ NUMBER(19,0),
    STATE_ INTEGER,
    CREATE_USER_ID_ NVARCHAR2(255),
    SUPER_CASE_INSTANCE_ID_ NVARCHAR2(64),
    SUPER_PROCESS_INSTANCE_ID_ NVARCHAR2(64),
    primary key (ID_),
    unique (CASE_INST_ID_)
);

create table ACT_HI_CASEACTINST (
    ID_ NVARCHAR2(64) not null,
    PARENT_ACT_INST_ID_ NVARCHAR2(64),
    CASE_DEF_ID_ NVARCHAR2(64) not null,
    CASE_INST_ID_ NVARCHAR2(64) not null,
    CASE_ACT_ID_ NVARCHAR2(255) not null,
    TASK_ID_ NVARCHAR2(64),
    CALL_PROC_INST_ID_ NVARCHAR2(64),
    CALL_CASE_INST_ID_ NVARCHAR2(64),
    CASE_ACT_NAME_ NVARCHAR2(255),
    CASE_ACT_TYPE_ NVARCHAR2(255),
    CREATE_TIME_ TIMESTAMP(6) not null,
    END_TIME_ TIMESTAMP(6),
    DURATION_ NUMBER(19,0),
    STATE_ INTEGER,
    REQUIRED_ NUMBER(1,0) CHECK (REQUIRED_ IN (1,0)),
    primary key (ID_)
);

create index ACT_IDX_HI_CAS_I_CLOSE on ACT_HI_CASEINST(CLOSE_TIME_);
create index ACT_IDX_HI_CAS_I_BUSKEY on ACT_HI_CASEINST(BUSINESS_KEY_);
create index ACT_IDX_HI_CAS_A_I_CREATE on ACT_HI_CASEACTINST(CREATE_TIME_);
create index ACT_IDX_HI_CAS_A_I_END on ACT_HI_CASEACTINST(END_TIME_);
create index ACT_IDX_HI_CAS_A_I_COMP on ACT_HI_CASEACTINST(CASE_ACT_ID_, END_TIME_, ID_);
-- create history decision instance table --
create table ACT_HI_DECINST (
    ID_ NVARCHAR2(64) NOT NULL,
    DEC_DEF_ID_ NVARCHAR2(64) NOT NULL,
    DEC_DEF_KEY_ NVARCHAR2(255) NOT NULL,
    DEC_DEF_NAME_ NVARCHAR2(255),
    PROC_DEF_KEY_ NVARCHAR2(255),
    PROC_DEF_ID_ NVARCHAR2(64),
    PROC_INST_ID_ NVARCHAR2(64),
    CASE_DEF_KEY_ NVARCHAR2(255),
    CASE_DEF_ID_ NVARCHAR2(64),
    CASE_INST_ID_ NVARCHAR2(64),
    ACT_INST_ID_ NVARCHAR2(64),
    ACT_ID_ NVARCHAR2(255),
    EVAL_TIME_ TIMESTAMP(6) not null,
    COLLECT_VALUE_ NUMBER(*,10),
    primary key (ID_)
);

-- create history decision input table --
create table ACT_HI_DEC_IN (
    ID_ NVARCHAR2(64) NOT NULL,
    DEC_INST_ID_ NVARCHAR2(64) NOT NULL,      
    CLAUSE_ID_ NVARCHAR2(64) NOT NULL,
    CLAUSE_NAME_ NVARCHAR2(255),
    VAR_TYPE_ NVARCHAR2(100),               
    BYTEARRAY_ID_ NVARCHAR2(64),
    DOUBLE_ NUMBER(*,10),
    LONG_ NUMBER(19,0),
    TEXT_ NVARCHAR2(2000),
    TEXT2_ NVARCHAR2(2000),    
    primary key (ID_)
);

-- create history decision output table --
create table ACT_HI_DEC_OUT (
    ID_ NVARCHAR2(64) NOT NULL,
    DEC_INST_ID_ NVARCHAR2(64) NOT NULL,         
    CLAUSE_ID_ NVARCHAR2(64) NOT NULL,
    CLAUSE_NAME_ NVARCHAR2(255),
    RULE_ID_ NVARCHAR2(64) NOT NULL,
    RULE_ORDER_ INTEGER,
    VAR_NAME_ NVARCHAR2(255),
    VAR_TYPE_ NVARCHAR2(100),               
    BYTEARRAY_ID_ NVARCHAR2(64),
    DOUBLE_ NUMBER(*,10),
    LONG_ NUMBER(19,0),
    TEXT_ NVARCHAR2(2000),
    TEXT2_ NVARCHAR2(2000),
    primary key (ID_)
);


create index ACT_IDX_HI_DEC_INST_ID on ACT_HI_DECINST(DEC_DEF_ID_);
create index ACT_IDX_HI_DEC_INST_KEY on ACT_HI_DECINST(DEC_DEF_KEY_);
create index ACT_IDX_HI_DEC_INST_PI on ACT_HI_DECINST(PROC_INST_ID_);
create index ACT_IDX_HI_DEC_INST_CI on ACT_HI_DECINST(CASE_INST_ID_);
create index ACT_IDX_HI_DEC_INST_ACT on ACT_HI_DECINST(ACT_ID_);
create index ACT_IDX_HI_DEC_INST_ACT_INST on ACT_HI_DECINST(ACT_INST_ID_);
create index ACT_IDX_HI_DEC_INST_TIME on ACT_HI_DECINST(EVAL_TIME_);

create index ACT_IDX_HI_DEC_IN_INST on ACT_HI_DEC_IN(DEC_INST_ID_);
create index ACT_IDX_HI_DEC_IN_CLAUSE on ACT_HI_DEC_IN(DEC_INST_ID_, CLAUSE_ID_);

create index ACT_IDX_HI_DEC_OUT_INST on ACT_HI_DEC_OUT(DEC_INST_ID_);
create index ACT_IDX_HI_DEC_OUT_RULE on ACT_HI_DEC_OUT(RULE_ORDER_, CLAUSE_ID_);
