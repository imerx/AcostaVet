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

ActiveRecord::Schema.define(:version => 20131226235014) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "animal_servicios", :force => true do |t|
    t.integer  "servicio_id"
    t.integer  "doctor_id"
    t.integer  "client_id"
    t.integer  "animal_id"
    t.boolean  "pago"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "animal_vacunas", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "category_id"
    t.integer  "vacuna_id"
    t.integer  "animal_id"
    t.integer  "servicio_id"
    t.date     "cita"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "animalhistories", :force => true do |t|
    t.text     "historia"
    t.string   "peso"
    t.string   "temperatura"
    t.string   "observaciones"
    t.integer  "animal_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "animals", :force => true do |t|
    t.string   "nombre"
    t.date     "nacio_el"
    t.integer  "client_id"
    t.string   "sexo"
    t.string   "color"
    t.string   "raza"
    t.text     "comentario"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "calendars", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "color"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categoria_productos", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "direccion"
    t.string   "ciudad"
    t.string   "estado"
    t.integer  "codigo"
    t.string   "pais"
    t.string   "email"
    t.string   "telefono"
    t.string   "celular"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "consults", :force => true do |t|
    t.integer  "vacuna_id"
    t.integer  "servicio_id"
    t.integer  "doctor_id"
    t.integer  "receta_id"
    t.integer  "animal_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "doctors", :force => true do |t|
    t.string   "rfc"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "direccion"
    t.string   "ciudad"
    t.string   "estado"
    t.integer  "codigo"
    t.string   "pais"
    t.string   "email"
    t.string   "telefono"
    t.string   "celular"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_all_day"
    t.date     "from_date"
    t.time     "from_time"
    t.date     "to_date"
    t.time     "to_time"
    t.string   "repeats"
    t.integer  "repeats_every_n_days"
    t.integer  "repeats_every_n_weeks"
    t.integer  "repeats_weekly_each_days_of_the_week_mask"
    t.integer  "repeats_every_n_months"
    t.string   "repeats_monthly"
    t.integer  "repeats_monthly_each_days_of_the_month_mask"
    t.integer  "repeats_monthly_on_ordinals_mask"
    t.integer  "repeats_monthly_on_days_of_the_week_mask"
    t.integer  "repeats_every_n_years"
    t.integer  "repeats_yearly_each_months_of_the_year_mask"
    t.boolean  "repeats_yearly_on"
    t.integer  "repeats_yearly_on_ordinals_mask"
    t.integer  "repeats_yearly_on_days_of_the_week_mask"
    t.string   "repeat_ends"
    t.date     "repeat_ends_on"
    t.string   "time_zone"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "calendar_id"
  end

  create_table "experiencia_trabajos", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.date     "date"
    t.integer  "doctor_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "facturas", :force => true do |t|
    t.integer  "user_id"
    t.integer  "animal_servicio_id"
    t.integer  "animal_vacuna_id"
    t.integer  "client_id"
    t.integer  "animal_id"
    t.decimal  "precio"
    t.text     "commentario"
    t.decimal  "total"
    t.boolean  "pagado"
    t.decimal  "iva"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "foto_trabajos", :force => true do |t|
    t.string   "titulo"
    t.string   "foto"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.decimal  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "line_items", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "line_items", ["product_id"], :name => "index_line_items_on_product_id"

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.datetime "checked_out_at"
    t.decimal  "total_price",    :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  add_index "orders", ["checked_out_at"], :name => "index_orders_on_checked_out_at"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "username"
    t.string   "servicio"
    t.text     "comentario"
    t.string   "honeyput"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "author"
    t.decimal  "price",           :precision => 8, :scale => 2
    t.boolean  "featured"
    t.date     "available_on"
    t.string   "image_file_name"
    t.integer "proveedor_id"
    t.integer "ubicacion_id"
    t.integer " categoria_producto_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "products", ["available_on"], :name => "index_products_on_available_on"
  add_index "products", ["featured"], :name => "index_products_on_featured"

  create_table "proveedors", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "rfc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "servicios", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "clave"
    t.decimal  "precio"
    t.integer  "servicio_id"
    t.integer  "animal_id"
    t.integer  "doctor_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ubicacions", :force => true do |t|
    t.string   "slot"
    t.string   "pasillo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vacunas", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.decimal  "precio"
    t.string   "clave"
    t.string   "periodo_vacunacion"
    t.string   "servicio_id"
    t.string   "category_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
