class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :end
      t.string :reason
      t.datetime :start

      t.timestamps
    end
  end
end
