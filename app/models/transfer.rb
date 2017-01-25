class Transfer < ActiveRecord::Base
  # RELATIONS
  belongs_to :receiver_account, class_name: 'Account', foreign_key: 'receiver_account_id'
  belongs_to :sender_account, class_name: 'Account', foreign_key: 'sender_account_id'


  # VALIDATIONS
  validates :amount, :receiver_account, presence: true

  def to_s
    "#{amount}€ #{receiver_account.client.full_name}"
  end
end
