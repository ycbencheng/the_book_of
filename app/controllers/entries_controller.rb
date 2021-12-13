class EntriesController < ApplicationController
  def index
    render json: { entries: list_of_entries, status: :success }
  end

  def create
    entry = current_user.entries.create(body: entry_params[:body])

    if entry.save
      render json: { entries: list_of_entries, status: :success }
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

  def list_of_entries
    Entry.where(user_id: current_user.id).order(created_at: :desc).map do |entry|
      { id: entry.id,
        body: entry.body,
        created_at: entry.created_at.strftime("%m/%d/%Y")}
    end
  end
end
