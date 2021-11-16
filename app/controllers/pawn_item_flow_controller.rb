class PawnItemFlowController < ApplicationController
  def new_customer
    @customer = Customer.new
    @path = save_customer_pawn_item_flow_path
    render 'customers/new'
  end

  def save_customer
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to item_pawn_item_flow_path(customer_id: @customer.id), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_item
    @item = Item.new
    @path = save_item_pawn_item_flow_path
    render 'items/new'
  end

  def save_item
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to loan_pawn_item_flow_path(customer_id: params[:customer_id], item_id: @item.id), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_loan
    @loan = Loan.new(customer_id: params[:customer_id], item_id: params[:item_id])
    @path = save_loan_pawn_item_flow_path
    render 'loans/new'
  end

  def save_loan
    @loan = Loan.new(loan_params)

    respond_to do |format|
      if @loan.save
        format.html { redirect_to loans_path, notice: "Loan was successfully created." }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address_line_one, :address_line_two, :state, :city, :zip, :phone_number)
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :sku, :price, :cost, :pawned, :released_at, :stocked_at, :sold_at, :customer_id)
  end

  # Only allow a list of trusted parameters through.
  def loan_params
    params.require(:loan).permit(:customer_id, :item_id, :principal, :interest_rate, :maturity_date, :default_date)
  end
end
