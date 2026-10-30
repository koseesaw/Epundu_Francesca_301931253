 Portfolio 5: Distributed and Cloud Database Exercise

 1. Introduction

RetailConnect Nigeria is a retail distribution business that supplies shops across different cities in Nigeria. As the business grows, its database must support access from different locations while maintaining availability, performance, and data consistency.

This portfolio proposes a distributed database architecture using PostgreSQL to support the organization's operations.

 2. Proposed Database Architecture

The proposed architecture uses a primary PostgreSQL database hosted in the main business environment, with a read replica hosted in a separate regional or cloud environment.

The primary database handles customer registrations, orders, payments, and stock updates. The read replica provides access to replicated data for reporting and read-only queries.

Authorized users and applications connect securely to the database services through the organization's network infrastructure.

 3. Replication

PostgreSQL streaming replication can be used to copy changes from the primary database to a standby replica.

Asynchronous replication allows the primary database to continue processing transactions without waiting for every change to reach the replica. However, a short delay may occur before the replica receives the latest changes.

Synchronous replication can provide stronger consistency by requiring confirmation from a standby server before a transaction is considered complete, although this can increase transaction latency.

For RetailConnect Nigeria, asynchronous replication may be suitable for reporting workloads, while critical payment and stock transactions should be handled by the primary database.

 4. Sharding and Partitioning

Sharding involves dividing a large database into smaller sections and distributing them across multiple database servers.

RetailConnect Nigeria could consider regional sharding as its customer and transaction volume increases. For example, customer records could be allocated according to their registered region.

PostgreSQL alone does not shard across servers, so this would need an extension such as Citus or application-level routing.

A related feature available in PostgreSQL is partitioning. Partitioning divides a large table into smaller parts within the same database. For example, RetailConnect could partition transaction records according to region or transaction date.

These approaches can help distribute workloads and improve database management as the business grows.

 5. Availability and Fault Tolerance

A standby replica can improve availability if the primary database becomes unavailable.

A monitoring and failover process would detect primary database failure and promote an appropriate standby server when necessary.

Regular backups should also be maintained separately from the primary database and replica to support recovery from accidental deletion, corruption, or other incidents.

Replication alone is not a replacement for backups.

 6. Consistency and Security

Database consistency is important because RetailConnect Nigeria processes orders, payments, and stock information.

Critical transactions should use appropriate transaction controls to prevent incorrect stock quantities or inconsistent payment records.

Database connections should be protected using encryption, authentication, access controls, and appropriate privileges.

Access to customer information should follow the principle of least privilege and the Nigeria Data Protection Act 2023.

 7. Cloud Deployment Considerations

RetailConnect Nigeria could deploy its PostgreSQL primary and standby databases using a cloud infrastructure provider.

A cloud deployment could provide scalable storage, managed database services, automated backups, monitoring, and disaster recovery options.

The organization would need to consider hosting costs, data residency, network security, availability requirements, and the responsibilities shared with its cloud provider.

 8. Implementation Evidence and Limitations

The file `replication-settings.txt` contains actual output from the PostgreSQL database configuration checks.

The output shows:

- `wal_level` is set to `replica`.
- `max_wal_senders` is set to `10`.
- The `pg_stat_replication` query returns zero rows.

This shows that the PostgreSQL server has settings that support replication, but no standby server is currently connected.

This portfolio presents a proposed distributed database architecture rather than a live multi-server deployment. Streaming replication, sharding, and automated failover have not been configured or tested in this exercise. They would require additional infrastructure, configuration, monitoring, and testing before production use.

 9. Personal Reflection

This exercise helped me understand how distributed databases can support businesses operating across different locations.

I learned the difference between synchronous and asynchronous replication, and why replication is not a replacement for backups. I also learned that PostgreSQL supports partitioning but requires additional tools or application-level routing for sharding across servers.

I would like to gain practical experience configuring a primary database and standby replica on separate servers.

 10. Conclusion

A distributed PostgreSQL architecture could help RetailConnect Nigeria support its operations as the business grows.

Replication could improve read availability and support recovery, while partitioning and sharding could help manage increasing data volumes.

The proposed design demonstrates how availability, consistency, security, and scalability should be considered when planning a distributed database environment.
