#QPS Query per second��QPS = Questions(or Queries) / Seconds
#ÿ���ѯ����Queries ��ϵͳ״ֵ̬--�ܲ�ѯ����
increase(mysql_global_status_queries[1m])
increase(mysql_global_status_queries[10s])
#��ִ����䣨�ɿͻ��˷���������
increase(mysql_global_status_questions[1h])
#TPS��Transaction per second��ÿ�������� Com_commit�����ύ����Com_rollback����ع���
sum(mysql_global_status_commands_total{command="rollback"})+sum(mysql_global_status_commands_total{command="commit"})
sum(rate(mysql_global_status_commands_total{command=~"(commit|rollback)"}[5m])) without (command)
#�򿪱���
mysql_global_status_open_tables
#ִ��select��
increase(mysql_global_status_commands_total{command="select"}[1h])
increase(mysql_global_status_commands_total{command="select"}[1m])
increase(mysql_global_status_commands_total{command="delete"}[1h])
increase(mysql_global_status_commands_total{command="insert"}[1h])
increase(mysql_global_status_commands_total{command="update"}[1h])
#Innodb_rows_inserted
increase(mysql_global_status_innodb_row_ops_total{operation="inserted"}[1h])
increase(mysql_global_status_innodb_row_ops_total{operation="deleted"}[1h])
increase(mysql_global_status_innodb_row_ops_total{operation="read"}[1h])
increase(mysql_global_status_innodb_row_ops_total{operation="updated"}[1h])
#��ѯMySQLÿСʱ���ܵ����ֽ���
increase(mysql_global_status_bytes_received[1h])
#�����ֽ���
mysql_global_status_bytes_sent
#�����ͷű�����
mysql_global_status_table_locks_immediate
#��Ҫ�ȴ��ı�����
mysql_global_status_table_locks_waited
#����е���������
increase(mysql_global_status_innodb_row_lock_waits[1h])
mysql_global_status_innodb_row_lock_waits
#��ҳ��
mysql_global_status_buffer_pool_pages{state="dirty"}
#Ҫ����յĻ����ҳ��
mysql_global_status_buffer_pool_page_changes_total{operation="flushed"}
#Innodb д����־�ֽ���
mysql_global_status_innodb_os_log_written
#�����������
1-(mysql_global_status_innodb_buffer_pool_reads/mysql_global_status_innodb_buffer_pool_read_requests)
#����ش�С
mysql_global_variables_innodb_buffer_pool_size
#����ѯ���
mysql_global_variables_long_query_time
mysql_global_status_slow_queries
#���������ռ������������85������
mysql_global_status_max_used_connections/mysql_global_variables_max_connections
#�߳���
mysql_global_status_threads_connected
#���������
mysql_global_variables_max_connections
#����������
mysql_global_variables_max_connections-mysql_global_status_threads_connected
#����ʧ���û���
mysql_global_status_aborted_clients
#���л����
mysql_global_status_buffer_pool_pages{state="free"}
#�����ݷ����Ĵ�СM
sum(mysql_info_schema_table_size/1024/1024) by (schema)
