### actual flow
- delete example part at the end of the dbt_project.yml and the example folder in models folder
- write models in models/src
- go to project root folder
- dbt run (raw to staging)
- check on db client .. -> saved to my schema as view
- make dim, fact under models -> for core tables
- write dimension table query under dim (cleanup aas needed)
- write fact table query under fact (incrementally: must use where so as not to add dupes!!!)
- define materialization mode in dbt_project.yml under models. (with +materialized option) : ephemeral mode will not produce views
- dbt compile to check
- dbt run
- to wrap: staging tables were done in view mode, dimensions were done in table, and the facts-incremental
- insert an updated record of an existing user into radata user event to test incremental update
- check: target/compiled has the compiled version of the jinja-incorporated queries
- check: target/run has the append mode output query
- change src tables to ephemeral, drop the views from client and then test run dbt again. -> observe that there are only 3 runs
- staging tables(src) need not be views!
- finally, the dim_user table
- mkdir models/analytics and dbt run
- overview: rawdata -> src -> (staging) -> fact, dim -> (core) -> analytics(joins dim and fact) -> (summary table)

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices