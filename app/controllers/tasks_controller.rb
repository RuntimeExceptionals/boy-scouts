class TasksController < ActionController::Base
    def set_task
      #Used in view_route's view to mark or unmark tasks as completed

      @response = {}
      sub = Subscription.find(params[:sub_id])
      run = Run.find(params[:run_id])
      req = params[:request]
      desc = params[:desc]

      if run.finished?
        @response["message"] = "Run is no longer available to update."
        @response["type"] = "error"

      end

      if req == "create"
          @task = Task.create!(:subscription_id => sub.id, :run_id => run.id, :qty => sub.qty, :description => desc) unless !Task.where(:run_id => run.id, :subscription_id => sub.id).blank?
      end

      if req == "destroy"
          @tasks = Task.where(:run_id => run.id, :subscription_id => sub.id)
          if !@tasks.blank?
            @tasks.each do |t|
              t.destroy!
            end
          end
      end

      @response["message"] = "Run updated."
      @response["type"] = "success"

      render json: @response
    end
end
