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
 */
component singleton
    extends="cfboom.lang.Object"
    implements="cfboom.adminapi.models.Administrator"
    displayname="Class AdminService"
    output="false"
{
    property name="coldbox" inject="coldbox";
    property name="wirebox" inject="wirebox";
    property name="log" inject="logbox:logger:{this}";

    public cfboom.adminapi.models.AdminService function init() {
        return this;
    }

    public void function onDIComplete() {
        initAdministrator();
    }

    public struct function getDatasources() {
        var datasources = _instance.administrator.getDatasources();
        log.info("Retrieved all datasources", structKeyList(datasources));
        return datasources;
    }

    public struct function getDatasource(required string name) {
        var datasource = _instance.administrator.getDatasource( arguments.name );
        if (structIsEmpty(datasource)) {
            log.info("Datasource with name '#arguments.name#' not found");
        } else {
            log.info("Retrieved datasource '#arguments.name#'");
        }
        return datasource;
    }

    public boolean function verifyDatasource(required string name) {
        try {
        	var isValid = _instance.administrator.verifyDatasource( arguments.name );
        	log.info("Datasource '#arguments.name#' is #isValid ? '' : 'not '#valid");
        	return isValid;
        } catch (database ex) {
        	log.info("Datasource '#arguments.name#' is not valid", ex.message & " " & ex.detail);
        	return false;
        }
    }

    /**
     * Factory method to get the appropriate Administrator.
     */
    private void function initAdministrator() {
        if (coldbox.getCFMLEngine().getEngine() == "ADOBE") {
            _instance['administrator'] = wirebox.getInstance("AdobeAdministrator@cfboomAdminApi");
        } else if (coldbox.getCFMLEngine().getEngine() == "RAILO") {
            _instance['administrator'] = wirebox.getInstance("LuceeAdministrator@cfboomAdminApi");
        } else {
            _instance['administrator'] = wirebox.getInstance("LuceeAdministrator@cfboomAdminApi");
        }
    }
}