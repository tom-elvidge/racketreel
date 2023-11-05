# Backend Patterns

The backend is a single service written in C# and .NET Core with four core projects.

- RacketReel.Domain
  - The core domain logic for the application. For example, how to score a tennis match.
- RacketReel.Application
  - Handles commands and queries by calling the underlying domain objects and returning data transfer objects.
- RacketReel.Presentation
  - Exposes the functionality in the application to users, in this case via gRPC.
- RacketReel.Infrastructure
  - Configures infrastructure dependencies required by the application. When built this assembly is the entrypoint for the application.

This separation is inspired by various patterns Clean Architecture (CA), Domain Driven Design (DDD) and Command Query Responsibility Segregation (CQRS). Listed here are resources to help understanding and applying these patterns.

- [Design a DDD-oriented microservice]((https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/ddd-oriented-microservice))
- [Pattern: Command Query Responsibility Segregation (CQRS)](https://microservices.io/patterns/data/cqrs.html)
- [Domain-Driven Design: Tackling Complexity in the Heart of Software](https://www.goodreads.com/book/show/179133.Domain_Driven_Design)
- [Milan Jovanović's Clean Architecture and DDD Series](https://www.youtube.com/watch?v=tLk4pZZtiDY&list=PLYpjLpq5ZDGstQ5afRz-34o_0dexr1RGa)

## Decision Records

### Models

There are seemingly very similar models in the different projects of the solution which have to be mapped between each other. This adds complexity but there are reasons for this.

The models in the Domain project are rich models containing the domain logic and are only used within the service. Entity Framework in the Infrastructure project is responsible for persisting these models, so we do not have to consider a separate collection of database models and mappings.

The models in the Application project are DTOs containing no domain logic and are for service-to-service communication. These are split in commands and queries with some common models, all of which should be simple to serialize and transfer over a network. Commands are for writing and queries for reading, but both of these should be easy for other services to interface with. For now these models are only transferred within the same service in-memory via MediatR to command and query handlers. These could be used for service-to-service communication in the future as the project grows.

The models in the Presentation project are also DTOs but for service-to-client communication and only concerned with what clients need to request from a service or present to a user. All these models are generated from Protobuf. This allows clients in other languages can generate equivalent models and communicate over gRPC. Any data which a user would not care about should not be in these models. Presentation models will be similar to Application models making them easy to map but contain less information. For example, Presentation error models should only be things the user can action such as input validation, whereas Application error models would contain more information to make support and troubleshooting easier.

The Application project can change over time. The gRPC service and models in the Presentation project should stay the same to keep backwards compatibility. Changes to the service and models should just be added as new versions in the same project.