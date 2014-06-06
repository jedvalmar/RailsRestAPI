# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130318055526) do

  create_table "Clients", :primary_key => "idClient", :force => true do |t|
    t.string  "username", :limit => 45
    t.string  "pass",     :limit => 45
    t.boolean "status"
  end

  create_table "Components_brand", :primary_key => "idComponents_brand", :force => true do |t|
  end

  create_table "Contact_types", :primary_key => "idContact_type", :force => true do |t|
    t.string "contact_type", :limit => 45
  end

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

  create_table "Packages", :primary_key => "idPackages", :force => true do |t|
    t.string "Description", :limit => 45
  end

  create_table "component_type", :primary_key => "idComponent_type", :force => true do |t|
    t.string  "component_type",     :limit => 45
    t.integer "idComponents",                     :null => false
    t.integer "idComponents_brand",               :null => false
  end

  add_index "component_type", ["idComponents"], :name => "fk_Component_type_Components1_idx"
  add_index "component_type", ["idComponents_brand"], :name => "fk_Component_type_Components_brand1_idx"

  create_table "components", :primary_key => "idComponents", :force => true do |t|
    t.string  "component",     :limit => 45
    t.integer "idModel",                     :null => false
    t.string  "serial_number", :limit => 45
  end

  add_index "components", ["idModel"], :name => "fk_Components_Model1_idx"

  create_table "contacts", :primary_key => "idContacts", :force => true do |t|
    t.string  "contact",        :limit => 100
    t.integer "idGeneral_info",                :null => false
    t.integer "idContact_type",                :null => false
  end

  add_index "contacts", ["idContact_type"], :name => "fk_Contacts_Contact_types1_idx"
  add_index "contacts", ["idGeneral_info"], :name => "fk_Contacts_General_info_idx"

  create_table "machine_type", :primary_key => "idMachine_type", :force => true do |t|
    t.string  "machine_type", :limit => 45
    t.integer "idBrand",                    :null => false
  end

  add_index "machine_type", ["idBrand"], :name => "fk_Machine_type_Brand1_idx"

  create_table "machines", :primary_key => "idMachines", :force => true do |t|
    t.integer "Model_idModel",               :null => false
    t.string  "serial_number", :limit => 45
    t.integer "idClients",                   :null => false
  end

  add_index "machines", ["Model_idModel"], :name => "fk_Machines_Model1_idx"
  add_index "machines", ["idClients"], :name => "fk_Machines_Clients1_idx"

  create_table "model", :primary_key => "idModel", :force => true do |t|
    t.integer "idMachine_brand", :null => false
  end

  add_index "model", ["idMachine_brand"], :name => "fk_Model_Machine_brand1_idx"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "service_logs", :primary_key => "idService_logs", :force => true do |t|
    t.integer  "idServices",               :null => false
    t.integer  "idEvents",                 :null => false
    t.string   "Comments",   :limit => 45
    t.datetime "date_"
  end

  add_index "service_logs", ["idEvents"], :name => "fk_Service_logs_Events1_idx"
  add_index "service_logs", ["idServices"], :name => "fk_Service_logs_Services1_idx"

  create_table "services", :primary_key => "idServices", :force => true do |t|
    t.integer "idMachines",  :null => false
    t.integer "idPackages",  :null => false
    t.integer "idEmployees", :null => false
  end

  add_index "services", ["idEmployees"], :name => "fk_Services_Employees1_idx"
  add_index "services", ["idMachines"], :name => "fk_Services_Machines1_idx"
  add_index "services", ["idPackages"], :name => "fk_Services_Packages1_idx"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
