*** Settings ***
Resource          dbresource.robot

*** Test Cases ***
compare-all-tables-structure
    [Documentation]    对比两个数据库的所有表结构
    ...    参照数据库："mysql,root/6tfc^YHN@10.0.127.14:3306/sodap"
    ...    目标数据库："mysql,root/6tfc^YHN@10.0.127.14:3306/sodap_dev"
    [Tags]    structure    # 表结构
    @{tablesInTargetdb}    listTablesInDb    mysql,root/6tfc^YHN@10.0.127.10:3306/sodap
    ${tablesInTargetdb_str}    join    ${tablesInTargetdb}
    AssertTableStructureBetweenDb    mysql,root/6tfc^YHN@10.0.127.14:3306/sodap    mysql,root/6tfc^YHN@10.0.127.10:3306/sodap    ${tablesInTargetdb_str}
