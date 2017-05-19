class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.string :title
      t.date :date
      t.string :body

      t.timestamps
    end
  end
end
