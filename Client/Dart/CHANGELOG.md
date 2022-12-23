# Change Log

All notable changes to this project will be documented in this file.
 
The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).
 
## [0.1.0] - 2022-10-09
 
Added functionality for interacting with the Matches service for Racket Reel; view tennis matches, configure new ones and update their score.

## [0.1.1] - 2022-10-15
 
Fixed failure to initialize Apis.

## [0.2.0] - 2022-12-03

Added support for displaying the summary of completed matches.

## [0.2.1] - 2022-12-05

Added page count for paginated responses.

## [0.2.2] - 2022-12-05

Refactor totalPages to pageCount.

## [0.3.0] - 2022-12-23

- Added more documentation
- Refactored player to participant
- Changed format to a string preset rather than configuration fields
- Added order field for get matches for completed at date time

## [0.3.1] - 2022-12-23

- Updating a state includes the updated state in the response