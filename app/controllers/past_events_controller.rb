class PastEventsController < ApplicationController

  hobo_model_controller

  auto_actions [:index, :show]

  before_filter :login_required, :except => [ :index, :show ]


  def hobo_index
    # full_calendar will hit the index method with query parameters
    # 'start' and 'end' in order to filter the results for the
    # appropriate month/week/day.  It should be possiblt to change
    # this to be starts_at and ends_at to match rails conventions.
    # I'll eventually do that to make the demo a little cleaner.
    @events = Event.scoped
    @events = @events.order("starts_at")
    @events = @events.past(Time.now)
    @events = @events.after(params['start']) if (params['start'])
    @events = @events.before(params['end']) if (params['end'])
    @events = @events.paginate(:page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.js  { render :json => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def hobo_show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
      format.js { render :json => @event.to_json }
    end
  end

end