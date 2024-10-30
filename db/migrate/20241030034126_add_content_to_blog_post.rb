class AddContentToBlogPost < ActiveRecord::Migration[8.0]
  def change
    add_column :blog_posts, :content, :text
  end
end
