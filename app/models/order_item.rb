# == Schema Information
#
# Table name: order_items
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  order_id    :integer
#  unit_price  :decimal(12, 3)
#  quantity    :integer
#  total_price :decimal(12, 3)
#  created_at  :datetime
#  updated_at  :datetime
#

class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def untit_price
    if presisnted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

private

  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not valid order.")
    end
  end

  def finalize
    self[:unti_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
