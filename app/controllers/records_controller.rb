class RecordsController < ApplicationController
  before_action :set_record, only: %i[show edit update destroy]

  def show; end

  def new
    @category = Category.find(params[:category_id])
    @record = Record.new
  end

  def create
    @category = Category.find(params[:category_id])
    @record = @category.records.create(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to category_path(@category), notice: 'Transaction was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @record.destroy
    @category = Category.find(params[:category_id])

    respond_to do |format|
      format.html { redirect_to category_path(@category), notice: 'Transaction was removed successfully.' }
      format.json { head :no_content }
    end
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:user_id, :name, :amount)
  end
end
