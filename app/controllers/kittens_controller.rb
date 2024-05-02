class KittensController < ApplicationController
    before_action :set_kitten, only: [:show, :edit, :update, :destroy]

    def new
        @kitten = Kitten.new
    end

    def index
        @kittens = Kitten.all
    end

    def show 
    end

    def edit
    end

    def create
        @kitten = Kitten.new(kitten_params)
        
        respond_to do |format|
            if @kitten.save
                format.html { redirect_to kitten_url(@kitten), notice: "Your kitten is immortalized!!" }
            else
                format.html { render :new, status: :unprocessable_entity, alert: "You suck at creating kittens"}
            end
        end
    end

    def update
        respond_to do |format|
          if @kitten.update(kitten_params)
            format.html { redirect_to kittens_url(@kitten), notice: "Kitten info was updated!." }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
      end

    def destroy
        @kitten.destroy!
        respond_to do |format|
            format.html { redirect_to kittens_url, alert: "Oh noes, poor kitty... Shame! Shame Shame!" }
          end
    end

    private
    def set_kitten
     @kitten = Kitten.find(params[:id])
    end
    def kitten_params
      params.require(:kitten).permit(:name,:age,:cuteness,:softness)
    end

end
