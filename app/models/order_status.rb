# == Schema Information
#
# Table name: order_statuses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class OrderStatus < ActiveRecord::Base
end
