# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100309011341) do

  create_table "agencies", :force => true do |t|
    t.string   "name",                :limit => 100, :null => false
    t.string   "contact_title",       :limit => 100
    t.string   "contact_first_name",  :limit => 45
    t.string   "contact_middle_name", :limit => 45
    t.string   "contact_last_name",   :limit => 45
    t.string   "address",             :limit => 100
    t.string   "address2",            :limit => 100
    t.string   "city",                :limit => 100
    t.string   "state",               :limit => 2
    t.string   "zip",                 :limit => 10
    t.string   "contact_email",       :limit => 45
    t.string   "contact_phone1",      :limit => 45
    t.string   "contact_phone2",      :limit => 45
    t.string   "fax",                 :limit => 45
    t.string   "license_number",      :limit => 45
    t.string   "license_type",        :limit => 45
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "creator_id",                         :null => false
    t.integer  "updater_id",                         :null => false
    t.string   "agency_code",         :limit => 5
  end

  create_table "agents", :id => false, :force => true do |t|
    t.integer "id",                            :null => false
    t.string  "agency_code",    :limit => 5,   :null => false
    t.string  "first_name",     :limit => 45,  :null => false
    t.string  "middle_name",    :limit => 45
    t.string  "last_name",      :limit => 45
    t.string  "work_phone",     :limit => 45
    t.string  "email",          :limit => 45
    t.string  "agent_code",     :limit => 45,  :null => false
    t.string  "address",        :limit => 100
    t.string  "address2",       :limit => 15
    t.string  "city",           :limit => 100
    t.string  "state",          :limit => 2
    t.string  "zip",            :limit => 10
    t.string  "license_type",   :limit => 45
    t.string  "license_number", :limit => 45
    t.string  "cell_phone",     :limit => 45
    t.integer "creator_id"
    t.integer "updater_id"
    t.string  "created_at",     :limit => 45
    t.string  "updated_at",     :limit => 45
    t.string  "ssn",            :limit => 45
  end

  create_table "documents", :force => true do |t|
    t.integer  "quote_id",      :default => 0, :null => false
    t.binary   "document_data",                :null => false
    t.string   "description"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "error_logs", :force => true do |t|
    t.integer  "quote_id"
    t.text     "error_desc"
    t.string   "error_name",   :limit => 100
    t.string   "error_source", :limit => 1000
    t.string   "error_type",   :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "group_activities", :force => true do |t|
    t.string   "activity_code", :limit => 20, :null => false
    t.string   "description"
    t.string   "status",        :limit => 1
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "editable",      :limit => 1
  end

  create_table "group_permissions", :force => true do |t|
    t.string   "group_code"
    t.string   "activity_code"
    t.string   "lob_code"
    t.string   "status"
    t.string   "editable"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "group_code",  :limit => 20, :null => false
    t.string   "description"
    t.string   "status",      :limit => 1
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "editable",    :limit => 1
  end

  create_table "line_of_businesses", :force => true do |t|
    t.string   "lob_code",    :limit => 20
    t.string   "description"
    t.string   "status",      :limit => 1
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "editable",    :limit => 1,  :null => false
  end

  create_table "page_updated_infos", :force => true do |t|
    t.integer  "quote_id",                              :null => false
    t.boolean  "required_fields_entered"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pageid",                  :limit => 45
    t.integer  "unit_seq",                :limit => 2
  end

  create_table "payment_plans", :force => true do |t|
    t.string   "lob",                :limit => 10
    t.string   "plan_code",          :limit => 10
    t.integer  "plan_term",          :limit => 2
    t.string   "plan_desc",          :limit => 100
    t.integer  "installment_number", :limit => 2
    t.decimal  "installment_fee",                   :precision => 10, :scale => 2
    t.decimal  "policy_fee",                        :precision => 10, :scale => 2
    t.decimal  "down_payment",                      :precision => 10, :scale => 2
    t.integer  "down_payment_days",  :limit => 2
    t.decimal  "first_percent",                     :precision => 10, :scale => 2
    t.integer  "first_days",         :limit => 2
    t.decimal  "second_percent",                    :precision => 10, :scale => 2
    t.integer  "second_days",        :limit => 2
    t.decimal  "third_percent",                     :precision => 10, :scale => 2
    t.integer  "third_days",         :limit => 2
    t.decimal  "fourth_percent",                    :precision => 10, :scale => 2
    t.integer  "fourth_days",        :limit => 2
    t.decimal  "fifth_percent",                     :precision => 10, :scale => 2
    t.integer  "fifth_days",         :limit => 2
    t.decimal  "sixth_percent",                     :precision => 10, :scale => 2
    t.integer  "sixth_days",         :limit => 2
    t.decimal  "seventh_percent",                   :precision => 10, :scale => 2
    t.integer  "seventh_days",       :limit => 2
    t.decimal  "eighth_percent",                    :precision => 10, :scale => 2
    t.integer  "eighth_days",        :limit => 2
    t.decimal  "ninth_percent",                     :precision => 10, :scale => 2
    t.integer  "ninth_days",         :limit => 2
    t.decimal  "tenth_percent",                     :precision => 10, :scale => 2
    t.integer  "tenth_days",         :limit => 2
    t.decimal  "eleventh_percent",                  :precision => 10, :scale => 2
    t.integer  "eleventh_days",      :limit => 2
    t.decimal  "twelfth_percent",                   :precision => 10, :scale => 2
    t.integer  "twelfth_days",       :limit => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "creator_id",         :limit => 45
    t.string   "updater_id",         :limit => 45
    t.integer  "display_order",      :limit => 2,                                  :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "quote_id"
    t.string   "payment_plan",      :limit => 20
    t.string   "down_payment_type", :limit => 20
    t.string   "bill_type",         :limit => 20
    t.float    "min_down"
    t.float    "installment"
    t.float    "total_charge"
    t.float    "agency_fee"
    t.float    "policy_fee"
    t.float    "misc_fee"
    t.string   "misc_fee_reason"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "policies", :force => true do |t|
    t.integer  "quote_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "policy_header_id"
    t.string   "transaction_code",     :limit => 20
    t.datetime "transaction_at"
    t.datetime "term_effective_date"
    t.datetime "term_expiration_date"
    t.string   "transaction_reason"
  end

  create_table "policy_headers", :force => true do |t|
    t.string   "policy_prefix",         :limit => 10
    t.string   "policy_suffix",         :limit => 20
    t.string   "policy_number",         :limit => 20
    t.string   "prior_policy_number",   :limit => 45
    t.datetime "org_effective_date"
    t.string   "current_status",        :limit => 10
    t.string   "current_activity",      :limit => 45
    t.integer  "num_endorsed"
    t.integer  "num_renewed"
    t.integer  "num_reinstated"
    t.integer  "policy_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_endorsed_dt"
    t.text     "last_endorsement_text"
  end

  create_table "quotes", :force => true do |t|
    t.string   "quote_type",             :limit => 10,  :default => "NEW"
    t.string   "lob",                    :limit => 10,                     :null => false
    t.string   "policy_type",            :limit => 10
    t.string   "quote_status",           :limit => 1,   :default => "Q"
    t.integer  "policy_term"
    t.date     "quote_effective_date"
    t.date     "quote_expiration_date"
    t.date     "policy_effective_date"
    t.date     "policy_expiration_date"
    t.integer  "version"
    t.boolean  "rated"
    t.datetime "last_rated_at"
    t.boolean  "produced"
    t.datetime "produced_at"
    t.float    "quoted_premium"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "transaction_name",       :limit => 50
    t.string   "search_name",            :limit => 100
    t.string   "payment_plan",           :limit => 20
    t.string   "down_payment_type",      :limit => 20
    t.string   "bill_type",              :limit => 20
    t.float    "min_down"
    t.float    "installment"
    t.float    "total_charge"
    t.float    "policy_fee"
    t.float    "misc_fee"
    t.string   "misc_fee_reason"
    t.boolean  "canbe_issued"
    t.boolean  "needs_rating"
    t.string   "quote_number",           :limit => 10
    t.integer  "policy_id"
    t.float    "agency_fee"
    t.float    "prorated_premium"
    t.float    "offset_premium"
  end

  create_table "search_entities", :force => true do |t|
    t.string   "insured_name", :limit => 45
    t.string   "entity1",      :limit => 20
    t.string   "entity2",      :limit => 20
    t.string   "entity3",      :limit => 20
    t.string   "entity4",      :limit => 20
    t.string   "entity5",      :limit => 20
    t.string   "entity6",      :limit => 20
    t.string   "entity7",      :limit => 20
    t.string   "entity8",      :limit => 20
    t.string   "entity9",      :limit => 20
    t.string   "entity10",     :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "quote_id"
  end

  create_table "sessions", :force => true do |t|
    t.integer  "users_id"
    t.string   "ip_address"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :id => false, :force => true do |t|
    t.integer  "id",                                      :null => false
    t.string   "login",                                   :null => false
    t.string   "email"
    t.string   "first_name",                :limit => 80
    t.string   "last_name",                 :limit => 80
    t.string   "encrypted_password",        :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "middle_name",               :limit => 45
    t.string   "status",                    :limit => 1
    t.string   "reset_password",            :limit => 1
    t.string   "group",                     :limit => 1
    t.string   "agent_code",                :limit => 45
    t.datetime "effective_at"
    t.datetime "expired_at"
  end

  create_table "xmlstores", :id => false, :force => true do |t|
    t.integer  "id",                              :null => false
    t.integer  "quote_id",         :default => 0, :null => false
    t.text     "xmlstring"
    t.text     "original_xml"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.text     "menu_xml"
    t.text     "payment_schedule"
    t.text     "change_detail"
  end

end
