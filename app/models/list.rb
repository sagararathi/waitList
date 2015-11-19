class List < ActiveRecord::Base
  validates :name, :mobile, presence:true
end