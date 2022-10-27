# apex-logs-salesforce

This is a tool for logging in Apex code. It is different than other examples because it logs to an external source,
as opposed to creating logs within Salesforce. The reason for this is that Salesforce storage is expensive, and it can be
a lot of work to build out functionality that is standard in external tools like Azure.

There is an external implementation using .NET and Azure found here: https://github.com/ScottGibson5231/apex-logs-external
