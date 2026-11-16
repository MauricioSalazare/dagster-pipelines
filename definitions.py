from dagster import AssetExecutionContext, Definitions, asset


@asset
def hello(context: AssetExecutionContext) -> None:
    context.log.info("hello from my own image")


defs = Definitions(assets=[hello])
