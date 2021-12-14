class EntriesController < ApplicationController
  def index
    render json: { user: User.find(params['user_id']), entries: list_of_entries(params['user_id']), status: :success }
  end

  def create
    entry = current_user.entries.create(body: entry_params[:body])

    if entry.save
      render json: { user: current_user, entries: list_of_entries(current_user.id), status: :success }
    else
      render json: { status: :failed }
    end
  end

  def update
    entry = current_user.entries.find(entry_params[:id])

    if entry.update(body: entry_params[:body])
      render json: { status: :success }
    else
      render json: { status: :failed }
    end
  end

  def destroy
    entry = current_user.entries.find(entry_params[:id])

    if entry.destroy
      render json: { status: :success }
    else
      render json: { status: :failed }
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:id, :user_id, :body)
  end

  def list_of_entries(user_id)
    user_id = user_id.nil? ? current_user.id : user_id

    Entry.where(user_id: user_id).order(created_at: :desc).map do |entry|
      { id: entry.id,
        body: entry.body,
        created_at: entry.created_at.strftime("%m/%d/%Y")}
    end
  end
end
