class StoreController < ApplicationController
  def create
    @folder_name = params[:folder]
    @img_name = params[:image].original_filename
    dir = "./app/assets/#{@folder_name}"
    Dir.mkdir(dir) unless Dir.exists?(dir)
      File.open("./app/assets/#{@folder_name}/#{@img_name}", "w") do |file|
      file.write params[:image]
      redirect_to tuto9_path, notice:"Enter folder name"
    end
  end
end