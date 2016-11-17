class CreateLadybugs < ActiveRecord::Migration
  def change

    create_table :lady_bugs do |t|

      t.string :name
      t.string :color
      t.string :sex

      t.integer :age

      t.timestamps

    end
  end
end
