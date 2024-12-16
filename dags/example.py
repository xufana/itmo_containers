from datetime import datetime
from airflow import DAG
from airflow.operators.dummy import DummyOperator
from airflow.operators.python import PythonOperator

def my_python_task(**kwargs):
    print("Hello from the Python task!")

# Define default arguments for the DAG
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
}

# Instantiate the DAG
dag = DAG(
    'simple_dag',
    default_args=default_args,
    description='A simple example DAG',
    schedule_interval='@daily',
    start_date=datetime(2024, 12, 1),
    catchup=False,
)

# Define tasks
task_start = DummyOperator(
    task_id='start',
    dag=dag,
)

task_python = PythonOperator(
    task_id='run_python_task',
    python_callable=my_python_task,
    dag=dag,
)

# Define task dependencies
task_start >> task_python
