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

  create_table "alumnos", :primary_key => "id_alumno", :force => true do |t|
    t.string  "nombre",    :limit => 45, :null => false
    t.string  "apepat",    :limit => 45, :null => false
    t.string  "apemat",    :limit => 45, :null => false
    t.string  "domicilio", :limit => 45, :null => false
    t.integer "cp",                      :null => false
    t.string  "colonia",   :limit => 45, :null => false
    t.string  "municipio", :limit => 45, :null => false
    t.string  "estado",    :limit => 45, :null => false
  end

  create_table "calificaciones", :id => false, :force => true do |t|
    t.integer "id_calificacion", :null => false
    t.integer "id_parcial",      :null => false
    t.float   "calificacion",    :null => false
    t.integer "id_razon",        :null => false
  end

  add_index "calificaciones", ["id_parcial"], :name => "fk_calificaciones_parciales1"
  add_index "calificaciones", ["id_razon"], :name => "fk_calificaciones_razones1"

  create_table "carreras", :id => false, :force => true do |t|
    t.integer "id_carrera",                :null => false
    t.integer "id_centro",                 :null => false
    t.string  "nombre",      :limit => 45, :null => false
    t.string  "descripcion", :limit => 45, :null => false
  end

  add_index "carreras", ["id_centro"], :name => "FK_centros_carreras"

  create_table "centros", :primary_key => "id_centro", :force => true do |t|
    t.string "nombre", :limit => 45, :null => false
  end

  create_table "contactosals", :id => false, :force => true do |t|
    t.integer "id_tipocontacto",               :null => false
    t.integer "id_alumno",                     :null => false
    t.string  "contacto",        :limit => 45, :null => false
  end

  add_index "contactosals", ["id_alumno"], :name => "fk_contactosals_alumnos1"
  add_index "contactosals", ["id_tipocontacto"], :name => "fk_contactosals_tiposcontactos1"

  create_table "contactosmts", :id => false, :force => true do |t|
    t.integer "id_tipocontacto",               :null => false
    t.integer "id_maestro",                    :null => false
    t.string  "contacto",        :limit => 45, :null => false
  end

  add_index "contactosmts", ["id_maestro"], :name => "fk_contactosmts_maestros1"
  add_index "contactosmts", ["id_tipocontacto"], :name => "fk_contactosmts_tiposcontactos1"

  create_table "cursos", :id => false, :force => true do |t|
    t.integer "id_curso",                      :null => false
    t.integer "id_materias",                   :null => false
    t.integer "id_maestro",                    :null => false
    t.string  "curso",           :limit => 45, :null => false
    t.integer "id_periodo",                    :null => false
    t.integer "id_tiposestatus",               :null => false
  end

  add_index "cursos", ["id_maestro"], :name => "fk_cursos_maestros1"
  add_index "cursos", ["id_materias"], :name => "fk_cursos_materias1"
  add_index "cursos", ["id_periodo"], :name => "fk_cursos_periodos1"
  add_index "cursos", ["id_tiposestatus"], :name => "fk_cursos_tiposestatus1"

  create_table "cursosalumnos", :id => false, :force => true do |t|
    t.integer "id_cursoalumno", :null => false
    t.integer "id_curso",       :null => false
    t.integer "id_alumno",      :null => false
  end

  add_index "cursosalumnos", ["id_alumno"], :name => "fk_cursosalumnos_alumnos1"
  add_index "cursosalumnos", ["id_curso"], :name => "fk_cursosalumnos_cursos1"

  create_table "maestros", :primary_key => "id_maestro", :force => true do |t|
    t.string  "nombre",    :limit => 45, :null => false
    t.string  "apepat",    :limit => 45, :null => false
    t.string  "apemat",    :limit => 45, :null => false
    t.string  "domicilio", :limit => 45, :null => false
    t.integer "cp",                      :null => false
    t.string  "colonia",   :limit => 45, :null => false
    t.string  "municipio", :limit => 45, :null => false
    t.string  "estado",    :limit => 45, :null => false
  end

  create_table "materias", :id => false, :force => true do |t|
    t.integer "id_materias",               :null => false
    t.integer "id_carrera",                :null => false
    t.string  "materia",     :limit => 45, :null => false
  end

  add_index "materias", ["id_carrera"], :name => "fk_materias_carreras1"

  create_table "parciales", :id => false, :force => true do |t|
    t.integer "id_parcial",                   :null => false
    t.integer "id_cursoalumno",               :null => false
    t.string  "parcial",        :limit => 45, :null => false
  end

  add_index "parciales", ["id_cursoalumno"], :name => "fk_parciales_cursosalumnos1"

  create_table "periodos", :primary_key => "id_periodo", :force => true do |t|
    t.string "periodo", :limit => 45, :null => false
  end

  create_table "prerrequisitos", :id => false, :force => true do |t|
    t.integer "id_prerrequisito",               :null => false
    t.integer "id_materias",                    :null => false
    t.string  "prerrequisito",    :limit => 45, :null => false
  end

  add_index "prerrequisitos", ["id_materias"], :name => "fk_prerrequisitos_materias1"

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

  create_table "razones", :primary_key => "id_razon", :force => true do |t|
    t.string "descripcion", :limit => 45, :null => false
  end

  create_table "tiposcontactos", :primary_key => "id_tipocontacto", :force => true do |t|
    t.string "tipocontacto", :limit => 45, :null => false
  end

  create_table "tiposestatus", :primary_key => "id_tiposestatus", :force => true do |t|
    t.string "tipoestatus", :limit => 45, :null => false
  end

  create_table "tiposusuarios", :primary_key => "id_tipousuario", :force => true do |t|
    t.string "tipousuario", :limit => 45, :null => false
  end

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

  create_table "usuarios", :primary_key => "id_usuario", :force => true do |t|
    t.integer "id_tipousuario",               :null => false
    t.string  "nombre",         :limit => 45, :null => false
    t.string  "contrasena",     :limit => 45, :null => false
    t.integer "estatus",        :limit => 1,  :null => false
  end

  add_index "usuarios", ["id_tipousuario"], :name => "FK_usuario_tiposusuarios"

end
