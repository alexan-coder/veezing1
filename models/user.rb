class User < ActiveRecord::Base
has_many :zings
end

# all students belong to a teacher but a teahcer has many students
