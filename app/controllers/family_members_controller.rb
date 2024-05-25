class FamilyMembersController < ApplicationController
  before_action :set_family_member, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /family_members or /family_members.json
  def index
    @family_members = current_user.family_members.includes(:person).all
  end


  # GET /family_members/1 or /family_members/1.json
  def show
  end

  # GET /family_members/new
  def new
    @family_member = current_user.family_members.new
    @person = @family_member.build_person
  end

  # GET /family_members/1/edit
  def edit
  end

  # POST /family_members or /family_members.json
  def create
    @family_member = current_user.family_members.new(family_member_params)

    if @family_member.save
      redirect_to family_members_path, notice: 'Family member was successfully created.'
    else
      @person = @family_member.build_person
      render :new
    end
  end

  def add_self
    @person = Person.new(
      first_name: current_user.profile.first_name,
      last_name: current_user.profile.last_name,
      patronym: current_user.profile.patronym,
      phone_number: current_user.profile.tel,
      address: current_user.profile.address,
      date_of_birth: current_user.profile.date_of_birth
    )
    @family_member = current_user.family_members.new(family_member_name: 'You', person: @person)

    if @person.save && @family_member.save
      redirect_to family_members_path, notice: 'You have been added as a family member.'
    else
      redirect_to family_members_path, alert: 'Unable to add yourself as a family member.'
    end
  end

  # PATCH/PUT /family_members/1 or /family_members/1.json
  def update
    respond_to do |format|
      if @family_member.update(family_member_params)
        format.html { redirect_to family_member_url(@family_member), notice: "Family member was successfully updated." }
        format.json { render :show, status: :ok, location: @family_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_members/1 or /family_members/1.json
  def destroy
    @family_member.destroy!

    respond_to do |format|
      format.html { redirect_to family_members_url, notice: "Family member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_family_member
    @family_member = FamilyMember.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def family_member_params
    params.require(:family_member).permit(:family_member_name, person_attributes: [:first_name, :last_name, :patronym, :phone_number, :address, :date_of_birth])
  end
end
