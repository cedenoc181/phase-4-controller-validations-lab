class AuthorsController < ApplicationController
# rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity


  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)
      # if author
    render json: author, status: :created
      # else 
      #   render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  rescue ActiveRecord::RecordInvalid => invalid
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity 
      # end
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  # def render_unprocessable_entity(invalid)
  #   render json: { errors: invalid.record.errors}, status: :unprocessable_entity

  # end 
end
