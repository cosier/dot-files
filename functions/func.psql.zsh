function psql_restore_from_file() {
  database=$1
  file=$2
  echo "Restoring [$database] from file: [$file]"
  sleep 2

  psql_kill_connections $database
  psql -c "drop database $database;"
  psql -c "create database $database;"
  psql $database < $file
}

function psql_kill_connections() {
  database=$1
  psql $database -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = '$database' AND pid <> pg_backend_pid();"
}

function psql_os_restore() {
  psql_restore_from_file openstudios_development $1
}

function psql_imoto_restore() {
  psql_restore_from_file imoto_development $1
}
