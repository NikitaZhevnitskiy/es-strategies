# ES indicies strategies
Implement all task using 
1. http call
2. .sh script

## Pre-setup  

Linux only, exec `./prepare.sh`  

Up es `docker-compose up -d`

## Task A
Create index `/cases/case` 

## Task B 
Update index v1 ~> v2
```
1. Add cases/tip-id-pattern
2. Add properties to cases.case.tipId
"tipId":{"type": "text", "fielddata": true}
```

## Task C
Update index v2 ~ v3



[POSTMAN collection](https://www.getpostman.com/collections/23718f40f70805bb1dd3)
### Solution A
```
PUT /cases

{
  "mappings": {
    "case": {
      "properties": {
        "caseId": {"type": "keyword"},
        "parentCaseId": {"type": "keyword"},
        "creation": {"type": "text", "fielddata": true},
        "modification": {"type": "text", "fielddata": true},
        "messageId": {"type": "keyword"},
        "source": {"type": "text", "fielddata": true},
        "destination":{"type": "text", "fielddata": true},
        "detail": {
          "properties": {
            "description": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "ignore_above": 256
                }
              }
            },
            "title": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "ignore_above": 256
                }
              }
            }
          }
        },
        "assignedTo": {"type": "keyword"},
        "assignedOperator": {"type": "object"}
      }
    }
  }
}
```

### Solution B 
1
```
PUT /cases/_mapping/case
{
  "properties": {
    "tipId":{"type": "text", "fielddata": true}	
  }    
}
```
2
```
PUT /cases/_mapping/tip-id-pattern
{
  "properties": {
    "tipId":{"type":"text", "fielddata": true},
    "source": {"type": "text", "fielddata": true},
    "destination":{"type": "text", "fielddata": true},
    "description_keys": { "type": "text", "fielddata": true}
  }
}
```

### Solution C
1
```
PUT /cases/_mapping/case
{
  "properties": {
    "detail.priority":{"type": "long"}
  }   
}
```
2
```
PUT /cases/_mapping/priority
{
  "properties": {
    "id":{"type":"keyword"},
    "source": {"type": "text", "fielddata": true},
    "destination":{"type": "text", "fielddata": true},
    "descriptionKeys": { "type": "text", "fielddata": true},
    "priority": {"type": "integer"}
  }
}
```
