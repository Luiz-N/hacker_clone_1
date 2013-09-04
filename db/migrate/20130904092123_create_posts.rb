class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string    :title
      t.string    :url
      t.text      :content
      t.integer   :author_id #t.belongs_to :author?

      t.timestamps
    end
  end
end

