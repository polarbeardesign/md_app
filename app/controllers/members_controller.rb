class MembersController < ApplicationController

  skip_before_filter :check_authorization, :check_authentication, :only => [:index, :member_application, :member_application_received, :create]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
    @page = Page.find_by_id(8)

    @member = Member.new
    user = @member.build_user
    @roles = Role.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @members }
    end
  end

  def member_admin
    @members = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new
    user = @member.build_user
    @roles = Role.find(:all)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
		@roles = Role.find(:all)
  end

  # show member application profile
  def member_application_received
    @member = Member.find(params[:id])
    @page = Page.find_by_id(9)
    #@products = Product.membership.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @member }
    end
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    @roles = Role.find(:all)

    checked_roles = []
    checked_params = params[:role_list] || []
    for check_box_id in checked_params
      role = Role.find(check_box_id)
      if not @member.user.roles.include?(role)
        @member.user.roles << role
      end
      checked_roles << role
    end

    respond_to do |format|
      if @member.save
        if params[:Submit] == "Submit Application" 
          MemberApplicationNotifier.created(@member).deliver
          format.html { redirect_to member_application_received_path(:id => @member), :notice => 'Application was successfully submitted and a copy has been emailed for your records.' }
          format.json { head :ok }
        else
          format.html { redirect_to @member, :notice => 'Member was successfully created.' }
          format.json { render :json => @member, :status => :created, :location => @member }
        end
      else
        format.html { render :action => "new" }
        format.json { render :json => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    @roles = Role.find(:all)

		if params[:commit] == "Update Member"
			checked_roles = []
			checked_params = params[:role_list] || []
				for check_box_id in checked_params
					role = Role.find(check_box_id)
				if not @member.user.roles.include?(role)
					@member.user.roles << role
				end
			checked_roles << role
			end
			missing_roles = @roles - checked_roles
			for role in missing_roles
				if @member.user.roles.include?(role)
				@member.user.roles.delete(role)
				end
			end
		end

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, :notice => 'Member was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :ok }
    end
  end
end
