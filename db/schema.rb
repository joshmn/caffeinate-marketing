# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_05_220255) do

  create_table "ahoy_events", force: :cascade do |t|
    t.integer "visit_id"
    t.integer "user_id"
    t.string "name"
    t.text "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.integer "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "caffeinate_campaign_subscriptions", force: :cascade do |t|
    t.integer "caffeinate_campaign_id", null: false
    t.string "subscriber_type", null: false
    t.string "subscriber_id", null: false
    t.string "user_type"
    t.string "user_id"
    t.string "token", null: false
    t.datetime "ended_at"
    t.string "ended_reason"
    t.datetime "resubscribed_at"
    t.datetime "unsubscribed_at"
    t.string "unsubscribe_reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caffeinate_campaign_id"], name: "caffeineate_campaign_subscriptions_on_campaign"
    t.index ["subscriber_id", "subscriber_type", "user_id", "user_type"], name: "index_caffeinate_campaign_subscriptions"
    t.index ["token"], name: "index_caffeinate_campaign_subscriptions_on_token", unique: true
  end

  create_table "caffeinate_campaigns", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_caffeinate_campaigns_on_slug", unique: true
  end

  create_table "caffeinate_mailings", force: :cascade do |t|
    t.integer "caffeinate_campaign_subscription_id", null: false
    t.datetime "send_at"
    t.datetime "sent_at"
    t.datetime "skipped_at"
    t.string "mailer_class", null: false
    t.string "mailer_action", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"campaign_subscription_id\", \"mailer_class\", \"mailer_action\"", name: "index_caffeinate_mailings"
    t.index ["caffeinate_campaign_subscription_id"], name: "index_caffeinate_mailings_on_campaign_subscription"
    t.index ["send_at"], name: "index_caffeinate_mailings_on_send_at"
    t.index ["sent_at"], name: "index_caffeinate_mailings_on_sent_at"
    t.index ["skipped_at"], name: "index_caffeinate_mailings_on_skipped_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "caffeinate_campaign_subscriptions", "caffeinate_campaigns"
  add_foreign_key "caffeinate_mailings", "caffeinate_campaign_subscriptions"
end
