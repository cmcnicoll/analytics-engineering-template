import dlt
import posixpath

from dlt.sources.filesystem import readers

DATA_BUCKET_URL = posixpath.abspath("../jaffle_data/")
SOURCE_NAME = "jaffle_shop"
TABLE_NAMES = [
    "raw_customers",
    "raw_items",
    "raw_orders",
    "raw_products",
    "raw_stores",
    "raw_supplies",
]


def read_csv_with_duckdb(
    bucket_url: str, source_name: str, table_name: str, **duckdb_kwargs
) -> None:
    pipeline = dlt.pipeline(
        pipeline_name=f"{table_name}__read_files",
        destination=dlt.destinations.duckdb("../duckdb/raw_data.duckdb"),
        dataset_name=source_name,
    )

    csv_files = readers(bucket_url, file_glob=f"{table_name}*.csv")
    csv_data = csv_files.read_csv_duckdb(chunk_size=1000, header=True, **duckdb_kwargs)

    load_info = pipeline.run(
        csv_data.with_name(table_name), write_disposition="replace"
    )
    print(load_info)
    print(pipeline.last_trace.last_normalize_info)


if __name__ == "__main__":
    for table_name in TABLE_NAMES:
        read_csv_with_duckdb(DATA_BUCKET_URL, SOURCE_NAME, table_name)
