class CreateUploaders < ActiveRecord::Migration[6.0]
  def change
    create_table :uploaders do |t|
      t.text :content

      t.timestamps
    end
  end
end
