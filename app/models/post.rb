class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def comment_count
      comments.length
  end

  def categories_attributes= category_attrs
    category_attrs.value.each do |cat_attr|
      self.categories << Category.find_or_create_by(cat_attr)
    end

  end

end
