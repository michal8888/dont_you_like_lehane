# HANDLE ALL BOOKS WRITTEN BY LEHANE
class BooksController < ApplicationController
  before_action :set_user, only: %i[new create edit update destroy]
  before_action :require_admin, only: %i[new create edit update destroy]
  before_action :set_reader, only: [:show]
  before_action :set_future_reader, only: [:show]
  before_action :set_book, only: %i[show edit update destroy]

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/1
  def show
    @comments = @book.comments
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html do
          redirect_to @book, notice: "Book was successfully created."
        end
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html do
          redirect_to @book, notice: "Book was successfully updated."
        end
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    respond_to do |format|
      format.html do
        redirect_to books_url, notice: "Book was successfully deleted."
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:title, :description, :picture, :published_at)
  end
end
