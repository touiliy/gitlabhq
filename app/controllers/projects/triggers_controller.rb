class Projects::TriggersController < Projects::ApplicationController
  before_action :authorize_admin_project!

  layout 'project_settings'

  def index
    @triggers = project.ci_triggers
    @trigger = Ci::Trigger.new
  end

  def create
    @trigger = project.ci_triggers.new
    @trigger.save

    if @trigger.valid?
      redirect_to namespace_project_triggers_path(@project.namespace, @project)
    else
      @triggers = project.ci_triggers.select(&:persisted?)
      render :index
    end
  end

  def destroy
    trigger.destroy

    redirect_to namespace_project_triggers_path(@project.namespace, @project)
  end

  private

  def trigger
    @trigger ||= project.ci_triggers.find(params[:id])
  end
end
