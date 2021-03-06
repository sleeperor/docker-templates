drop table if exists ACT_RE_DECISION_DEF;
drop index ACT_IDX_CASE_EXEC_BUSKEY on ACT_RU_CASE_EXECUTION;

alter table ACT_RU_CASE_EXECUTION
    drop FOREIGN KEY ACT_FK_CASE_EXE_CASE_INST;

alter table ACT_RU_CASE_EXECUTION
    drop FOREIGN KEY ACT_FK_CASE_EXE_PARENT;

alter table ACT_RU_CASE_EXECUTION
    drop FOREIGN KEY ACT_FK_CASE_EXE_CASE_DEF;

alter table ACT_RU_VARIABLE
    drop FOREIGN KEY ACT_FK_VAR_CASE_EXE;

alter table ACT_RU_VARIABLE
    drop FOREIGN KEY ACT_FK_VAR_CASE_INST;

alter table ACT_RU_TASK
    drop foreign key ACT_FK_TASK_CASE_EXE;

alter table ACT_RU_TASK
    drop foreign key ACT_FK_TASK_CASE_DEF;

alter table ACT_RU_CASE_SENTRY_PART
    drop foreign key ACT_FK_CASE_SENTRY_CASE_INST;

alter table ACT_RU_CASE_SENTRY_PART
    drop foreign key ACT_FK_CASE_SENTRY_CASE_EXEC;

drop table if exists ACT_RE_CASE_DEF;
drop table if exists ACT_RU_CASE_EXECUTION;
drop table if exists ACT_RU_CASE_SENTRY_PART;
drop index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION;
drop index ACT_IDX_TASK_CREATE on ACT_RU_TASK;
drop index ACT_IDX_TASK_ASSIGNEE on ACT_RU_TASK;
drop index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK;
drop index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK;
drop index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE;
drop index ACT_IDX_INC_CONFIGURATION on ACT_RU_INCIDENT;
drop index ACT_IDX_JOB_PROCINST on ACT_RU_JOB;

drop index ACT_IDX_METER_LOG on ACT_RU_METER_LOG;
drop index ACT_IDX_EXT_TASK_TOPIC on ACT_RU_EXT_TASK;

alter table ACT_GE_BYTEARRAY 
    drop FOREIGN KEY ACT_FK_BYTEARR_DEPL;

alter table ACT_RU_EXECUTION
    drop FOREIGN KEY ACT_FK_EXE_PROCINST;

alter table ACT_RU_EXECUTION 
    drop FOREIGN KEY ACT_FK_EXE_PARENT;

alter table ACT_RU_EXECUTION 
    drop FOREIGN KEY ACT_FK_EXE_SUPER;
    
alter table ACT_RU_EXECUTION 
    drop FOREIGN KEY ACT_FK_EXE_PROCDEF;

alter table ACT_RU_IDENTITYLINK
    drop FOREIGN KEY ACT_FK_TSKASS_TASK;

alter table ACT_RU_IDENTITYLINK
    drop FOREIGN KEY ACT_FK_ATHRZ_PROCEDEF;
    
alter table ACT_RU_TASK
	drop FOREIGN KEY ACT_FK_TASK_EXE;

alter table ACT_RU_TASK
	drop FOREIGN KEY ACT_FK_TASK_PROCINST;
	
alter table ACT_RU_TASK
	drop FOREIGN KEY ACT_FK_TASK_PROCDEF;
    
alter table ACT_RU_VARIABLE
    drop FOREIGN KEY ACT_FK_VAR_EXE;
    
alter table ACT_RU_VARIABLE
	drop FOREIGN KEY ACT_FK_VAR_PROCINST;    

alter table ACT_RU_VARIABLE
    drop FOREIGN KEY ACT_FK_VAR_BYTEARRAY;

alter table ACT_RU_JOB
    drop FOREIGN KEY ACT_FK_JOB_EXCEPTION;
    
alter table ACT_RU_EVENT_SUBSCR
    drop FOREIGN KEY ACT_FK_EVENT_EXEC;

alter table ACT_RU_INCIDENT
    drop FOREIGN KEY ACT_FK_INC_EXE; 
  
alter table ACT_RU_INCIDENT
    drop FOREIGN KEY ACT_FK_INC_PROCINST; 

alter table ACT_RU_INCIDENT
    drop FOREIGN KEY ACT_FK_INC_PROCDEF;
    
alter table ACT_RU_INCIDENT
    drop FOREIGN KEY ACT_FK_INC_CAUSE; 

alter table ACT_RU_INCIDENT
    drop FOREIGN KEY ACT_FK_INC_RCAUSE; 
    
alter table ACT_RU_EXT_TASK
    drop FOREIGN KEY ACT_FK_EXT_TASK_EXE;
    
drop index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK;
drop index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR;

