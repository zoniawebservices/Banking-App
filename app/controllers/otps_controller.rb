class OtpsController < ApplicationController
  layout "account"
    #before_action :find_Account
    before_action :authenticate_user!

def new


end
    def create
      @transfer = Transfer.find(params[:transfer_id])
      @otp = @transfer.otps.create(otp_params)
      @otp.user_id = current_user.id
       if @otp.save
         redirect_to transfer_otp_path(@transfer, @otp)
       else
         render "new"
       end
    end

    private
    def find_account
      @account = Account.find(params[:id])
    end
    def find_transfer
      @transfer = @account.transfers.find(params[:id])
    end

    def find_otp
    end

    def otp_params
      params.require(:otp).permit( :user_id, :account_id, :otp)
    end


end
