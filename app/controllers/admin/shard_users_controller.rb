class Admin::ShardUsersController < Admin::SpaceController
  load_and_authorize_resource :class => 'Assignment'
  def index
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shards }
    end
  end
  def add
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    note='User not found or already exists'
    Role.shard_roles.where("id in (?)", params[:role_ids]).each do |role|
      if(u=User.find_by_email(params[:user_email]))
        if(!u.has_role_for_shard?(role,@shard))
          note = 'User added'
          a=u.assignments.new
          a.role= role
          a.shard = @shard
          a.save!
        end
      end
    end
    respond_to do |format|
      format.html { redirect_to admin_shard_shard_users_path(@shard), notice: note }
    end
  end
  def revoke
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    assignment=@shard.assignments.find(params[:assignment_id]) || not_found
    if(assignment.destroy)
      note = 'Assignment revoked'
    end
    respond_to do |format|
      format.html { redirect_to admin_shard_shard_users_path(@shard), notice: note }
    end
  end
end
