build:
	uv pip install --system -r requirements.txt

clean:
	cd dbt && dbt clean && dbt deps

eval:
	cd dbt && dbt build --selector eval

init:
	bash scripts/modify_language_config.sh

lint:
	sqlfmt dbt
	cd dbt && sqlfluff lint .

load:
	cd dlt && python3 jaffle_pipelines.py

query:
	harlequin "duckdb/raw_data.duckdb" "duckdb/analytics.duckdb"

run: init clean load xform query

xform:
	cd dbt && dbt build
