class Post < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :company, optional: true
end
