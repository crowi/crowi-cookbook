# Crowi Cookbook

Install and configure Crowi.

## REQUIREMENTS:

### Platform:

* debian
* ubuntu

## ATTRIBUTES:

* TODO.

## USAGE:

### Standalone

* All in one setup.
    * Node.js
    * MongoDB
    * Redis
    * and Crowi.

```
{
    "crowi": {
        "fqdn": "your crowi domain"
    },
    "run_list": [
        "recipe[crowi::standalone]"
    ]
}
```

## AUTHORS:

* Daichi Kamemoto (daikame@gmail.com)

## LICENSE:

* See LICENSE file.

