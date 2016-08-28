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
 * A simple contract to the ColdFusion administrator regardless of server.
 */
component
    extends="coldbox.system.testing.BaseTestCase"
    appMapping="/root"
    displayname="Class AdminServiceTest"
    output="false"
{
    public void function beforeTests() {
        super.beforeTests();
        variables['AdminService'] = getInstance("AdminService@cfboomAdminApi");
        variables['_admin'] = AdminService.getAdministrator();
    }

    public void function testDatasource() {
        var datasources = _admin.getDatasources();
        assertTrue(isStruct(_admin.getDatasources()));
        for (var datasource in datasources) {
            assertTrue(isStruct(_admin.getDatasource( datasource )));
        }
    }
}