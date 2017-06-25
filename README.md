[![Build Status](https://api.travis-ci.org/joeltobey/cfboom-adminApi.svg?branch=development)](https://travis-ci.org/joeltobey/cfboom-adminApi)

# WELCOME TO THE CFBOOM ADMIN API COLDBOX MODULE
A convenient service to access the ColdFusion Admin API.

##LICENSE
Apache License, Version 2.0.

##IMPORTANT LINKS
- https://github.com/joeltobey/cfboom-adminApi/wiki

##SYSTEM REQUIREMENTS
- Lucee 4.5+
- ColdFusion 9+

# INSTRUCTIONS
Just drop into your **modules** folder or use CommandBox to install

`box install cfboom-adminApi`

## WireBox Mappings
The module registers the AdminService: `AdminService@cfboomAdminApi` that you can use to interface with ColdFusion's Admin API. Check out the API Docs for all the possible functions.

## Settings
You must set the `adminPassword` in your `ColdBox.cfc` file under a `cfboomAdminApi` struct of `moduleSettings`:

```js
moduleSettings = {
    cfboomAdminApi = {
        // ColdFusion Admin password
            adminPassword = "Password123"
    }
};
```
