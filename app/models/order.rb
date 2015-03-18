# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  subtotal        :decimal(12, 3)
#  tax             :decimal(12, 3)
#  shipping        :decimal(12, 3)
#  total           :decimal(12, 3)
#  order_status_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Order < ActiveRecord::Base
  belongs_to    :order_status
  has_many      :order_items
  before_create :set_order_status
  before_save   :update_subtotal

  def subtotal
    order_items.collect { |order_item| order_item.valid? ? (order_item.quantity * order_item.unit_price) : 0 }.sum
  end

  private

  def set_order_status
    self.order_status_id
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
