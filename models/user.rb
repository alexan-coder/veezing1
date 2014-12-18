class User < ActiveRecord::Base
has_many :zings
self.table_name = "ar_users"
end

# all students belong to a teacher but a teahcer has many students
