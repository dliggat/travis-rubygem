require 'active_model'
require 'hashie'
require 'pelokit/concerns/request'

module Pelokit
  class BankAccount < Hashie::Dash

    include Pelokit::Request
    include ActiveModel::Validations

    property :bank_account_id
    property :bank_account_name
    property :bank_account_owner
    property :bank_account_type_code
    property :financial_insitution_number
    property :branch_transit_number
    property :account_number
    property :currency_code,             default: 'CAD'
    property :verify_account_by_deposit, default: '1'

    validates :financial_insitution_number, presence: true,
                                            format:   { with: /\A[0-9]+\z/, message: "must be numeric" }
    validates :branch_transit_number, presence: true,
                                      format:   { with: /\A[0-9]+\z/, message: "must be numeric" }
    validates :account_number, presence: true,
                               format:   { with: /\A[0-9]+\z/, message: "must be numeric" }
    validates :bank_account_type_code, inclusion: %w[0 1]
    validates :currency_code, inclusion: %w[USD CAD]


    def add
      response = request :add_bank_account, :addBankAccountRequest
      response
    end

    # def update
    #   request :modify_bank_account, :modifyBankAccountRequest
    # end

  end
end
