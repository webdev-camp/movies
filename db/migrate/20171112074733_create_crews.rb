class CreateCrews < ActiveRecord::Migration[5.1]
  def change
    create_table :crews do |t|
      t.string :department
      t.string :crew_list

      t.timestamps
    end
  end
end
