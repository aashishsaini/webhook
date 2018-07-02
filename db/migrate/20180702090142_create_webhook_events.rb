class CreateWebhookEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :webhook_events do |t|
      t.references :issue
      t.string :action
      t.text :response_body

      t.timestamps
    end
  end
end
