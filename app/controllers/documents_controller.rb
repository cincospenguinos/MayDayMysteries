# frozen_string_literal: true

class DocumentsController < ApplicationController
  def show
    @document = Document.find_by_id(document_params[:id])
    render file: "#{Rails.root}/public/404.html", status: :not_found if @document.nil?
  end

  def index
    @documents = Document.all
  end

  private

  def document_params
    params.permit(:id)
  end
end
