/*
 * Copyright 2016 Joel Tobey <joeltobey@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * A concrete implementation of an Administrator for the Adobe ColdFusion server.
 *
 * @singleton
 */
component
    implements="cfboom.adminapi.models.Administrator"
    displayname="Class AdobeAdministrator"
    output="false"
{
    /**
     * @password.inject coldbox:setting:adminPassword@cfboom-adminApi
     */
    public cfboom.adminapi.models.AdobeAdministrator function init(required string password) {
        variables['_password'] = arguments.password;
        return this;
    }

    public struct function getDatasources() {
        login();
        var datasource = new cfide.adminapi.datasource();
        return datasource.getdatasources();
    }

    public struct function getDatasource(required string name) {
        login();
        var datasource = new cfide.adminapi.datasource();
        return datasource.getdatasources( arguments.name );
    }

    public any function verifyDsn(required string name) {
        login();
        var datasource = new cfide.adminapi.datasource();
        return datasource.verifyDsn( arguments.name );
    }

    private void function login() {
        variables['_administrator'] = new cfide.adminapi.administrator().login( _password );
    }
}