class PhotosController < ApplicationController
  def index
    @photos = Photo.all

  end

  def show
    @photo = Photo.find(params[:id])

  end

  def new
    @photo = Photo.new
    @photo.user_id = current_user.id
  end

  def create
    @photo = Photo.new
    @photo.image_url = params[:image_url]
    @photo.caption = params[:caption]
    @photo.user_id = current_user.id

    if @photo.save
      redirect_to "/photos/", :notice => "Photo created successfully."
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    @photo.user_id = current_user.id
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.image_url = params[:image_url]
    @photo.caption = params[:caption]
    @photo.user_id = params[:user_id]

    if @photo.save
      redirect_to "/photos", :notice => "Photo updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    @photo.destroy

    redirect_to "/photos", :notice => "Photo deleted."
  end


  def favorites

  @photos = current_user.favorite_photos

  end

  def wall

  @photos = current_user.photos

  end


end
