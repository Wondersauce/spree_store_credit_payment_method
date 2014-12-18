module SpreeStoreCredits::AdminReimbursementsControllerDecorator
  def self.prepended(base)
    base.after_action :set_created_by, only: :perform
  end

  def set_created_by
    if @reimbursement.credits.any?
      @reimbursement.credits.each do |credit|
        if credit.creditable.is_a?(Spree::StoreCredit)
          credit.creditable.created_by = try_spree_current_user
          credit.creditable.save        
        end
      end
    end      
  end
end

Spree::Admin::ReimbursementsController.prepend SpreeStoreCredits::AdminReimbursementsControllerDecorator