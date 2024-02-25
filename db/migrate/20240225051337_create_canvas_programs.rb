class CreateCanvasPrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :canvas_programs do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
