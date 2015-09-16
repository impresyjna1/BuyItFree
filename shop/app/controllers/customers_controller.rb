class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def edit
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      current_user.customer = @customer
      flash[:success] = "Zapisano dane"
      redirect_to current_user
    else
      flash[:warning] = "Nie udało się zapisać danych" 
      render 'new'
    end
  end
  
  private

    def customer_params
      params.require(:customer).permit(:name, :surname, :address,
                                   :post_code, :city)
    end
  
end
