mkdir -p ./airflow
cd airflow
mkdir -p ./dags ./logs ./plugins ./config
cd ..
echo -e "AIRFLOW_UID=$(id -u)" > .env

docker-compose up airflow-init

docker-compose up -d --build