# votetri.com

```
POST https://kraken-api.herokuapp.com/registration with load: {"user": {"name": "Kyle", "password": "12345678"}}
POST https://kraken-api.herokuapp.com/authenticate with load: {"user": {"name": "Kyle", "password": "12345678"}}

POST https://kraken-api.herokuapp.com/proposals with load: {"proposal": {"title": "Sample Proposal", "body": "Some description here."}}
GET https://kraken-api.herokuapp.com/proposals
GET https://kraken-api.herokuapp.com/proposals/1
PUT  https://kraken-api.herokuapp.com/proposals/1 with load: {"proposal": {"title": "Sample Proposal Edited", "body": "Some edited description here."}}
DELETE https://kraken-api.herokuapp.com/proposals/1
POST https://kraken-api.herokuapp.com/proposals/1/comments with load: {"comment": {"body": "Some comment here."}}
GET https://kraken-api.herokuapp.com/proposals/1/comments
GET https://kraken-api.herokuapp.com/proposals/1/comments/1
PUT  https://kraken-api.herokuapp.com/proposals/1/comments/1 with load: {"comment": {"body": "Some edited comment here."}}
DELETE https://kraken-api.herokuapp.com/proposals/1/comments/1
POST https://kraken-api.herokuapp.com/proposals/1/votes with load: {"vote": {"value": "yes"}}
GET https://kraken-api.herokuapp.com/proposals/1/votes
GET https://kraken-api.herokuapp.com/proposals/1/votes/1
PUT  https://kraken-api.herokuapp.com/proposals/1/votes/1 with load: {"vote": {"body": "abstain"}}
DELETE https://kraken-api.herokuapp.com/proposals/1/votes/1

GET https://kraken-api.herokuapp.com/users

POST https://kraken-api.herokuapp.com/delegations with load: {"delegation": {"delegate_id": 1}}
GET https://kraken-api.herokuapp.com/delegations
DELETE https://kraken-api.herokuapp.com/delegations

POST https://kraken-api.herokuapp.com/teams with load: {"team": {"name": "Sample Team"}}
GET https://kraken-api.herokuapp.com/teams
GET https://kraken-api.herokuapp.com/teams/1
PUT  https://kraken-api.herokuapp.com/teams/1 with load: {"team": {"name": "Sample Team Edited"}}
GET https://kraken-api.herokuapp.com/teams/1/users
PUT  https://kraken-api.herokuapp.com/teams/1/users/1/add
PUT  https://kraken-api.herokuapp.com/teams/1/users/1/remove
DELETE https://kraken-api.herokuapp.com/teams/1
GET https://kraken-api.herokuapp.com/proposals/1/votes/mine

POST https://kraken-api.herokuapp.com/proposals/1/amendments with load: {"amendment": {"text": "Sample Amendment", "status": "submitted"}}
GET https://kraken-api.herokuapp.com/proposals/1/amendments
GET https://kraken-api.herokuapp.com/proposals/1/amendments/1
PUT  https://kraken-api.herokuapp.com/proposals/1/amendments/1 with load: {"amendment": {"text": "Sample Amendment", "status": "submitted"}}
POST https://kraken-api.herokuapp.com/teams/1/actions with load: {"action": {"type": "proposed"}}
GET https://kraken-api.herokuapp.com/teams/1/actions
GET https://kraken-api.herokuapp.com/teams/1/actions/1
PUT  https://kraken-api.herokuapp.com/teams/1/actions/1 with load: {"action": {"type": "proposed"}}
DELETE https://kraken-api.herokuapp.com/teams/1/actions/1
```