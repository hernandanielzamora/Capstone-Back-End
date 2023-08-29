class BranchesController < ApplicationController
  def index
    branches = Branch.order(:id).all
    render json: branches
  end
  
  def show
    branch = Branch.find(params[:id])
    render json: branch
  end
end
