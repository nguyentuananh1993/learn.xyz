class LearningLogsController < ApplicationController
  before_action :set_learning_log, only: [:show, :edit, :update, :destroy]

  # GET /learning_logs
  # GET /learning_logs.json
  def index
    @learning_logs = LearningLog.all
    
    @word_learning_logs  = current_user.learning_logs.all
    
    @groups_for_chart = @word_learning_logs.to_a.group_by{|x| x.created_at.beginning_of_day}
    .map{|group| [group[0].strftime("%F"), group[1].map(&:learned_word).sum]}
  end

  # GET /learning_logs/1
  # GET /learning_logs/1.json
  def show
  end

  # GET /learning_logs/new
  def new
    @learning_log = LearningLog.new
  end

  # GET /learning_logs/1/edit
  def edit
  end

  # POST /learning_logs
  # POST /learning_logs.json
  def create
    @learning_log = LearningLog.new(learning_log_params)

    respond_to do |format|
      if @learning_log.save
        format.html { redirect_to @learning_log, notice: 'Learning log was successfully created.' }
        format.json { render :show, status: :created, location: @learning_log }
      else
        format.html { render :new }
        format.json { render json: @learning_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_logs/1
  # PATCH/PUT /learning_logs/1.json
  def update
    respond_to do |format|
      if @learning_log.update(learning_log_params)
        format.html { redirect_to @learning_log, notice: 'Learning log was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning_log }
      else
        format.html { render :edit }
        format.json { render json: @learning_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_logs/1
  # DELETE /learning_logs/1.json
  def destroy
    @learning_log.destroy
    respond_to do |format|
      format.html { redirect_to learning_logs_url, notice: 'Learning log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_log
      @learning_log = LearningLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learning_log_params
      params.require(:learning_log).permit(:learned_word, :user_id)
    end
end
