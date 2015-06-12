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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150605104136) do

  create_table "aankopen", force: true do |t|
    t.integer  "user_id"
    t.string   "artikel"
    t.date     "aankoopdatum"
    t.string   "winkel"
    t.decimal  "prijs"
    t.integer  "garantie_maanden"
    t.string   "soort"
    t.text     "opmerking"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artsen", force: true do |t|
    t.integer  "user_id"
    t.string   "naam"
    t.string   "specialiteit"
    t.text     "beschrijving"
    t.string   "telefoon"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bereidingen", force: true do |t|
    t.integer  "user_id"
    t.integer  "recept_id"
    t.date     "datum"
    t.text     "opmerking"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "omschrijving"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "dossiers", force: true do |t|
    t.integer  "user_id"
    t.integer  "persoon_id"
    t.integer  "arts_id"
    t.string   "instelling"
    t.string   "soort_opname"
    t.date     "datum_onderzoek"
    t.date     "datum_document"
    t.string   "soort_document"
    t.string   "eigen_referentie"
    t.decimal  "te_betalen"
    t.string   "betaald",                  default: "Nee"
    t.string   "ziekenkas_verzonden",      default: "Nee"
    t.decimal  "ziekenkas_terug_bedrag"
    t.string   "verzekering_verzonden",    default: "Nee"
    t.decimal  "verzekering_terug_bedrag"
    t.text     "beschrijving"
    t.string   "afgehandeld",              default: "Nee"
    t.text     "resultaat"
    t.string   "medicatie"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "meterstanden", force: true do |t|
    t.integer  "user_id"
    t.string   "meter"
    t.date     "datum"
    t.decimal  "stand"
    t.decimal  "verbruik"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notities", force: true do |t|
    t.integer  "user_id"
    t.string   "notitie"
    t.boolean  "belangrijk"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "onderhouden", force: true do |t|
    t.integer  "aankoop_id"
    t.integer  "user_id"
    t.date     "datum_onderhoud"
    t.date     "volgende_onderhoud"
    t.text     "opmerking"
    t.decimal  "prijs"
    t.integer  "teller"
    t.string   "teller_eh"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personen", force: true do |t|
    t.integer  "user_id"
    t.string   "naam"
    t.string   "voornaam"
    t.date     "geboortedatum"
    t.string   "soort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "producten", force: true do |t|
    t.integer  "user_id"
    t.string   "naam"
    t.string   "soort"
    t.integer  "score"
    t.string   "land"
    t.string   "winkel"
    t.decimal  "prijs"
    t.string   "eenheid"
    t.text     "opmerking"
    t.string   "seizoen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recepten", force: true do |t|
    t.integer  "user_id"
    t.string   "naam"
    t.string   "bron"
    t.string   "soort"
    t.integer  "bereidingstijd"
    t.integer  "moeilijkheidsgraad"
    t.integer  "personen"
    t.text     "werkwijze"
    t.text     "ingredient"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tips", force: true do |t|
    t.integer  "user_id"
    t.text     "tip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",               default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "locked",                 default: false, null: false
    t.string   "slug"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "websites", force: true do |t|
    t.string   "sitenaam"
    t.string   "url"
    t.integer  "count"
    t.integer  "user_id"
    t.string   "categorie"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "laatste_bezoek"
    t.integer  "categorie_id"
  end

end
