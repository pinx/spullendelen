class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]
  before_action :set_member, only: [:index, :edit, :destroy]
  skip_before_action :authenticate_member!, only: :index   # visitors are allowed to see the list of things
  respond_to :html

  def index
    if @member
      @things = @member.things.decorate
    else
      @things = Thing.all.decorate
    end
  end

  def my
    @member = current_member
    @things = current_member.things.decorate
    render :index
  end

  def new
    @thing = Thing.new
  end

  def create
    @thing = Thing.new(thing_params)
    @thing.member_id = current_member.id
    respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Thing was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @thing.can_be_updated_by?(current_member) && @thing.update(thing_params)
        format.html { redirect_to @thing, notice: 'Thing was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @thing.destroy
    respond_to do |format|
      format.html { redirect_to things_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_thing
    @thing = Thing.find(params[:id])
  end

  def set_member
    @member = nil
    member_id = params[:member_id]
    @member = Member.find(member_id) if member_id
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def thing_params
    params.require(:thing).permit(:member_id, :category_id,
                                  :source, :source_id,
                                  :source_url, :asset_id,
                                  :name, :creator,
                                  :price, :description,
                                  :story, :borrow_everyone,
                                  :borrow_circles, :borrow_friends)
  end
end