-- indexes for deadlock problems - https://app.camunda.com/jira/browse/CAM-2567
drop index ACT_IDX_INC_CAUSEINCID on ACT_RU_INCIDENT;
drop index ACT_IDX_INC_EXID on ACT_RU_INCIDENT;
drop index ACT_IDX_INC_PROCDEFID on ACT_RU_INCIDENT;
drop index ACT_IDX_INC_PROCINSTID on ACT_RU_INCIDENT;
drop index ACT_IDX_INC_ROOTCAUSEINCID on ACT_RU_INCIDENT;
drop index ACT_IDX_AUTH_RESOURCE_ID on ACT_RU_AUTHORIZATION;

drop index ACT_IDX_BYTEARRAY_NAME on ACT_GE_BYTEARRAY;
drop index ACT_IDX_DEPLOYMENT_NAME on ACT_RE_DEPLOYMENT;
drop index ACT_IDX_JOBDEF_PROC_DEF_ID ON ACT_RU_JOBDEF;
drop index ACT_IDX_JOB_HANDLER_TYPE ON ACT_RU_JOB;
drop index ACT_IDX_EVENT_SUBSCR_EVT_NAME ON ACT_RU_EVENT_SUBSCR;
drop index ACT_IDX_PROCDEF_DEPLOYMENT_ID ON ACT_RE_PROCDEF;

drop table if exists ACT_GE_PROPERTY;
drop table if exists ACT_RU_VARIABLE;
drop table if exists ACT_GE_BYTEARRAY;
drop table if exists ACT_RE_DEPLOYMENT;
drop table if exists ACT_RU_IDENTITYLINK;
drop table if exists ACT_RU_TASK;
drop table if exists ACT_RE_PROCDEF;
drop table if exists ACT_RU_EXECUTION;
drop table if exists ACT_RU_JOB;
drop table if exists ACT_RU_JOBDEF;
drop table if exists ACT_RU_EVENT_SUBSCR;
drop table if exists ACT_RU_INCIDENT;
drop table if exists ACT_RU_AUTHORIZATION;
drop table if exists ACT_RU_FILTER;
drop table if exists ACT_RU_METER_LOG;
drop table if exists ACT_RU_EXT_TASK;
drop index ACT_IDX_HI_DEC_INST_ID on ACT_HI_DECINST;
drop index ACT_IDX_HI_DEC_INST_KEY on ACT_HI_DECINST;
drop index ACT_IDX_HI_DEC_INST_PI on ACT_HI_DECINST;
drop index ACT_IDX_HI_DEC_INST_CI on ACT_HI_DECINST;
drop index ACT_IDX_HI_DEC_INST_ACT on ACT_HI_DECINST;
drop index ACT_IDX_HI_DEC_INST_ACT_INST on ACT_HI_DECINST;
drop index ACT_IDX_HI_DEC_INST_TIME on ACT_HI_DECINST;

drop index ACT_IDX_HI_DEC_IN_INST on ACT_HI_DEC_IN;
drop index ACT_IDX_HI_DEC_IN_CLAUSE on ACT_HI_DEC_IN;

drop index ACT_IDX_HI_DEC_OUT_INST on ACT_HI_DEC_OUT;
drop index ACT_IDX_HI_DEC_OUT_RULE on ACT_HI_DEC_OUT;

drop table if exists ACT_HI_DECINST;

drop table if exists ACT_HI_DEC_IN;

drop table if exists ACT_HI_DEC_OUT;
drop index ACT_IDX_HI_CAS_I_CLOSE on ACT_HI_CASEINST;
drop index ACT_IDX_HI_CAS_I_BUSKEY on ACT_HI_CASEINST;
drop index ACT_IDX_HI_CAS_A_I_CREATE on ACT_HI_CASEACTINST;
drop index ACT_IDX_HI_CAS_A_I_END on ACT_HI_CASEACTINST;
drop index ACT_IDX_HI_CAS_A_I_COMP on ACT_HI_CASEACTINST;
drop index ACT_IDX_HI_CAS_A_I_CASEINST on ACT_HI_CASEACTINST;

drop table if exists ACT_HI_CASEINST;
drop table if exists ACT_HI_CASEACTINST;
drop index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST;
drop index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST;
drop index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST;
drop index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST;
drop index ACT_IDX_HI_ACT_INST_COMP on ACT_HI_ACTINST;
drop index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL;
drop index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL;
drop index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL;
drop index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL;
drop index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL;
drop index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST;
drop index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST;
drop index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST;
drop index ACT_IDX_HI_JOB_LOG_PROCINST on ACT_HI_JOB_LOG;
drop index ACT_IDX_HI_JOB_LOG_PROCDEF on ACT_HI_JOB_LOG;

drop table if exists ACT_HI_PROCINST;
drop table if exists ACT_HI_ACTINST;
drop table if exists ACT_HI_VARINST;
drop table if exists ACT_HI_TASKINST;
drop table if exists ACT_HI_DETAIL;
drop table if exists ACT_HI_COMMENT;
drop table if exists ACT_HI_ATTACHMENT;
drop table if exists ACT_HI_OP_LOG;
drop table if exists ACT_HI_INCIDENT;
drop table if exists ACT_HI_JOB_LOG;
