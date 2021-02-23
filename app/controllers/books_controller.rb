class BooksController < ApplicationController
  before_action :preedit,only: [:edit]
def new
    @book=Book.new
end

def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @book.save
    if @book.save
      flash[:notice]="Book was successfully Created"
      redirect_to book_path(@book)
    else
      @books=Book.all
      render :index
    end
end

def index
     @book=Book.new
     @books=Book.all
     @user = current_user

end

def show
    @book2=Book.new
    @book=Book.find(params[:id])
     @user = @book.user
    #  @user2=User.find(params[:id])
end

def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice]="Book was successfully destroyed"
    redirect_to books_path
end

  def edit
    @book=Book.find(params[:id])
  end

  def preedit
    @book=Book.find(params[:id])
if @book.user != current_user
  redirect_to books_path
end
  end

  def update
    @book=Book.find(params[:id])
    @book.update(book_params)

        if @book.update(book_params)
    flash[:notice]="Book was successfully Update"
    redirect_to book_path(@book)
    else

      render :edit
    end
    end




private

def book_params
    params.require(:book).permit(:title, :body)
end


end
