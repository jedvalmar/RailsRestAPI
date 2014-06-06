class CreateDatabase < ActiveRecord::Migration
  def self.up
    ActiveRecord::Schema.define(:version => 0) do

      create_table "Clients", :primary_key => "idClient", :force => true do |t|
        t.string  "username", :limit => 45
        t.string  "pass",     :limit => 45
        t.boolean "status"
      end

      create_table "Component_type", :primary_key => "idComponent_type", :force => true do |t|
        t.string  "component_type",     :limit => 45
        t.integer "idComponents",                     :null => false
        t.integer "idComponents_brand",               :null => false
      end

      add_index "component_type", ["idComponents"], :name => "fk_Component_type_Components1_idx"
      add_index "component_type", ["idComponents_brand"], :name => "fk_Component_type_Components_brand1_idx"

      create_table "Components", :primary_key => "idComponents", :force => true do |t|
        t.string  "component",     :limit => 45
        t.integer "idModel",                     :null => false
        t.string  "serial_number", :limit => 45
      end

      add_index "components", ["idModel"], :name => "fk_Components_Model1_idx"

      create_table "Components_brand", :primary_key => "idComponents_brand", :force => true do |t|
      end

      create_table "Contact_types", :primary_key => "idContact_type", :force => true do |t|
        t.string "contact_type", :limit => 45
      end

      create_table "Contacts", :primary_key => "idContacts", :force => true do |t|
        t.string  "contact",        :limit => 100
        t.integer "idGeneral_info",                :null => false
        t.integer "idContact_type",                :null => false
      end

      add_index "contacts", ["idContact_type"], :name => "fk_Contacts_Contact_types1_idx"
      add_index "contacts", ["idGeneral_info"], :name => "fk_Contacts_General_info_idx"

      create_table "Employees", :primary_key => "idEmployees", :force => true do |t|
        t.string  "username", :limit => 45
        t.string  "pass",     :limit => 45
        t.boolean "status"
      end

      create_table "Events", :primary_key => "idEvents", :force => true do |t|
        t.string "event", :limit => 45
      end

      create_table "General_info", :primary_key => "idGeneral_info", :force => true do |t|
        t.string "name",      :limit => 45
        t.string "last_name", :limit => 45
        t.string "address",   :limit => 45
        t.string "propietor", :limit => 45
        t.string "email",     :limit => 45
      end

      create_table "Machine_brand", :primary_key => "idMachine_brand", :force => true do |t|
        t.string "brand", :limit => 45
      end

      create_table "Machine_type", :primary_key => "idMachine_type", :force => true do |t|
        t.string  "machine_type", :limit => 45
        t.integer "idBrand",                    :null => false
      end

      add_index "machine_type", ["idBrand"], :name => "fk_Machine_type_Brand1_idx"

      create_table "Machines", :primary_key => "idMachines", :force => true do |t|
        t.integer "Model_idModel",               :null => false
        t.string  "serial_number", :limit => 45
        t.integer "idClients",                   :null => false
      end

      add_index "machines", ["Model_idModel"], :name => "fk_Machines_Model1_idx"
      add_index "machines", ["idClients"], :name => "fk_Machines_Clients1_idx"

      create_table "Model", :primary_key => "idModel", :force => true do |t|
        t.integer "idMachine_brand", :null => false
      end

      add_index "model", ["idMachine_brand"], :name => "fk_Model_Machine_brand1_idx"

      create_table "Packages", :primary_key => "idPackages", :force => true do |t|
        t.string "Description", :limit => 45
      end

      create_table "Service_logs", :primary_key => "idService_logs", :force => true do |t|
        t.integer  "idServices",               :null => false
        t.integer  "idEvents",                 :null => false
        t.string   "Comments",   :limit => 45
        t.datetime "date_"
      end

      add_index "service_logs", ["idEvents"], :name => "fk_Service_logs_Events1_idx"
      add_index "service_logs", ["idServices"], :name => "fk_Service_logs_Services1_idx"

      create_table "Services", :primary_key => "idServices", :force => true do |t|
        t.integer "idMachines",  :null => false
        t.integer "idPackages",  :null => false
        t.integer "idEmployees", :null => false
      end

      add_index "services", ["idEmployees"], :name => "fk_Services_Employees1_idx"
      add_index "services", ["idMachines"], :name => "fk_Services_Machines1_idx"
      add_index "services", ["idPackages"], :name => "fk_Services_Packages1_idx"

    end
  end

  def self.down
    # drop all the tables if you really need
    # to support migration back to version 0
  end
end


