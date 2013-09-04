class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text    :content
      t.integer  :author_id #t.belongs_to :author?

      t.timestamps
    end
  end
end
