class BranchesController < ApplicationController
  before_action :authenticate_user!
  def index
    branches = Branch.order(:id).all
    render json: branches
  end

  def create
    if current_user.role == 'admin'
      branch = Branch.new(branch_params)
      if branch.save
        render json: branch, status: :created
      else
        render json: branch.errors, status: :unprocessable_entity
      end
    else
      render json: 'Access not allowed !'
    end
  end

  def show
    branch = Branch.find(params[:id])
    render json: branch
  end

  private

  def branch_params
    params.require(:branch).permit(:city)
  end
end
