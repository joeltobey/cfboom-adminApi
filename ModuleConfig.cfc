/*
 * Copyright 2016-2017 Joel Tobey <joeltobey@gmail.com>
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
 * @author Joel Tobey
 */
component {

  // Module Properties
  this.title              = "cfboom ColdFusion Admin API";
  this.author             = "Joel Tobey";
  this.webURL             = "https://github.com/joeltobey/cfboom-adminApi";
  this.description        = "A ColdBox Module to easily interface with ColdFusion's administrator API.";
  this.version            = "1.1.0";
  // If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
  this.viewParentLookup   = true;
  // If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
  this.layoutParentLookup = true;
  // Module Entry Point
  this.entryPoint         = "cfboom/adminapi";
  // Model Namespace
  this.modelNamespace     = "cfboomAdminApi";
  // CF Mapping
  this.cfmapping          = "cfboom/adminapi";
  // Auto-map models
  this.autoMapModels      = true;
  // Module Dependencies
  this.dependencies       = [ "cfboom-lang" ];

  function configure() {
    // module settings - stored in modules.name.settings
    settings = {
      // ColdFusion Admin password
      "adminPassword" = ""
    };
  }

  /**
   * Fired when the module is registered and activated.
   */
  function onLoad() {
    // Check if Admin Password is set in Java system settings
    properties = createObject("java", "java.lang.System").getProperties();
    if (!isNull(properties.getProperty("cfAdminPassword"))) {
      settings['adminPassword'] = properties.getProperty("cfAdminPassword");
      log.info("Setting 'adminPassword' from Java system settings");
    }
  }

  /**
   * Fired when the module is unregistered and unloaded
   */
  function onUnload() {}

}
