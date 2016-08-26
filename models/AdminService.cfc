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
 * The main service
 *
 * @singleton
 */
component
    displayname="Class AdminService"
    output="false"
{ 
    property name="coldbox" inject="coldbox";
    property name="wirebox" inject="wirebox";
 
    public cfboom.adminapi.models.AdminService function init() {
        return this;
    }

    /**
     * Factory method to get the appropriate Administrator.
     */
    public cfboom.adminapi.models.Administrator function getAdministrator() {
        if (coldbox.getCFMLEngine().getEngine() == "ADOBE") {
            return wirebox.getInstance("AdobeAdministrator@cfboomAdminApi");
        } else if (coldbox.getCFMLEngine().getEngine() == "RAILO") {
            return wirebox.getInstance("LuceeAdministrator@cfboomAdminApi");
        } {
            return wirebox.getInstance("LuceeAdministrator@cfboomAdminApi");
        }
    }
}