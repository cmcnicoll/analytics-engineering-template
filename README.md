## Analytics Engineering Template

This template helps apply [analytics engineering](https://www.getdbt.com/blog/what-is-analytics-engineering) best practices when working with raw data on your local machine, such as financial statements downloaded as CSV. It can also be used for technical assessments when interviewing for data jobs.

## Prerequisites
- [Docker Desktop](https://www.docker.com/)
- [VS Code](https://code.visualstudio.com/)
- Dev Containers extension (Identifier: `ms-vscode-remote.remote-containers`)
- Create an environment variable `LOCAL_DATA_PATH` for the path to the folder containing the raw data you want to load, transform, and analyze. This folder will be mounted to the dev container.

## Demo
1. Use this template to create a repository.
2. Clone your new repository.
3. Open the repository in VS Code.
4. **Reopen in Container**.
5. Open **View > Terminal**.
6. Run: ```make run```

## Original Inspiration
- [Modern Data Stack in a Box](https://duckdb.org/2022/10/12/modern-data-stack-in-a-box.html)
- [nba-monte-carlo](https://github.com/matsonj/nba-monte-carlo)

## Other Inspirations
- [dbt-labs/jaffle-shop](https://github.com/dbt-labs/jaffle-shop)
- [jwills/nba_monte_carlo](https://github.com/jwills/nba_monte_carlo)
- [l-mds/local-data-stack](https://github.com/l-mds/local-data-stack)

## Tools Used
- [dbt-core](https://github.com/dbt-labs/dbt-core)
- [dbt-duckdb](https://github.com/duckdb/dbt-duckdb)
- [dlt](https://github.com/dlt-hub/dlt)
- [duckdb](https://github.com/duckdb/duckdb)
- [harlequin](https://github.com/tconbeer/harlequin)
- [sqlfluff](https://github.com/sqlfluff/sqlfluff)
- [sqlfmt](https://github.com/tconbeer/sqlfmt)
- [vscode-dbt-power-user](https://github.com/AltimateAI/vscode-dbt-power-user)
