class Sticker < ApplicationRecord

  enum status: {active: 0, inactive: 1, draft: 2 }
  enum type_note: {type_public: 0, type_private: 1}
end
