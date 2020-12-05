# frozen_string_literal: true
# This migration comes from caffeinate (originally 20201124183419)

class CreateCaffeinateMailings < ActiveRecord::Migration[6.0]
  def change
    drop_table :caffeinate_mailings if table_exists?(:caffeinate_mailings)

    create_table :caffeinate_mailings do |t|
      t.references :caffeinate_campaign_subscription, null: false, foreign_key: true, index: { name: 'index_caffeinate_mailings_on_campaign_subscription' }
      t.datetime :send_at
      t.datetime :sent_at
      t.datetime :skipped_at
      t.string :mailer_class, null: false
      t.string :mailer_action, null: false

      t.timestamps
    end
    add_index :caffeinate_mailings, :sent_at
    add_index :caffeinate_mailings, :send_at
    add_index :caffeinate_mailings, :skipped_at
    add_index :caffeinate_mailings, %i[caffeinate_campaign_subscription_id mailer_class mailer_action], name: :index_caffeinate_mailings
  end
end
