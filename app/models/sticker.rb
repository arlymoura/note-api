class Sticker < ApplicationRecord
  before_save :default_values

  enum status: {active: 0, inactive: 1, draft: 2 }
  enum type_note: {type_public: 0, type_private: 1}

  is_impressionable :counter_cache => true, :column_name => :view_count

  def default_values
    self.view_count ||= 0 
  end
end
