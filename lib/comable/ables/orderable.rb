module Comable
  module Able
    module Orderable
      def self.included(base)
        base.instance_eval do
          belongs_to :customer, class_name: Comable::Customer.name, foreign_key: Comable::Customer.name.foreign_key, autosave: false
          has_many :order_deliveries, dependent: :destroy, class_name: Comable::OrderDelivery.name

          accepts_nested_attributes_for :order_deliveries

          validates :family_name, presence: true
          validates :first_name, presence: true

          before_create :generate_code
        end
      end

      private

      def generate_code
        utusemi(:order).instance_eval do
          self.code = loop do
            random_token = SecureRandom.urlsafe_base64(nil, false)
            break random_token unless self.class.exists?(code: random_token)
          end
        end
      end
    end
  end
end