class CpProductsController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @cp_product = CpProduct.new
  end

  def create
    @job = Job.find(params[:job_id])
    @cp_product = CpProduct.new(cp_product_params)
    @cp_product.job = @job
    if @cp_product.save
      redirect_to :back, notice: "created!"
    else
      render :back, alert:"增加失败！"
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @cp_product = CpProduct.find(params[:id])
    if @cp_product.destroy
      redirect_to :back, alert: "deleted!"
    end
  end

  private
  def cp_product_params
    params.require(:cp_product).permit(:product_image, :title, :description)
  end
end