class Video < ActiveRecord::Base
has_many :zings
has_many :users, through: :zings
end