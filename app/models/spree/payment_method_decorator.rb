module Spree
	PaymentMethod.class_eval do

	  def self.included(base)
	    base.prepend(InstanceMethods)
	  end

	  module InstanceMethods
	    def store_credit?
	      self.class == Spree::PaymentMethod::StoreCredit
	    end
	  end
	end
end

# Spree::PaymentMethod.include SpreeStoreCredits::PaymentMethodDecorator
