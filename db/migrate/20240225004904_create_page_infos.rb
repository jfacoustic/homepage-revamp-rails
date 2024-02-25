class CreatePageInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :page_infos do |t|
      t.string :path
      t.text :body

      t.timestamps
    end
  end
end
