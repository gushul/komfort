# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :decimal(12, 3)
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Product < ActiveRecord::Base
end
